//
//  AppCoordinator.m
//  Brastlewark-Objc
//
//  Created by Abel Osorio on 2/11/17.
//  Copyright © 2017 Abel Osorio. All rights reserved.
//

#import "AppCoordinator.h"
#import "GnomesListViewController.h"
#import "GnomesListViewModel.h"


@implementation AppCoordinator

@synthesize rootViewcontroller;

-(void)start{
	self.rootViewcontroller = [self createGnomesListViewController];
}

-(UINavigationController*)createGnomesListViewController{
	

	GnomesListViewModel *gnomeListVM = [[GnomesListViewModel alloc] initAndGetGnomes];	
	// Create view controller, injecting view model
	GnomesListViewController *gnomesListVC = [[GnomesListViewController alloc] initWithViewModel:gnomeListVM];
	
	UINavigationController* navVC = [[UINavigationController alloc] initWithRootViewController:gnomesListVC];
	return navVC;
}

@end
