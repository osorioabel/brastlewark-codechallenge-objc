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
@property (nonatomic, strong) NSArray *searchResults;

@end

@implementation GnomesListViewModel

#pragma mark - Lifecycle

- (instancetype)initAndGetGnomes{
	self = [super init];
	if (!self) return nil;
	
	RAC(self, gnomes) = [[GnomesAPI fetchGnomes] startWith:@[]];
	self.shouldDisplaySearchResults = NO;
	_hasUpdatedContent = [RACObserve(self, gnomes) mapReplace:@(YES)];

	return self;
}
- (NSUInteger)numberOfGnomesInSection:(NSInteger)section{
	if (self.shouldDisplaySearchResults){
		return self.searchResults.count;
	}
	return self.gnomes.count;
}

- (Gnome *)gnomeAtIndexPath:(NSIndexPath *)indexPath {
	if (self.shouldDisplaySearchResults){
		return self.searchResults[indexPath.row];
	}
	return self.gnomes[indexPath.row];
}

- (void)showDetailOfGnome:(Gnome *)gnome{
	[self.delegate showDetailOfGnome:gnome];
}

- (void)filterGnomesWithQuery:(NSString*)query{
	NSArray* filteredGnomes = [NSArray array];
	NSArray* searchableArray = self.gnomes;
	NSPredicate *resultPredicate = [NSPredicate
									predicateWithFormat:@"SELF.name contains[cd] %@",
									query];
	
	filteredGnomes = [searchableArray filteredArrayUsingPredicate:resultPredicate];
	self.searchResults = filteredGnomes;
}
@end
