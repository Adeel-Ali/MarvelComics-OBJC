//
//  ComicsController.m
//  MarvelComics
//
//  This file was automatically generated by APIMATIC v2.0 ( https://apimatic.io ) on 05/25/2016
//
#import "ComicsController.h"

@implementation ComicsController

/**
* Fetches lists of characters filtered by a comic id.
* @param    comicId    Required parameter: A single comic.
* @param    events    Optional parameter: Return only characters which appear comics that took place in the specified events (accepts a comma-separated list of ids).
* @param    limit    Optional parameter: Limit the result set to the specified number of resources.
* @param    modifiedSince    Optional parameter: Return only characters which have been modified since the specified date.
* @param    name    Optional parameter: Return only characters matching the specified full character name (e.g. Spider-Man).
* @param    nameStartsWith    Optional parameter: Return characters with names that begin with the specified string (e.g. Sp).
* @param    offset    Optional parameter: Skip the specified number of resources in the result set.
* @param    orderBy    Optional parameter: Order the result set by a field or fields. Add a "-" to the value sort in descending order. Multiple values are given priority in the order in which they are passed. (Acceptable values are: "name", "modified", "-name", "-modified")
* @param    series    Optional parameter: Return only characters which appear the specified series (accepts a comma-separated list of ids).
* @param    stories    Optional parameter: Return only characters which appear the specified stories (accepts a comma-separated list of ids).
* @return	Returns the void response from the API call */
- (void) getComicCharacterCollectionAsyncWithComicId:(NSString*) comicId
                events:(NSString*) events
                limit:(NSString*) limit
                modifiedSince:(NSString*) modifiedSince
                name:(NSString*) name
                nameStartsWith:(NSString*) nameStartsWith
                offset:(NSString*) offset
                orderBy:(NSString*) orderBy
                series:(NSString*) series
                stories:(NSString*) stories
                completionBlock:(CompletedGetComicCharacterCollection) onCompleted
{
    //the base uri for api requests
    NSString* _baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* _queryBuilder = [NSMutableString stringWithString: _baseUri]; 
    [_queryBuilder appendString: @"/comics/{comicId}/characters"];

    //process optional query parameters
    [APIHelper appendUrl: _queryBuilder withTemplateParameters: @{
                    @"comicId": comicId
                }];

    //process optional query parameters
    [APIHelper appendUrl: _queryBuilder withQueryParameters: @{
                    @"events": (nil != events) ? events : [NSNull null],
                    @"limit": (nil != limit) ? limit : [NSNull null],
                    @"modifiedSince": (nil != modifiedSince) ? modifiedSince : [NSNull null],
                    @"name": (nil != name) ? name : [NSNull null],
                    @"nameStartsWith": (nil != nameStartsWith) ? nameStartsWith : [NSNull null],
                    @"offset": (nil != offset) ? offset : [NSNull null],
                    @"orderBy": (nil != orderBy) ? orderBy : [NSNull null],
                    @"series": (nil != series) ? series : [NSNull null],
                    @"stories": (nil != stories) ? stories : [NSNull null],
                    @"apikey": [Configuration Apikey]
                }];

    //validate and preprocess url
    NSString* _queryUrl = [APIHelper cleanUrl: _queryBuilder];

    //preparing request headers
    NSMutableDictionary* _headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"APIMATIC 2.0",
        @"accept": @"application/json",
        @"referer": [Configuration Referer]
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: _headers];


    //prepare the request and fetch response  
    HttpRequest* _request = [[self clientInstance] get: ^(HttpRequest* _request) 
    { 
        [_request setQueryUrl: _queryUrl]; //set request url        
        [_request setHeaders: _headers]; //set request headers

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: _request
     success: ^(id _context, HttpResponse *_response) {
         //Error handling using HTTP status codes
         NSError* _statusError = nil;

         //Error handling using HTTP status codes 
         if (_response.statusCode == 409)
             _statusError = [[APIError alloc] initWithReason: @"Limit greater than 100."
                                                    andCode: _response.statusCode
                                                    andData: _response.rawBody];

         else if((_response.statusCode < 200) || (_response.statusCode > 206)) //[200,206] = HTTP OK
             _statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: _response.statusCode
                                                    andData: _response.rawBody];

         if(_statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, _context, nil, _statusError);
         }
         else
         {
             //return _response to API caller
             NSString* _strResult = [(HttpStringResponse*)_response body];
             CharacterDataWrapper* _result = (CharacterDataWrapper*) [APIHelper jsonDeserialize: _strResult
                toClass: CharacterDataWrapper.class];

 
             //announce completion with success
             onCompleted(YES, _context, _result, nil);
         }
     } failure:^(id _context, NSError *_error) {
 
         //announce completion with failure
         onCompleted(NO, _context, nil, _error);
     }];
}

