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


@interface GnomesListViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong, readonly) GnomesListViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

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
	[self.tableView registerNib:[UINib nibWithNibName:@"GnomeCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"GnomeCell"];
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	self.tableView.rowHeight = 263;
	self.tableView.backgroundColor = [UIColor blackColor];
	[self bindViewModel];
}

#pragma mark - Bindings

- (void)bindViewModel {
	
	self.title = [self.viewModel title];
	
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

@end
