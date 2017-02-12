//
//  GnomesAPI.h
//  Brastlewark-Objc
//
//  Created by Abel Osorio on 2/11/17.
//  Copyright © 2017 Abel Osorio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface GnomesAPI : NSObject

+ (RACSignal *)fetchGnomes;

@end