/**
* Fetches lists of creators filtered by a comic id.
* @param    comicId    Required parameter: A single comic.
* @param    comics    Optional parameter: Return only creators who worked on in the specified comics (accepts a comma-separated list of ids).
* @param    firstName    Optional parameter: Filter by creator first name (e.g. brian).
* @param    firstNameStartsWith    Optional parameter: Filter by creator first names that match critera (e.g. B, St L).
* @param    lastName    Optional parameter: Filter by creator last name (e.g. Bendis).
* @param    lastNameStartsWith    Optional parameter: Filter by creator last names that match critera (e.g. Ben).
* @param    limit    Optional parameter: Limit the result set to the specified number of resources.
* @param    middleName    Optional parameter: Filter by creator middle name (e.g. Michael).
* @param    middleNameStartsWith    Optional parameter: Filter by creator middle names that match critera (e.g. Mi).
* @param    modifiedSince    Optional parameter: Return only creators which have been modified since the specified date.
* @param    nameStartsWith    Optional parameter: Filter by creator names that match critera (e.g. B, St L).
* @param    offset    Optional parameter: Skip the specified number of resources in the result set.
* @param    orderBy    Optional parameter: Order the result set by a field or fields. Add a "-" to the value sort in descending order. Multiple values are given priority in the order in which they are passed. (Acceptable values are: "lastName", "firstName", "middleName", "suffix", "modified", "-lastName", "-firstName", "-middleName", "-suffix", "-modified")
* @param    series    Optional parameter: Return only creators who worked on the specified series (accepts a comma-separated list of ids).
* @param    stories    Optional parameter: Return only creators who worked on the specified stories (accepts a comma-separated list of ids).
* @param    suffix    Optional parameter: Filter by suffix or honorific (e.g. Jr., Sr.).
* @return	Returns the void response from the API call */
- (void) getCreatorCollectionByComicIdAsyncWithComicId:(NSString*) comicId
                comics:(NSString*) comics
                firstName:(NSString*) firstName
                firstNameStartsWith:(NSString*) firstNameStartsWith
                lastName:(NSString*) lastName
                lastNameStartsWith:(NSString*) lastNameStartsWith
                limit:(NSString*) limit
                middleName:(NSString*) middleName
                middleNameStartsWith:(NSString*) middleNameStartsWith
                modifiedSince:(NSString*) modifiedSince
                nameStartsWith:(NSString*) nameStartsWith
                offset:(NSString*) offset
                orderBy:(NSString*) orderBy
                series:(NSString*) series
                stories:(NSString*) stories
                suffix:(NSString*) suffix
                completionBlock:(CompletedGetCreatorCollectionByComicId) onCompleted
{
    //the base uri for api requests
    NSString* _baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* _queryBuilder = [NSMutableString stringWithString: _baseUri]; 
    [_queryBuilder appendString: @"/comics/{comicId}/creators"];

    //process optional query parameters
    [APIHelper appendUrl: _queryBuilder withTemplateParameters: @{
                    @"comicId": comicId
                }];

    //process optional query parameters
    [APIHelper appendUrl: _queryBuilder withQueryParameters: @{
                    @"comics": (nil != comics) ? comics : [NSNull null],
                    @"firstName": (nil != firstName) ? firstName : [NSNull null],
                    @"firstNameStartsWith": (nil != firstNameStartsWith) ? firstNameStartsWith : [NSNull null],
                    @"lastName": (nil != lastName) ? lastName : [NSNull null],
                    @"lastNameStartsWith": (nil != lastNameStartsWith) ? lastNameStartsWith : [NSNull null],
                    @"limit": (nil != limit) ? limit : [NSNull null],
                    @"middleName": (nil != middleName) ? middleName : [NSNull null],
                    @"middleNameStartsWith": (nil != middleNameStartsWith) ? middleNameStartsWith : [NSNull null],
                    @"modifiedSince": (nil != modifiedSince) ? modifiedSince : [NSNull null],
                    @"nameStartsWith": (nil != nameStartsWith) ? nameStartsWith : [NSNull null],
                    @"offset": (nil != offset) ? offset : [NSNull null],
                    @"orderBy": (nil != orderBy) ? orderBy : [NSNull null],
                    @"series": (nil != series) ? series : [NSNull null],
                    @"stories": (nil != stories) ? stories : [NSNull null],
                    @"suffix": (nil != suffix) ? suffix : [NSNull null],
                    @"apikey": [Configuration Apikey]
                }];

    //validate and preprocess url
    NSString* _queryUrl = [APIHelper cleanUrl: _queryBuilder];

    //preparing request headers
    NSMutableDictionary* _headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"APIMATIC 2.0",
        @"accept": @"application/json",
        @"referer": [Configuration Referer]
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: _headers];


    //prepare the request and fetch response  
    HttpRequest* _request = [[self clientInstance] get: ^(HttpRequest* _request) 
    { 
        [_request setQueryUrl: _queryUrl]; //set request url        
        [_request setHeaders: _headers]; //set request headers

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: _request
     success: ^(id _context, HttpResponse *_response) {
         //Error handling using HTTP status codes
         NSError* _statusError = nil;

         //Error handling using HTTP status codes 
         if (_response.statusCode == 409)
             _statusError = [[APIError alloc] initWithReason: @"Limit greater than 100."
                                                    andCode: _response.statusCode
                                                    andData: _response.rawBody];

         else if((_response.statusCode < 200) || (_response.statusCode > 206)) //[200,206] = HTTP OK
             _statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: _response.statusCode
                                                    andData: _response.rawBody];

         if(_statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, _context, nil, _statusError);
         }
         else
         {
             //return _response to API caller
             NSString* _strResult = [(HttpStringResponse*)_response body];
             CreatorDataWrapper* _result = (CreatorDataWrapper*) [APIHelper jsonDeserialize: _strResult
                toClass: CreatorDataWrapper.class];

 
             //announce completion with success
             onCompleted(YES, _context, _result, nil);
         }
     } failure:^(id _context, NSError *_error) {
 
         //announce completion with failure
         onCompleted(NO, _context, nil, _error);
     }];
}

