//
//  DCTInstapaperConnection.m
//  DCTInstapaperKit
//
//  Created by Daniel Tull on 17.03.2010.
//  Copyright 2010 Daniel Tull. All rights reserved.
//

#import "DCTInstapaperConnection.h"
#import "NSData+Base64.h"

@implementation DCTInstapaperConnection
@synthesize username, password;

- (void)dealloc {
	[username release]; username = nil;
	[password release]; password = nil;
	[super dealloc];
}

- (NSMutableURLRequest *)newRequest {
	self.type = DCTConnectionControllerTypePost;
	
	NSMutableURLRequest *request = [super newRequest];
		
	NSString *authorisationString = [NSString stringWithFormat:@"%@:%@", username, password];
	NSData *authorisationData = [authorisationString dataUsingEncoding:NSUTF8StringEncoding];
	NSString *authorisationEncodedString = [authorisationData base64EncodedString];
	NSString *authorisationHeader = [NSString stringWithFormat:@"Basic %@", authorisationEncodedString];
	[request addValue:authorisationHeader forHTTPHeaderField:@"Authorization"];
	
	return request;
}

- (void)receivedError:(NSError *)error {
}

- (void)receivedObject:(NSObject *)object {
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
	
	//200: OK
	//403: Invalid username or password.
	//500: The service encountered an error. Please try again later.
}

@end
