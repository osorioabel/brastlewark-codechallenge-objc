//
//  GnomesListViewController.m
//  Brastlewark-Objc
//
//  Created by Abel Osorio on 2/11/17.
//  Copyright © 2017 Abel Osorio. All rights reserved.
//

#import "GnomesListViewController.h"
#import "GnomesListViewModel.h"
#import "GnomeCell.h"
#import <libextobjc/EXTScope.h>
#import "UIScrollView+EmptyDataSet.h"


@interface GnomesListViewController () <UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating,UISearchBarDelegate,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@property (nonatomic, strong, readonly) GnomesListViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UISearchController *searchController;

@end

@implementation GnomesListViewController

#pragma mark - Lifecycle

- (instancetype)initWithViewModel:(GnomesListViewModel *)viewModel {
	self = [super initWithNibName:@"GnomesListViewController" bundle:nil];
	if (!self) return nil;
	
	_viewModel = viewModel;
	
	return self;
}

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
	[self setupView];
	[self bindViewModel];
}

#pragma mark - Internal helpers
- (void)setupView{
	self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
	[self setupTableView];
	[self setupSearchController];
}

- (void) setupTableView{
	
	[self.tableView registerNib:[UINib nibWithNibName:@"GnomeCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"GnomeCell"];
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	self.tableView.rowHeight = 263;
	self.tableView.backgroundColor = [UIColor blackColor];
	self.tableView.emptyDataSetSource = self;
	self.tableView.emptyDataSetDelegate = self;
	self.tableView.tableFooterView = [UIView new];

}

- (void)setupSearchController{
	self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
	self.searchController.searchResultsUpdater = self;
	self.searchController.dimsBackgroundDuringPresentation = NO;
	self.searchController.hidesNavigationBarDuringPresentation = NO;
	self.searchController.searchBar.placeholder = @"Type the name of the gnome";
	self.searchController.searchBar.delegate = self;
	self.definesPresentationContext = YES;
	[self.searchController.searchBar sizeToFit];
	for ( UIView *v in [self.searchController.searchBar.subviews.firstObject subviews] )
	{
		if ( YES == [v isKindOfClass:[UITextField class]] )
		{
			[((UITextField*)v) setTintColor:[UIColor blackColor]];
			break;
		}
	}
	
	self.navigationItem.titleView = self.searchController.searchBar;
	
}

#pragma mark - Bindings

- (void)bindViewModel {
	

	@weakify(self);
	
	[[self.viewModel.hasUpdatedContent
	  deliverOnMainThread] // important, or view won't update instantly
	 subscribeNext:^(id _) {
		 @strongify(self); // this, together with @weakify, prevents a retain cycle
		 NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:0];
		 [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
	 }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.viewModel numberOfGnomesInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	GnomeCell *cell = (GnomeCell*) [tableView dequeueReusableCellWithIdentifier:@"GnomeCell" forIndexPath:indexPath];
	[cell updateWithGnome: [self.viewModel gnomeAtIndexPath:indexPath]];
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	[self.viewModel showDetailOfGnome:[self.viewModel gnomeAtIndexPath:indexPath]];
}

#pragma mark - SearchController Related Methods

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
	if (![searchController.searchBar.text isEqualToString:@""]) {
		self.viewModel.shouldDisplaySearchResults = YES;
		[self.viewModel filterGnomesWithQuery:searchController.searchBar.text];
		[self.tableView reloadData];
	}
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
	if (!self.viewModel.shouldDisplaySearchResults) {
		self.viewModel.shouldDisplaySearchResults = YES;
		[self.tableView reloadData];
	}
	[self.searchController.searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
	self.viewModel.shouldDisplaySearchResults = NO;
	self.searchController.searchBar.text = @"";
	[self.tableView reloadData];
}

#pragma mark - EmptyStateDatasource

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
	NSString *text = self.viewModel.shouldDisplaySearchResults ? @"NO RESULTS FOUND" : @"";
	
	NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:24.0f],
								 NSForegroundColorAttributeName: [UIColor whiteColor]};
	
	return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

@end
