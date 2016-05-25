//
//  SeriesDataWrapper.m
//  MarvelComics
//
//  This file was automatically generated by APIMATIC v2.0 ( https://apimatic.io ) on 05/25/2016
//
#import "SeriesDataWrapper.h"

@implementation SeriesDataWrapper

/**
* An HTML representation of the attribution notice for this result.  Please display either this notice or the contents of the attributionText field on all screens which contain data from the Marvel Comics API.
*/
@synthesize attributionHTML;

/**
* The attribution notice for this result.  Please display either this notice or the contents of the attributionHTML field on all screens which contain data from the Marvel Comics API.
*/
@synthesize attributionText;

/**
* The HTTP status code of the returned result.
*/
@synthesize code;

/**
* The copyright notice for the returned result.
*/
@synthesize mcopyright;

/**
* The results returned by the call.
*/
@synthesize data;

/**
* A digest value of the content returned by the call.
*/
@synthesize etag;

/**
* A string description of the call status.
*/
@synthesize status;


/**
* Key mappings for the json serialization and deserialization
*/
+(NSDictionary*) keyMap
{
    NSMutableDictionary* map = [[NSMutableDictionary alloc] init];
    [map addEntriesFromDictionary: @{
        @"attributionHTML": @"attributionHTML",
        @"attributionText": @"attributionText",
        @"code": @"code",
        @"copyright": @"mcopyright",
        @"data": @"data",
        @"etag": @"etag",
        @"status": @"status"  
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