/**
* Fetches lists of events filtered by a comic id.
* @param    comicId    Required parameter: A single comic.
* @param    characters    Optional parameter: Return only events which feature the specified characters (accepts a comma-separated list of ids).
* @param    creators    Optional parameter: Return only events which feature work by the specified creators (accepts a comma-separated list of ids).
* @param    limit    Optional parameter: Limit the result set to the specified number of resources.
* @param    modifiedSince    Optional parameter: Return only events which have been modified since the specified date.
* @param    name    Optional parameter: Filter the event list by name.
* @param    nameStartsWith    Optional parameter: Return events with names that begin with the specified string (e.g. Sp).
* @param    offset    Optional parameter: Skip the specified number of resources in the result set.
* @param    orderBy    Optional parameter: Order the result set by a field or fields. Add a "-" to the value sort in descending order. Multiple values are given priority in the order in which they are passed. (Acceptable values are: "name", "startDate", "modified", "-name", "-startDate", "-modified")
* @param    series    Optional parameter: Return only events which are part of the specified series (accepts a comma-separated list of ids).
* @param    stories    Optional parameter: Return only events which contain the specified stories (accepts a comma-separated list of ids).
* @return	Returns the void response from the API call */
- (void) getIssueEventsCollectionAsyncWithComicId:(NSString*) comicId
                characters:(NSString*) characters
                creators:(NSString*) creators
                limit:(NSString*) limit
                modifiedSince:(NSString*) modifiedSince
                name:(NSString*) name
                nameStartsWith:(NSString*) nameStartsWith
                offset:(NSString*) offset
                orderBy:(NSString*) orderBy
                series:(NSString*) series
                stories:(NSString*) stories
                completionBlock:(CompletedGetIssueEventsCollection) onCompleted
{
    //the base uri for api requests
    NSString* _baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* _queryBuilder = [NSMutableString stringWithString: _baseUri]; 
    [_queryBuilder appendString: @"/comics/{comicId}/events"];

    //process optional query parameters
    [APIHelper appendUrl: _queryBuilder withTemplateParameters: @{
                    @"comicId": comicId
                }];

    //process optional query parameters
    [APIHelper appendUrl: _queryBuilder withQueryParameters: @{
                    @"characters": (nil != characters) ? characters : [NSNull null],
                    @"creators": (nil != creators) ? creators : [NSNull null],
                    @"limit": (nil != limit) ? limit : [NSNull null],
                    @"modifiedSince": (nil != modifiedSince) ? modifiedSince : [NSNull null],
                    @"name": (nil != name) ? name : [NSNull null],
                    @"nameStartsWith": (nil != nameStartsWith) ? nameStartsWith : [NSNull null],
                    @"offset": (nil != offset) ? offset : [NSNull null],
                    @"orderBy": (nil != orderBy) ? orderBy : [NSNull null],
                    @"series": (nil != series) ? series : [NSNull null],
                    @"stories": (nil != stories) ? stories : [NSNull null],
                    @"apikey": [Configuration Apikey]
                }];

    //validate and preprocess url
    NSString* _queryUrl = [APIHelper cleanUrl: _queryBuilder];

    //preparing request headers
    NSMutableDictionary* _headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"APIMATIC 2.0",
        @"accept": @"application/json",
        @"referer": [Configuration Referer]
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: _headers];


    //prepare the request and fetch response  
    HttpRequest* _request = [[self clientInstance] get: ^(HttpRequest* _request) 
    { 
        [_request setQueryUrl: _queryUrl]; //set request url        
        [_request setHeaders: _headers]; //set request headers

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: _request
     success: ^(id _context, HttpResponse *_response) {
         //Error handling using HTTP status codes
         NSError* _statusError = nil;

         //Error handling using HTTP status codes 
         if (_response.statusCode == 409)
             _statusError = [[APIError alloc] initWithReason: @"Limit greater than 100."
                                                    andCode: _response.statusCode
                                                    andData: _response.rawBody];

         else if((_response.statusCode < 200) || (_response.statusCode > 206)) //[200,206] = HTTP OK
             _statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: _response.statusCode
                                                    andData: _response.rawBody];

         if(_statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, _context, nil, _statusError);
         }
         else
         {
             //return _response to API caller
             NSString* _strResult = [(HttpStringResponse*)_response body];
             EventDataWrapper* _result = (EventDataWrapper*) [APIHelper jsonDeserialize: _strResult
                toClass: EventDataWrapper.class];

 
             //announce completion with success
             onCompleted(YES, _context, _result, nil);
         }
     } failure:^(id _context, NSError *_error) {
 
         //announce completion with failure
         onCompleted(NO, _context, nil, _error);
     }];
}

