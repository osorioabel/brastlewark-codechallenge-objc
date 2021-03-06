//
//  GnomesNetworkingService.h
//  Brastlewark-Objc
//
//  Created by Abel Osorio on 2/11/17.
//  Copyright © 2017 Abel Osorio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "Gnome.h"
#import <Mantle/Mantle.h>

@interface GnomesNetworkingService : NSObject

+(RACSignal *)getGnomes;

@end
