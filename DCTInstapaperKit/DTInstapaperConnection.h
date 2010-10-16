//
//  DTInstapaperConnection.h
//  DTInstapaperKit
//
//  Created by Daniel Tull on 17.03.2010.
//  Copyright 2010 Daniel Tull. All rights reserved.
//

#import "DCTConnectionController.h"

@interface DTInstapaperConnection : DCTConnectionController {
	NSString *username, *password;
}
@property (nonatomic, retain) NSString *username, *password;
@end
