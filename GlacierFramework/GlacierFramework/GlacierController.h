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
@interface GlacierController : UIViewController<ASIHTTPRequestDelegate>
-(void) doHttpRequest:(NSString *) requestUrl;
-(void) doHttpRequest:(NSString *) requestUrl postData:(NSData *)data;
-(void) doHttpRequest:(NSString *) requestUrl postJSONData:(JSONObject *)json;
@end