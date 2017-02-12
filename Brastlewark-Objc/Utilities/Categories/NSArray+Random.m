//
//  NSArray+Random.m
//  Brastlewark-Objc
//
//  Created by Abel Osorio on 2/11/17.
//  Copyright © 2017 Abel Osorio. All rights reserved.
//

#import "NSArray+Random.h"

@implementation NSArray (Random)

- (id)randomObject{
	
	id randomObject = [self count] ? self[arc4random_uniform((u_int32_t)[self count])] : nil;
	return randomObject;
}

@end
