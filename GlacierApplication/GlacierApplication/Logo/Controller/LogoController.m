//
//  LogoController.m
//  GlacierApplication
//
//  Created by chang liang on 12-7-14.
//  Copyright (c) 2012年 Glacier. All rights reserved.
//

#import "LogoController.h"
#import "TestJSON.h"

@interface LogoController ()

@end

@implementation LogoController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    TestJSON * wTest = [[TestJSON alloc]init];
    [wTest parseJson:[request responseString]];
    NSLog(@"%@",wTest.name);
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    [super requestFailed:request];
    NSLog(@"111");
}

- (IBAction)onAction:(id)sender 
{
    TestJSON * wTest = [[TestJSON alloc]init];
    wTest.name = @"小小星";
    [self doHttpRequest:@"http://localhost:8080/WebApp/MyServlet" postJSONData:wTest];
    [wTest release];
}
@end