/**
* Fetches lists of stories filtered by a comic id.
* @param    comicId    Required parameter: A single comic.
* @param    characters    Optional parameter: Return only stories which feature the specified characters (accepts a comma-separated list of ids).
* @param    creators    Optional parameter: Return only stories which feature work by the specified creators (accepts a comma-separated list of ids).
* @param    events    Optional parameter: Return only stories which take place during the specified events (accepts a comma-separated list of ids).
* @param    limit    Optional parameter: Limit the result set to the specified number of resources.
* @param    modifiedSince    Optional parameter: Return only stories which have been modified since the specified date.
* @param    offset    Optional parameter: Skip the specified number of resources.
* @param    orderBy    Optional parameter: Order the result set by a field or fields. Add a "-" to the value sort in descending order. Multiple values are given priority in the order in which they are passed. (Acceptable values are: "id", "modified", "-id", "-modified")
* @param    series    Optional parameter: Return only stories contained the specified series (accepts a comma-separated list of ids).
* @return	Returns the void response from the API call */
- (void) getComicStoryCollectionByComicIdAsyncWithComicId:(NSString*) comicId
                characters:(NSString*) characters
                creators:(NSString*) creators
                events:(NSString*) events
                limit:(NSString*) limit
                modifiedSince:(NSString*) modifiedSince
                offset:(NSString*) offset
                orderBy:(NSString*) orderBy
                series:(NSString*) series
                completionBlock:(CompletedGetComicStoryCollectionByComicId) onCompleted
{
    //the base uri for api requests
    NSString* _baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* _queryBuilder = [NSMutableString stringWithString: _baseUri]; 
    [_queryBuilder appendString: @"/comics/{comicId}/stories"];

    //process optional query parameters
    [APIHelper appendUrl: _queryBuilder withTemplateParameters: @{
                    @"comicId": comicId
                }];

    //process optional query parameters
    [APIHelper appendUrl: _queryBuilder withQueryParameters: @{
                    @"characters": (nil != characters) ? characters : [NSNull null],
                    @"creators": (nil != creators) ? creators : [NSNull null],
                    @"events": (nil != events) ? events : [NSNull null],
                    @"limit": (nil != limit) ? limit : [NSNull null],
                    @"modifiedSince": (nil != modifiedSince) ? modifiedSince : [NSNull null],
                    @"offset": (nil != offset) ? offset : [NSNull null],
                    @"orderBy": (nil != orderBy) ? orderBy : [NSNull null],
                    @"series": (nil != series) ? series : [NSNull null],
                    @"apikey": [Configuration Apikey]
                }];

    //validate and preprocess url
    NSString* _queryUrl = [APIHelper cleanUrl: _queryBuilder];

    //preparing request headers
    NSMutableDictionary* _headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"APIMATIC 2.0",
        @"accept": @"application/json",
        @"referer": [Configuration Referer]
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: _headers];


    //prepare the request and fetch response  
    HttpRequest* _request = [[self clientInstance] get: ^(HttpRequest* _request) 
    { 
        [_request setQueryUrl: _queryUrl]; //set request url        
        [_request setHeaders: _headers]; //set request headers

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: _request
     success: ^(id _context, HttpResponse *_response) {
         //Error handling using HTTP status codes
         NSError* _statusError = nil;

         //Error handling using HTTP status codes 
         if (_response.statusCode == 409)
             _statusError = [[APIError alloc] initWithReason: @"Limit greater than 100."
                                                    andCode: _response.statusCode
                                                    andData: _response.rawBody];

         else if((_response.statusCode < 200) || (_response.statusCode > 206)) //[200,206] = HTTP OK
             _statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: _response.statusCode
                                                    andData: _response.rawBody];

         if(_statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, _context, nil, _statusError);
         }
         else
         {
             //return _response to API caller
             NSString* _strResult = [(HttpStringResponse*)_response body];
             StoryDataWrapper* _result = (StoryDataWrapper*) [APIHelper jsonDeserialize: _strResult
                toClass: StoryDataWrapper.class];

 
             //announce completion with success
             onCompleted(YES, _context, _result, nil);
         }
     } failure:^(id _context, NSError *_error) {
 
         //announce completion with failure
         onCompleted(NO, _context, nil, _error);
     }];
}

