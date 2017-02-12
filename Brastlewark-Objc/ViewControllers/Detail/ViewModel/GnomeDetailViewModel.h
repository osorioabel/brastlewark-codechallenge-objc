//
//  GnomeDetailViewModel.h
//  Brastlewark-Objc
//
//  Created by Abel Osorio on 2/11/17.
//  Copyright © 2017 Abel Osorio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gnome.h"

@interface GnomeDetailViewModel : NSObject

- (instancetype)initWithGnome:(Gnome*)gnome;

@property (nonatomic,strong) Gnome* gnome;

- (NSString *)name;
- (NSURL *)thumbnail;
- (NSString *)detail;
- (NSString *)title;

@end
