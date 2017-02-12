//
//  Gnome.m
//  Brastlewark-Objc
//
//  Created by Abel Osorio on 2/11/17.
//  Copyright © 2017 Abel Osorio. All rights reserved.
//

#import "Gnome.h"


@implementation Gnome

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError **)error {
	self = [super initWithDictionary:dictionaryValue error:error];
	if (self == nil) return nil;
	
	// Store a value that needs to be determined locally upon initialization.
	//_retrievedAt = [NSDate date];
	
	return self;
}

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
			 @"gnomeId": @"id",
			 @"name": @"name",
			 @"thumbnail": @"thumbnail",
			 @"age": @"age",
			 @"gender": @"gender",
			 @"weight": @"weight",
			 @"height": @"height",
			 @"hairColor": @"hair_color",
			 @"profession": @"professions",
			 @"friends": @"friends",
			 };
}

+ (NSValueTransformer *)thumbnailJSONTransformer {
	return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end
