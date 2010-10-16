//
//  DTInstapaperKitAppDelegate.m
//  DTInstapaperKit
//
//  Created by Daniel Tull on 17.03.2010.
//  Copyright Daniel Tull 2010. All rights reserved.
//

#import "DCTInstapaperKitAppDelegate.h"
#import "DTInstapaperLoginConnection.h"
#import "DTInstapaperAddConnection.h"

@implementation DCTInstapaperKitAppDelegate

@synthesize window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
	DTInstapaperLoginConnection *login = [[DTInstapaperLoginConnection alloc] init];
	login.username = @"danieltull";
	[login connect];
	
	DTInstapaperAddConnection *add = [[DTInstapaperAddConnection alloc] init];
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
