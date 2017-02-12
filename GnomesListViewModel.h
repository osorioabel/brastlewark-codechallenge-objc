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

@interface GnomesListViewModel : NSObject

@property (nonatomic, readonly) RACSignal *hasUpdatedContent;

- (instancetype)initAndGetGnomes;

- (NSString *)title;
- (NSUInteger)numberOfGnomesInSection:(NSInteger)section;
- (Gnome *)gnomeAtIndexPath:(NSIndexPath *)indexPath;
- (NSString *)fullNameAtIndexPath:(NSIndexPath *)indexPath;

@end
