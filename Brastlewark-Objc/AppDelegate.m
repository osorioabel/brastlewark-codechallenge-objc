//
//  AppDelegate.m
//  Brastlewark-Objc
//
//  Created by Abel Osorio on 2/11/17.
//  Copyright © 2017 Abel Osorio. All rights reserved.
//

#import "AppDelegate.h"
#import "AppCoordinator.h"
#import "Utils.h"

@interface AppDelegate ()

@property (strong, nonatomic) AppCoordinator *appCoordinator;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// Override point for customization after application launch.
	[Utils customizingApp];
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.appCoordinator = [[AppCoordinator alloc] init];
	[self.appCoordinator start];
	self.window.rootViewController = self.appCoordinator.rootViewcontroller;
	[self.window makeKeyAndVisible];

	return YES;
}

@end
