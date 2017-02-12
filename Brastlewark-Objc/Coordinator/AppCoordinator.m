//
//  AppCoordinator.m
//  Brastlewark-Objc
//
//  Created by Abel Osorio on 2/11/17.
//  Copyright © 2017 Abel Osorio. All rights reserved.
//

#import "AppCoordinator.h"
#import "GnomesListViewController.h"
#import "GnomeDetailViewController.h"
#import "GnomesListViewModel.h"
#import "GnomeDetailViewModel.h"


@implementation AppCoordinator

@synthesize rootViewcontroller,navigationController;

-(void)start{
	self.rootViewcontroller = [self createGnomesListViewController];
}

-(UINavigationController*)createGnomesListViewController{
	

	GnomesListViewModel *gnomeListVM = [[GnomesListViewModel alloc] initAndGetGnomes];
	gnomeListVM.delegate = self;
	GnomesListViewController *gnomesListVC = [[GnomesListViewController alloc] initWithViewModel:gnomeListVM];
	
	UINavigationController* navVC = [[UINavigationController alloc] initWithRootViewController:gnomesListVC];
	self.navigationController = navVC;
	return navVC;
}

-(void)pushToDetailViewControllerWithGnome:(Gnome*)gnome{
	
	GnomeDetailViewModel *gnomeListVM = [[GnomeDetailViewModel alloc] initWithGnome:gnome];
	GnomeDetailViewController *gnomeDetailVC = [[GnomeDetailViewController alloc] initWithViewModel:gnomeListVM];
	[self.navigationController pushViewController:gnomeDetailVC animated:true];
}

#pragma mark - GnomesListViewModelCoordinatorDelegate

-(void) showDetailOfGnome:(Gnome *)gnome{
	[self pushToDetailViewControllerWithGnome:gnome];
}

@end
