//
//  GnomesAPI.m
//  Brastlewark-Objc
//
//  Created by Abel Osorio on 2/11/17.
//  Copyright © 2017 Abel Osorio. All rights reserved.
//

#import "GnomesAPI.h"
#import "GnomesNetworkingService.h"

@implementation GnomesAPI

+(RACSignal *)fetchGnomes {
	
	return [GnomesNetworkingService getGnomes];
}

@end
