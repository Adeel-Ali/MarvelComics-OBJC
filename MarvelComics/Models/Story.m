//
//  Story.m
//  MarvelComics
//
//  This file was automatically generated by APIMATIC v2.0 ( https://apimatic.io ) on 05/25/2016
//
#import "Story.h"

@implementation Story

/**
* A resource list of characters which appear in this story.
*/
@synthesize characters;

/**
* A resource list containing comics in which this story takes place.
*/
@synthesize comics;

/**
* A resource list of creators who worked on this story.
*/
@synthesize creators;

/**
* A short description of the story.
*/
@synthesize description;

/**
* A resource list of the events in which this story appears.
*/
@synthesize events;

/**
* The unique ID of the story resource.
*/
@synthesize mid;

/**
* The date the resource was most recently modified.
*/
@synthesize modified;

/**
* A summary representation of the issue in which this story was originally published.
*/
@synthesize originalissue;

/**
* The canonical URL identifier for this resource.
*/
@synthesize resourceURI;

/**
* A resource list containing series in which this story appears.
*/
@synthesize series;

/**
* The representative image for this story.
*/
@synthesize thumbnail;

/**
* The story title.
*/
@synthesize title;

/**
* The story type e.g. interior story, cover, text story.
*/
@synthesize type;


/**
* Key mappings for the json serialization and deserialization
*/
+(NSDictionary*) keyMap
{
    NSMutableDictionary* map = [[NSMutableDictionary alloc] init];
    [map addEntriesFromDictionary: @{
        @"characters": @"characters",
        @"comics": @"comics",
        @"creators": @"creators",
        @"description": @"description",
        @"events": @"events",
        @"id": @"mid",
        @"modified": @"modified",
        @"originalissue": @"originalissue",
        @"resourceURI": @"resourceURI",
        @"series": @"series",
        @"thumbnail": @"thumbnail",
        @"title": @"title",
        @"type": @"type"  
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