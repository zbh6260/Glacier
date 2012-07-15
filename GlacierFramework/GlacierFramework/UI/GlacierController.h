//
//  GlacierController.h
//  GlacierFramework
//
//  Created by chang liang on 12-7-12.
//  Copyright (c) 2012年 Glacier. All rights reserved.
//


#import "ASIHTTPRequestDelegate.h"
#import "ASIHTTPRequest.h"
#import "JSONObject.h"
#import "SharedApp.h"

@interface GlacierController : UIViewController<ASIHTTPRequestDelegate>
@property (nonatomic,readonly) SharedApp * sharedApp;
@end

@interface GlacierController(http)
-(void) doHttpRequest:(NSString *) requestUrl;
-(void) doHttpRequest:(NSString *) requestUrl postData:(NSData *)data;
-(void) doHttpRequest:(NSString *) requestUrl postJSONData:(JSONObject *)json;
@end