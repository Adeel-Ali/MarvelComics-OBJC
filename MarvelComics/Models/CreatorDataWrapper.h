//
//  CreatorDataWrapper.h
//  MarvelComics
//
//  This file was automatically generated by APIMATIC v2.0 ( https://apimatic.io ) on 05/25/2016
//
#ifndef APIMATIC_CREATORDATAWRAPPER
#define APIMATIC_CREATORDATAWRAPPER

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "APIHelper.h"

#import "CreatorDataContainer.h"


//protocol defined for deserialization of JSON
@protocol CreatorDataWrapper
@end

@interface CreatorDataWrapper : JSONModel

/**
* An HTML representation of the attribution notice for this result.  Please display either this notice or the contents of the attributionText field on all screens which contain data from the Marvel Comics API.
*/
@property NSString* attributionHTML;

/**
* The attribution notice for this result.  Please display either this notice or the contents of the attributionHTML field on all screens which contain data from the Marvel Comics API.
*/
@property NSString* attributionText;

/**
* The HTTP status code of the returned result.
*/
@property int code;

/**
* The copyright notice for the returned result.
*/
@property NSString* mcopyright;

/**
* The results returned by the call.
*/
@property CreatorDataContainer* data;

/**
* A digest value of the content returned by the call.
*/
@property NSString* etag;

/**
* A string description of the call status.
*/
@property NSString* status;


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