/**
* Fetches a single comic by id.
* @param    comicId    Required parameter: A single comic.
* @return	Returns the void response from the API call */
- (void) getComicIndividualAsyncWithComicId:(NSString*) comicId
                completionBlock:(CompletedGetComicIndividual) onCompleted
{
    //the base uri for api requests
    NSString* _baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* _queryBuilder = [NSMutableString stringWithString: _baseUri]; 
    [_queryBuilder appendString: @"/comics/{comicId}"];

    //process optional query parameters
    [APIHelper appendUrl: _queryBuilder withTemplateParameters: @{
                    @"comicId": comicId
                }];

    //process optional query parameters
    [APIHelper appendUrl: _queryBuilder withQueryParameters: @{
                    @"apikey": [Configuration Apikey]
                }];

    //validate and preprocess url
    NSString* _queryUrl = [APIHelper cleanUrl: _queryBuilder];

    //preparing request headers
    NSMutableDictionary* _headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"APIMATIC 2.0",
        @"accept": @"application/json",
        @"referer": [Configuration Referer]
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: _headers];


    //prepare the request and fetch response  
    HttpRequest* _request = [[self clientInstance] get: ^(HttpRequest* _request) 
    { 
        [_request setQueryUrl: _queryUrl]; //set request url        
        [_request setHeaders: _headers]; //set request headers

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: _request
     success: ^(id _context, HttpResponse *_response) {
         //Error handling using HTTP status codes
         NSError* _statusError = nil;

         //Error handling using HTTP status codes 
         if (_response.statusCode == 404)
             _statusError = [[APIError alloc] initWithReason: @"Comic not found."
                                                    andCode: _response.statusCode
                                                    andData: _response.rawBody];

         else if((_response.statusCode < 200) || (_response.statusCode > 206)) //[200,206] = HTTP OK
             _statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: _response.statusCode
                                                    andData: _response.rawBody];

         if(_statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, _context, nil, _statusError);
         }
         else
         {
             //return _response to API caller
             NSString* _strResult = [(HttpStringResponse*)_response body];
             Comic* _result = (Comic*) [APIHelper jsonDeserialize: _strResult
                toClass: Comic.class];

 
             //announce completion with success
             onCompleted(YES, _context, _result, nil);
         }
     } failure:^(id _context, NSError *_error) {
 
         //announce completion with failure
         onCompleted(NO, _context, nil, _error);
     }];
}

