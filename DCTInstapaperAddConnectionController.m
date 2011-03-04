//
//  DCTInstapaperAddConnection.m
//  DCTInstapaperKit
//
//  Created by Daniel Tull on 17.03.2010.
//  Copyright 2010 Daniel Tull. All rights reserved.
//

#import "DCTInstapaperAddConnectionController.h"

@implementation DCTInstapaperAddConnectionController

@synthesize url, title, selection;

- (void)dealloc {
	[url release]; url = nil;
	[title release]; title = nil;
	[selection release]; selection = nil;
	[super dealloc];
}

- (NSString *)baseURLString {
	return @"https://www.instapaper.com/api/add";
}

+ (NSArray *)bodyProperties {
	return [NSArray arrayWithObjects:@"title", @"url", @"selection", nil];
}

- (NSString *)url {
	return [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (void)receivedResponse:(NSURLResponse *)response {
	//201: This URL has been successfully added to this Instapaper account.
	//400: Bad request. Probably missing a required parameter, such as url.
	//403: Invalid username or password.
	//500: The service encountered an error. Please try again later.
	[super receivedResponse:response];
	
	if (![response isKindOfClass:[NSHTTPURLResponse class]]) return;
	
	NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
	
	NSInteger statusCode = [httpResponse statusCode];
	
	NSLog(@"%@:%@ %i", self, NSStringFromSelector(_cmd), statusCode);
	
	if (statusCode == 201) {
		
	} else if (statusCode == 403) {
		
	}
}

@end
