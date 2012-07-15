//
//  LogoController.m
//  GlacierApplication
//
//  Created by chang liang on 12-7-14.
//  Copyright (c) 2012年 Glacier. All rights reserved.
//

#import "LogoController.h"
#import "HomeController.h"

@interface LogoController ()

@end

@implementation LogoController
{
    UINavigationController * mUINavigationController;
    NSTimer * mTimer;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    mTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(onTime) userInfo:nil repeats:false];
}

- (void)onTime
{
    HomeController * wHomeController = [[HomeController alloc]init];
    mUINavigationController = [[UINavigationController alloc]initWithRootViewController:wHomeController];
    mUINavigationController.delegate = self;
    mUINavigationController.view.frame = self.view.bounds;
    [self.view addSubview: mUINavigationController.view];
}


- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(self.sharedApp.currentVersion.firstVersion < 5)
    {
        [viewController viewWillAppear:animated];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

@end
