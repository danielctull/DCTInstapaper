//
//  DCTInstapaperConnection.m
//  DCTInstapaperKit
//
//  Created by Daniel Tull on 17.03.2010.
//  Copyright 2010 Daniel Tull. All rights reserved.
//

#import "DCTInstapaperConnectionController.h"
#import "NSData+Base64.h"

@implementation DCTInstapaperConnectionController
@synthesize username, password;

- (void)dealloc {
	[username release]; username = nil;
	[password release]; password = nil;
	[super dealloc];
}

- (id)init {
	if (!(self = [super init])) return nil;
	
	self.type = DCTConnectionControllerTypePost;
	
	return self;
}

+ (NSArray *)headerProperties {
	return [NSArray arrayWithObject:@"Authorization"];
}

- (NSString *)Authorization {
	NSString *authorisationString = [NSString stringWithFormat:@"%@:%@", username, password];
	NSData *authorisationData = [authorisationString dataUsingEncoding:NSUTF8StringEncoding];
	NSString *authorisationEncodedString = [authorisationData base64EncodedString];
	return [NSString stringWithFormat:@"Basic %@", authorisationEncodedString];
}

- (void)receivedResponse:(NSURLResponse *)response {
	
	if (![response isKindOfClass:[NSHTTPURLResponse class]]) return [super receivedResponse:response];
	
	NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
	
	NSInteger statusCode = [httpResponse statusCode];
	
	//NSLog(@"%@:%s %i", self, _cmd, statusCode);
	if (statusCode == 200) {
		
	} else if (statusCode == 403) {
		
	} else if (statusCode == 500) {
		
	}
	
	[super receivedResponse:response];
	
	//200: OK
	//403: Invalid username or password.
	//500: The service encountered an error. Please try again later.
}

@end