/**
* Fetches lists of comics.
* @param    characters    Optional parameter: Return only comics which feature the specified characters (accepts a comma-separated list of ids).
* @param    collaborators    Optional parameter: Return only comics in which the specified creators worked together (for example in which BOTH Stan Lee and Jack Kirby did work). Accepts a comma-separated list of ids.
* @param    creators    Optional parameter: Return only comics which feature work by the specified creators (accepts a comma-separated list of ids).
* @param    dateDescriptor    Optional parameter: Return comics within a predefined date range.
* @param    dateRange    Optional parameter: Return comics within a predefined date range.  Dates must be specified as date1,date2 (e.g. 2013-01-01,2013-01-02).  Dates are preferably formatted as YYYY-MM-DD but may be sent as any common date format.
* @param    diamondCode    Optional parameter: Filter by diamond code.
* @param    digitalId    Optional parameter: Filter by digital comic id.
* @param    ean    Optional parameter: Filter by EAN.
* @param    events    Optional parameter: Return only comics which take place in the specified events (accepts a comma-separated list of ids).
* @param    format    Optional parameter: Filter by the issue format (e.g. comic, digital comic, hardcover). (Acceptable values are: "comic", "magazine", "trade paperback", "hardcover", "digest", "graphic novel", "digital comic", "infinite comic")
* @param    formatType    Optional parameter: Filter by the issue format type (comic or collection).
* @param    hasDigitalIssue    Optional parameter: Include only results which are available digitally. (Acceptable values are: "true")
* @param    isbn    Optional parameter: Filter by ISBN.
* @param    issn    Optional parameter: Filter by ISSN.
* @param    issueNumber    Optional parameter: Return only issues in series whose issue number matches the input.
* @param    limit    Optional parameter: Limit the result set to the specified number of resources.
* @param    modifiedSince    Optional parameter: Return only comics which have been modified since the specified date.
* @param    noVariants    Optional parameter: Exclude variants (alternate covers, secondary printings, director's cuts, etc.) from the result set. (Acceptable values are: "true")
* @param    offset    Optional parameter: Skip the specified number of resources in the result set.
* @param    orderBy    Optional parameter: Order the result set by a field or fields. Add a "-" to the value sort in descending order. Multiple values are given priority in the order in which they are passed. (Acceptable values are: "focDate", "onsaleDate", "title", "issueNumber", "modified", "-focDate", "-onsaleDate", "-title", "-issueNumber", "-modified")
* @param    series    Optional parameter: Return only comics which are part of the specified series (accepts a comma-separated list of ids).
* @param    sharedAppearances    Optional parameter: Return only comics in which the specified characters appear together (for example in which BOTH Spider-Man and Wolverine appear). Accepts a comma-separated list of ids.
* @param    startYear    Optional parameter: Return only issues in series whose start year matches the input.
* @param    stories    Optional parameter: Return only comics which contain the specified stories (accepts a comma-separated list of ids).
* @param    title    Optional parameter: Return only issues in series whose title matches the input.
* @param    titleStartsWith    Optional parameter: Return only issues in series whose title starts with the input.
* @param    upc    Optional parameter: Filter by UPC.
* @return	Returns the void response from the API call */
- (void) getComicsCollectionAsyncWithCharacters:(NSString*) characters
                collaborators:(NSString*) collaborators
                creators:(NSString*) creators
                dateDescriptor:(enum DateDescriptorEnum) dateDescriptor
                dateRange:(NSString*) dateRange
                diamondCode:(NSString*) diamondCode
                digitalId:(NSString*) digitalId
                ean:(NSString*) ean
                events:(NSString*) events
                format:(NSString*) format
                formatType:(enum FormatTypeEnum) formatType
                hasDigitalIssue:(NSString*) hasDigitalIssue
                isbn:(NSString*) isbn
                issn:(NSString*) issn
                issueNumber:(NSString*) issueNumber
                limit:(NSString*) limit
                modifiedSince:(NSString*) modifiedSince
                noVariants:(NSString*) noVariants
                offset:(NSString*) offset
                orderBy:(NSString*) orderBy
                series:(NSString*) series
                sharedAppearances:(NSString*) sharedAppearances
                startYear:(NSString*) startYear
                stories:(NSString*) stories
                title:(NSString*) title
                titleStartsWith:(NSString*) titleStartsWith
                upc:(NSString*) upc
                completionBlock:(CompletedGetComicsCollection) onCompleted
{
    //the base uri for api requests
    NSString* _baseUri = [NSString stringWithString: (NSString*) [Configuration BaseUri]];

    //prepare query string for API call
    NSMutableString* _queryBuilder = [NSMutableString stringWithString: _baseUri]; 
    [_queryBuilder appendString: @"/comics"];

    //process optional query parameters
    [APIHelper appendUrl: _queryBuilder withQueryParameters: @{
                    @"characters": (nil != characters) ? characters : [NSNull null],
                    @"collaborators": (nil != collaborators) ? collaborators : [NSNull null],
                    @"creators": (nil != creators) ? creators : [NSNull null],
                    @"dateDescriptor": [DateDescriptorEnumHelper stringFromDateDescriptorEnum: (enum DateDescriptorEnum) dateDescriptor withDefault: [NSNull null]],
                    @"dateRange": (nil != dateRange) ? dateRange : [NSNull null],
                    @"diamondCode": (nil != diamondCode) ? diamondCode : [NSNull null],
                    @"digitalId": (nil != digitalId) ? digitalId : [NSNull null],
                    @"ean": (nil != ean) ? ean : [NSNull null],
                    @"events": (nil != events) ? events : [NSNull null],
                    @"format": (nil != format) ? format : [NSNull null],
                    @"formatType": [FormatTypeEnumHelper stringFromFormatTypeEnum: (enum FormatTypeEnum) formatType withDefault: [NSNull null]],
                    @"hasDigitalIssue": (nil != hasDigitalIssue) ? hasDigitalIssue : [NSNull null],
                    @"isbn": (nil != isbn) ? isbn : [NSNull null],
                    @"issn": (nil != issn) ? issn : [NSNull null],
                    @"issueNumber": (nil != issueNumber) ? issueNumber : [NSNull null],
                    @"limit": (nil != limit) ? limit : [NSNull null],
                    @"modifiedSince": (nil != modifiedSince) ? modifiedSince : [NSNull null],
                    @"noVariants": (nil != noVariants) ? noVariants : [NSNull null],
                    @"offset": (nil != offset) ? offset : [NSNull null],
                    @"orderBy": (nil != orderBy) ? orderBy : [NSNull null],
                    @"series": (nil != series) ? series : [NSNull null],
                    @"sharedAppearances": (nil != sharedAppearances) ? sharedAppearances : [NSNull null],
                    @"startYear": (nil != startYear) ? startYear : [NSNull null],
                    @"stories": (nil != stories) ? stories : [NSNull null],
                    @"title": (nil != title) ? title : [NSNull null],
                    @"titleStartsWith": (nil != titleStartsWith) ? titleStartsWith : [NSNull null],
                    @"upc": (nil != upc) ? upc : [NSNull null],
                    @"apikey": [Configuration Apikey]
                }];

    //validate and preprocess url
    NSString* _queryUrl = [APIHelper cleanUrl: _queryBuilder];

    //preparing request headers
    NSMutableDictionary* _headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"APIMATIC 2.0",
        @"accept": @"application/json",
        @"referer": [Configuration Referer]
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: _headers];


    //prepare the request and fetch response  
    HttpRequest* _request = [[self clientInstance] get: ^(HttpRequest* _request) 
    { 
        [_request setQueryUrl: _queryUrl]; //set request url        
        [_request setHeaders: _headers]; //set request headers

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: _request
     success: ^(id _context, HttpResponse *_response) {
         //Error handling using HTTP status codes
         NSError* _statusError = nil;

         //Error handling using HTTP status codes 
         if (_response.statusCode == 409)
             _statusError = [[APIError alloc] initWithReason: @"Limit greater than 100."
                                                    andCode: _response.statusCode
                                                    andData: _response.rawBody];

         else if((_response.statusCode < 200) || (_response.statusCode > 206)) //[200,206] = HTTP OK
             _statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                    andCode: _response.statusCode
                                                    andData: _response.rawBody];

         if(_statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, _context, nil, _statusError);
         }
         else
         {
             //return _response to API caller
             NSString* _strResult = [(HttpStringResponse*)_response body];
             ComicDataWrapper* _result = (ComicDataWrapper*) [APIHelper jsonDeserialize: _strResult
                toClass: ComicDataWrapper.class];

 
             //announce completion with success
             onCompleted(YES, _context, _result, nil);
         }
     } failure:^(id _context, NSError *_error) {
 
         //announce completion with failure
         onCompleted(NO, _context, nil, _error);
     }];
}


@end