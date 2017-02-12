//
//  Utils.m
//  Brastlewark-Objc
//
//  Created by Abel Osorio on 2/11/17.
//  Copyright © 2017 Abel Osorio. All rights reserved.
//

#import "Utils.h"
#import <UIKit/UIKit.h>

@implementation Utils

+(void) customizingApp{
	
	[[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
	[[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
														   [UIColor whiteColor],
														   NSForegroundColorAttributeName, nil]];
}

@end
