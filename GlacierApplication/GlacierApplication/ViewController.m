//
//  ViewController.m
//  GlacierApplication
//
//  Created by chang liang on 12-7-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "JSONKit.h"
#import "SQLitePersistentObject.h"

@interface Test : SQLitePersistentObject
@property (nonatomic,copy) NSString * name;
@end

@implementation Test

@synthesize name;

@end

@interface ViewController ()

@end

@implementation ViewController

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self doHttpRequest:@"http://192.168.1.109/a.json"];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSDictionary * dict = (NSDictionary *)[request responseJson];
    NSLog(@"");
}

@end
