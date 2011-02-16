//
//  DCTInstapaperLoginConnection.m
//  DCTInstapaperKit
//
//  Created by Daniel Tull on 17.03.2010.
//  Copyright 2010 Daniel Tull. All rights reserved.
//

#import "DCTInstapaperLoginConnectionController.h"

@implementation DCTInstapaperLoginConnectionController

- (NSMutableURLRequest *)newRequest {
	NSMutableURLRequest *request = [super newRequest];
	[request setURL:[NSURL URLWithString:@"https://www.instapaper.com/api/authenticate"]];
	return request;
}

@end
