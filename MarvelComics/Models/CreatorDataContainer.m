//
//  CreatorDataContainer.m
//  MarvelComics
//
//  This file was automatically generated by APIMATIC v2.0 ( https://apimatic.io ) on 05/25/2016
//
#import "CreatorDataContainer.h"

@implementation CreatorDataContainer

/**
* The total number of results returned by this call.
*/
@synthesize count;

/**
* The requested result limit.
*/
@synthesize limit;

/**
* The requested offset (number of skipped results) of the call.
*/
@synthesize offset;

/**
* The list of creators returned by the call.
*/
@synthesize results;

/**
* The total number of resources available given the current filter set.
*/
@synthesize total;

/**
 * For deserialization of enum Creator type property from NSArray
 */
 -(void)setResultsWithNSArray:(NSArray*) array
{
	NSError* err;
    results = [Creator arrayOfModelsFromDictionaries:array error:&err];
	if(err){
		NSLog(@"Failed to deserialise results property");
	}
}


/**
* Key mappings for the json serialization and deserialization
*/
+(NSDictionary*) keyMap
{
    NSMutableDictionary* map = [[NSMutableDictionary alloc] init];
    [map addEntriesFromDictionary: @{
        @"count": @"count",
        @"limit": @"limit",
        @"offset": @"offset",
        @"results": @"results",
        @"total": @"total"  
    }];

    return map;
}

/**
* Key mapper for json serialization and deserialization
*/
+(JSONKeyMapper*) keyMapper
{ 
  return [[JSONKeyMapper alloc] initWithDictionary: [self keyMap]];
}

/**
* Helps avoiding deserialization errors when one or more properties are missing
* @returns	True, indicating that all properties are optional for deserialization
*/
+(BOOL)propertyIsOptional:(NSString*) propertyName
{
    return YES;
}

@end