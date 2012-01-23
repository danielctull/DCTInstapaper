/*
 DCTInstapaperConnectionController.m
 DCTInstapaper
 
 Created by Daniel Tull on 17.03.2010.
 
 
 
 Copyright (c) 2010 Daniel Tull. All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 * Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 
 * Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.
 
 * Neither the name of the author nor the names of its contributors may be used
 to endorse or promote products derived from this software without specific
 prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "DCTInstapaperConnectionController.h"
#import "NSData+Base64.h"

@implementation DCTInstapaperConnectionController
@synthesize username;
@synthesize password;

- (id)init {
	if (!(self = [super init])) return nil;
	
	self.type = DCTConnectionControllerTypePost;
	
	return self;
}

- (NSString *)baseURLString {
	return @"https://www.instapaper.com/api/";
}

+ (NSArray *)headerProperties {
	return [NSArray arrayWithObject:@"Authorization"];
}

- (id)valueForConnectionKey:(id)key {
	
	if ([key isEqualToString:@"Authorization"]) {
		NSString *authorisationString = [NSString stringWithFormat:@"%@:%@", username, password];
		NSData *authorisationData = [authorisationString dataUsingEncoding:NSUTF8StringEncoding];
		NSString *authorisationEncodedString = [authorisationData base64Encoding];
		return [NSString stringWithFormat:@"Basic %@", authorisationEncodedString];
	}
	
	return [super valueForConnectionKey:key];
}

- (void)connectionDidReceiveResponse {
	
	[super connectionDidReceiveResponse];
	
	NSURLResponse *response = self.returnedResponse;
	
	if (![response isKindOfClass:[NSHTTPURLResponse class]]) return;
	
	NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
	
	//200: OK
	//403: Invalid username or password.
	//500: The service encountered an error. Please try again later.
	
	if (statusCode == 403 || statusCode == 500) {
		
		self.returnedError = [NSError errorWithDomain:@"DCTInstapaper" 
												 code:statusCode
											 userInfo:nil];
		[self connectionDidFail];
	}
}

@end
