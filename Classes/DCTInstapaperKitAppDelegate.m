//
//  DCTInstapaperKitAppDelegate.m
//  DCTInstapaperKit
//
//  Created by Daniel Tull on 17.03.2010.
//  Copyright Daniel Tull 2010. All rights reserved.
//

#import "DCTInstapaperKitAppDelegate.h"
#import "DCTInstapaperLoginConnection.h"
#import "DCTInstapaperAddConnection.h"

@implementation DCTInstapaperKitAppDelegate

@synthesize window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
	DCTInstapaperLoginConnection *login = [[DCTInstapaperLoginConnection alloc] init];
	login.username = @"danieltull";
	[login connect];
	
	DCTInstapaperAddConnection *add = [[DCTInstapaperAddConnection alloc] init];
	add.username = @"danieltull";
	add.url = @"http://www.engadget.com/2010/03/17/uk-folding-plug-takes-home-design-award-emerges-in-usb-infused/";
	[add connect];
	
    // Override point for customization after application launch
	
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end