//
//  DCTInstapaperAddConnection.h
//  DCTInstapaperKit
//
//  Created by Daniel Tull on 17.03.2010.
//  Copyright 2010 Daniel Tull. All rights reserved.
//

#import "DCTInstapaperConnectionController.h"

@interface DCTInstapaperAddConnection : DCTInstapaperConnectionController {
	NSString *url, *title, *selection;
}
@property (nonatomic, retain) NSString *url, *title, *selection;
@end
