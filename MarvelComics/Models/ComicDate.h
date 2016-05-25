//
//  ComicDate.h
//  MarvelComics
//
//  This file was automatically generated by APIMATIC v2.0 ( https://apimatic.io ) on 05/25/2016
//
#ifndef APIMATIC_COMICDATE
#define APIMATIC_COMICDATE

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "APIHelper.h"



//protocol defined for deserialization of JSON
@protocol ComicDate
@end

@interface ComicDate : JSONModel

/**
* The date.
*/
@property NSDate* date;

/**
* A description of the date (e.g. onsale date, FOC date).
*/
@property NSString* type;


/**
* Key mappings for the json serialization and deserialization
*/
+(NSDictionary*) keyMap;

/**
* Key mapper for json serialization and deserialization
*/
+(JSONKeyMapper*) keyMapper;

/**
* Helps avoiding deserialization errors when one or more properties are missing
* @returns	True, indicating that all properties are optional for deserialization
*/
+(BOOL)propertyIsOptional:(NSString*) propertyName;

@end
#endif