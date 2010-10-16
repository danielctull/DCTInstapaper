//
//  DTInstapaperLoginConnection.m
//  DTInstapaperKit
//
//  Created by Daniel Tull on 17.03.2010.
//  Copyright 2010 Daniel Tull. All rights reserved.
//

#import "DTInstapaperLoginConnection.h"

@implementation DTInstapaperLoginConnection

- (NSMutableURLRequest *)newRequest {
	NSMutableURLRequest *request = [super newRequest];
	[request setURL:[NSURL URLWithString:@"https://www.instapaper.com/api/authenticate"]];
	return request;
}

@end
