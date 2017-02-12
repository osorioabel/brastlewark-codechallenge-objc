//
//  GnomesListViewModel.m
//  Brastlewark-Objc
//
//  Created by Abel Osorio on 2/11/17.
//  Copyright © 2017 Abel Osorio. All rights reserved.
//


#import "GnomesListViewModel.h"
#import "UIKit/UIKit.h"
#import "GnomesAPI.h"

@interface GnomesListViewModel ()

@property (nonatomic, strong) NSArray *gnomes;

@end

@implementation GnomesListViewModel

#pragma mark - Lifecycle

- (instancetype)initAndGetGnomes{
	self = [super init];
	if (!self) return nil;
	
	RAC(self, gnomes) = [[GnomesAPI fetchGnomes] startWith:@[]];
	
	_hasUpdatedContent = [RACObserve(self, gnomes) mapReplace:@(YES)];

	return self;
}

-(void)goToGnomeDetail:(Gnome*)gnome{
	
}

- (NSString *)title{
	return @"Gnomes";
}

- (NSUInteger)numberOfGnomesInSection:(NSInteger)section{
	return self.gnomes.count;
}

- (NSString *)fullNameAtIndexPath:(NSIndexPath *)indexPath{
	Gnome *gnome = [self gnomeAtIndexPath:indexPath];
	return [NSString stringWithFormat:@"%@", gnome.name];
}

- (Gnome *)gnomeAtIndexPath:(NSIndexPath *)indexPath {
	return self.gnomes[indexPath.row];
}

@end
