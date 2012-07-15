//
//  GlacierController.m
//  GlacierFramework
//
//  Created by chang liang on 12-7-12.
//  Copyright (c) 2012年 Glacier. All rights reserved.
//

#import "GlacierController.h"
#import "JSONKit.h"
#define TIMEOUT_SECONDS 30

@interface GlacierController ()
-(void) doASIHttpRequest:(ASIHTTPRequest *) request;
@end

@implementation GlacierController
@synthesize sharedApp;
- (SharedApp *)sharedApp
{
    return [SharedApp instance];
}

-(void) doHttpRequest:(NSString *) requestUrl
{
    ASIHTTPRequest * wRequest = [[ASIHTTPRequest alloc]initWithURL:[NSURL URLWithString:requestUrl]];
    [self doASIHttpRequest:wRequest];
    [wRequest release];
}

-(void) doHttpRequest:(NSString *) requestUrl postData:(NSData *)data
{
    ASIHTTPRequest * wRequest = [[ASIHTTPRequest alloc]initWithURL:[NSURL URLWithString:requestUrl]];
    [wRequest setPostLength:data.length];
    [wRequest setPostBody:[NSMutableData dataWithData:data]];
    [self doASIHttpRequest:wRequest];
    [wRequest release];
}

- (void)doHttpRequest:(NSString *)requestUrl postJSONData:(JSONObject *)json
{
    ASIHTTPRequest * wRequest = [[ASIHTTPRequest alloc]initWithURL:[NSURL URLWithString:requestUrl]];
    NSData * wData = [json toJsonData];
    [wRequest setPostLength:wData.length];
    [wRequest setPostBody:[NSMutableData dataWithData:wData]];
    [self doASIHttpRequest:wRequest];
    [wRequest release];
}

-(void) doASIHttpRequest:(ASIHTTPRequest *) request
{
    [request setTimeOutSeconds:TIMEOUT_SECONDS];
    [request setDelegate:self];
    [request startAsynchronous];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return  UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}
@end

