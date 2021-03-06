//
//  AppCoordinator.h
//  Brastlewark-Objc
//
//  Created by Abel Osorio on 2/11/17.
//  Copyright © 2017 Abel Osorio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GnomesListViewModel.h"

@protocol Coordinator

@property (nonatomic,strong) UIViewController* rootViewcontroller;
@property (nonatomic,strong) UINavigationController* navigationController;
-(void)start;

@end

@interface AppCoordinator : NSObject <Coordinator,GnomesListViewModelCoordinatorDelegate>


-(void)start;

@end
