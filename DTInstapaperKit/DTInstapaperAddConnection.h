//
//  DTInstapaperAddConnection.h
//  DTInstapaperKit
//
//  Created by Daniel Tull on 17.03.2010.
//  Copyright 2010 Daniel Tull. All rights reserved.
//

#import "DTInstapaperConnection.h"

@interface DTInstapaperAddConnection : DTInstapaperConnection {
	NSString *url, *title, *selection;
}
@property (nonatomic, retain) NSString *url, *title, *selection;
@end
