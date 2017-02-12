//
//  GnomesNetworkingService.m
//  Brastlewark-Objc
//
//  Created by Abel Osorio on 2/11/17.
//  Copyright © 2017 Abel Osorio. All rights reserved.
//

#import "GnomesNetworkingService.h"
#import "NSURLSession+RAC.h"


static NSString* const APIGnomesURLString = @"https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json";

@implementation GnomesNetworkingService

+(RACSignal *)getGnomes{
	
	__block NSError *error = nil;
	
	return [[[NSURLSession sharedSession] rac_GET:[[NSURL alloc] initWithString:APIGnomesURLString]]
			map:^(RACTuple *result) {
				NSData *data = result.first;
				NSDictionary *gnomesDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
				
				NSMutableArray *gnomes = [NSMutableArray array];
				for (NSDictionary *gnomeDict in gnomesDict[@"Brastlewark"]) {
					Gnome*gnome = [MTLJSONAdapter modelOfClass:[Gnome class] fromJSONDictionary:gnomeDict error:&error];
					if (error) {
						NSLog(@"%@",error);
					}else{
						if (gnome) [gnomes addObject:gnome];
					}
				}
				
				return [gnomes copy];
			}];
}

@end
