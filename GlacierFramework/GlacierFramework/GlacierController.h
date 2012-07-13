//
//  GlacierController.h
//  GlacierFramework
//
//  Created by chang liang on 12-7-12.
//  Copyright (c) 2012年 Glacier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequestDelegate.h"
#import "ASIHTTPRequest.h"
@interface GlacierController : UIViewController<ASIHTTPRequestDelegate>
-(void) doHttpRequest:(NSString*) requestUrl;
@end
