//
//  GlacierController.m
//  GlacierFramework
//
//  Created by chang liang on 12-7-12.
//  Copyright (c) 2012年 Glacier. All rights reserved.
//

#import "GlacierController.h"

@interface GlacierController ()

@end

@implementation GlacierController

-(void) doHttpRequest:(NSString*) requestUrl
{
    ASIHTTPRequest * requset = [[ASIHTTPRequest alloc]initWithURL:[NSURL URLWithString:requestUrl]];
    [requset setDelegate:self];
    [requset startAsynchronous];
}

@end
