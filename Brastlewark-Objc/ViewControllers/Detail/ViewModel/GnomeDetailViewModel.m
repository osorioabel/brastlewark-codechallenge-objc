//
//  GnomeDetailViewModel.m
//  Brastlewark-Objc
//
//  Created by Abel Osorio on 2/11/17.
//  Copyright © 2017 Abel Osorio. All rights reserved.
//

#import "GnomeDetailViewModel.h"

@implementation GnomeDetailViewModel

@synthesize gnome;

#pragma mark - Lifecycle

- (instancetype)initWithGnome:(Gnome *)gnomeDetail{
	self = [super init];
	if (!self) return nil;
	
	self.gnome = gnomeDetail;
	
	return self;
}

- (NSString *)name{
	return [NSString stringWithFormat:@"%@",self.gnome.name];
}
- (NSString *)title{
	return self.gnome.name;
}
- (NSString *)detail{
	NSString *detail = @"";
	detail = [NSString stringWithFormat:@"%@",[self age]];
	detail = [detail stringByAppendingString: [self gender]];
	detail = [detail stringByAppendingString: [self weight]];
	detail = [detail stringByAppendingString: [self height]];
	detail = [detail stringByAppendingString: [self hairColor]];
	detail = [detail stringByAppendingString: [self friends]];
	detail = [detail stringByAppendingString: [self profession]];
	return detail;
}
- (NSURL *)thumbnail{
	return self.gnome.thumbnail;
}
- (NSString *)age{
	return [NSString stringWithFormat:@"Age: %@",self.gnome.age];
}
- (NSString *)gender{
	return [NSString stringWithFormat:@"\nGender: %@",self.gnome.gender];
}
- (NSString *)weight{
	return [NSString stringWithFormat:@"\nWeight: %f",self.gnome.weight];
}
- (NSString *)height{
	return [NSString stringWithFormat:@"\nWeight: %f",self.gnome.height];
}
- (NSString *)hairColor{
	return [NSString stringWithFormat:@"\nHair Color: %@",self.gnome.hairColor];
}
- (NSString *)friends{
	return [NSString stringWithFormat:@"\nFriends: %@",[self.gnome.friends componentsJoinedByString:@", "]];
}
- (NSString *)profession{
	return [NSString stringWithFormat:@"\nProfession: %@",[self.gnome.profession componentsJoinedByString:@", "]];
}

@end
