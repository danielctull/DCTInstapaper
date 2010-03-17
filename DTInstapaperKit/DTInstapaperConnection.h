//
//  DTInstapaperConnection.h
//  DTInstapaperKit
//
//  Created by Daniel Tull on 17.03.2010.
//  Copyright 2010 Daniel Tull. All rights reserved.
//

#import "DTConnection.h"

@interface DTInstapaperConnection : DTConnection {
	NSString *username, *password;
}
@property (nonatomic, retain) NSString *username, *password;
@end
