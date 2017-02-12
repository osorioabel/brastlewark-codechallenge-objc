//
//  Gnome.h
//  Brastlewark-Objc
//
//  Created by Abel Osorio on 2/11/17.
//  Copyright © 2017 Abel Osorio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Mantle/Mantle.h>

@interface Gnome : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSNumber *gnomeId;
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSURL *thumbnail;
@property (nonatomic, copy, readonly) NSNumber *age;
@property (nonatomic, copy, readonly) NSString *gender;
@property (nonatomic, assign,readonly) CGFloat weight;
@property (nonatomic, assign,readonly) CGFloat height;
@property (nonatomic, copy, readonly) NSString *hairColor;
@property (nonatomic, copy, readonly) NSArray *friends;
@property (nonatomic, copy, readonly) NSArray *profession;

@end
