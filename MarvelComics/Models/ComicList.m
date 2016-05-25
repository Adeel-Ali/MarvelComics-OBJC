//
//  ComicList.m
//  MarvelComics
//
//  This file was automatically generated by APIMATIC v2.0 ( https://apimatic.io ) on 05/25/2016
//
#import "ComicList.h"

@implementation ComicList

/**
* The number of total available issues in this list. Will always be greater than or equal to the "returned" value.
*/
@synthesize available;

/**
* The path to the full list of issues in this collection.
*/
@synthesize collectionURI;

/**
* The list of returned issues in this collection.
*/
@synthesize items;

/**
* The number of issues returned in this collection (up to 20).
*/
@synthesize returned;

/**
 * For deserialization of enum ComicSummary type property from NSArray
 */
 -(void)setItemsWithNSArray:(NSArray*) array
{
	NSError* err;
    items = [ComicSummary arrayOfModelsFromDictionaries:array error:&err];
	if(err){
		NSLog(@"Failed to deserialise items property");
	}
}


/**
* Key mappings for the json serialization and deserialization
*/
+(NSDictionary*) keyMap
{
    NSMutableDictionary* map = [[NSMutableDictionary alloc] init];
    [map addEntriesFromDictionary: @{
        @"available": @"available",
        @"collectionURI": @"collectionURI",
        @"items": @"items",
        @"returned": @"returned"  
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