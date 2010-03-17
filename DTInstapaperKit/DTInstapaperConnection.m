//
//  DTInstapaperConnection.m
//  DTInstapaperKit
//
//  Created by Daniel Tull on 17.03.2010.
//  Copyright 2010 Daniel Tull. All rights reserved.
//

#import "DTInstapaperConnection.h"


@implementation DTInstapaperConnection
@synthesize username, password;

- (void)dealloc {
	[username release]; username = nil;
	[password release]; password = nil;
	[super dealloc];
}

- (NSMutableURLRequest *)newRequest {
	self.type = DTConnectionTypePost;
	
	NSMutableURLRequest *request = [super newRequest];
	
	NSMutableString *bodyString = [[NSMutableString alloc] init];
	
	[bodyString appendFormat:@"username=%@", self.username];
	if (self.password && ![self.password isEqualToString:@""]) [bodyString appendFormat:@"&password=%@", self.password];
	
	NSData *body = [bodyString dataUsingEncoding:NSUTF8StringEncoding];
	[bodyString release];
	[request setHTTPBody:body];
	
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
	
	NSLog(@"%@:%s %i", self, _cmd, statusCode);
	if (statusCode == 200) {
		
	} else if (statusCode == 403) {
		
	} else if (statusCode == 500) {
		
	}
	
	//200: OK
	//403: Invalid username or password.
	//500: The service encountered an error. Please try again later.
}

@end
