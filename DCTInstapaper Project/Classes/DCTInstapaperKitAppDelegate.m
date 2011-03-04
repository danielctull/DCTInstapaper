//
//  DCTInstapaperKitAppDelegate.m
//  DCTInstapaperKit
//
//  Created by Daniel Tull on 17.03.2010.
//  Copyright Daniel Tull 2010. All rights reserved.
//

#import "DCTInstapaperKitAppDelegate.h"
#import "DCTInstapaperLoginConnectionController.h"
#import "DCTInstapaperAddConnectionController.h"

@implementation DCTInstapaperKitAppDelegate

@synthesize window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
	DCTInstapaperLoginConnectionController *login = [[DCTInstapaperLoginConnectionController alloc] init];
	login.username = @"your username";
	login.password = @"your password";
	[login addResponseBlock:^(NSURLResponse *response) {
		NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
		NSLog(@"DCTInstapaperLoginConnectionController returned response: %i", statusCode);
	}];
	[login connect];
	
	DCTInstapaperAddConnectionController *add = [[DCTInstapaperAddConnectionController alloc] init];
	add.username = @"your username";
	add.password = @"your password";
	add.url = @"http://www.engadget.com/2011/03/03/editorial-its-apples-post-pc-world-were-all-just-living/";
	[add addResponseBlock:^(NSURLResponse *response) {
		NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
		NSLog(@"DCTInstapaperAddConnectionController returned response: %i", statusCode);
	}];
	[add connect];
	
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
