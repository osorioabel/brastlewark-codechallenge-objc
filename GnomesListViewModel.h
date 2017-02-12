//
//  GnomesListViewModel.h
//  Brastlewark-Objc
//
//  Created by Abel Osorio on 2/11/17.
//  Copyright © 2017 Abel Osorio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gnome.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@class GnomesListViewModel;

@protocol GnomesListViewModelCoordinatorDelegate <NSObject>
-(void)showDetailOfGnome:(Gnome*) gnome;

@end

@interface GnomesListViewModel : NSObject

@property (nonatomic, readonly) RACSignal *hasUpdatedContent;
@property (weak, nonatomic) id<GnomesListViewModelCoordinatorDelegate> delegate;

- (instancetype)initAndGetGnomes;
- (NSString *)title;
- (NSUInteger)numberOfGnomesInSection:(NSInteger)section;
- (Gnome *)gnomeAtIndexPath:(NSIndexPath *)indexPath;
- (void)showDetailOfGnome:(Gnome *)gnome;

@end
