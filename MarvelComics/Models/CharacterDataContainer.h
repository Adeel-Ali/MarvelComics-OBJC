//
//  CharacterDataContainer.h
//  MarvelComics
//
//  This file was automatically generated by APIMATIC v2.0 ( https://apimatic.io ) on 05/25/2016
//
#ifndef APIMATIC_CHARACTERDATACONTAINER
#define APIMATIC_CHARACTERDATACONTAINER

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "APIHelper.h"

#import "Character.h"


//protocol defined for deserialization of JSON
@protocol CharacterDataContainer
@end

@interface CharacterDataContainer : JSONModel

/**
* The total number of results returned by this call.
*/
@property int count;

/**
* The requested result limit.
*/
@property int limit;

/**
* The requested offset (number of skipped results) of the call.
*/
@property int offset;

/**
* The list of characters returned by the call.
*/
@property NSArray<Character*> * results;

/**
* The total number of resources available given the current filter set.
*/
@property int total;


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