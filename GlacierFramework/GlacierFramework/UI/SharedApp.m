//
//  SharedApp.m
//  GlacierFramework
//
//  Created by chang liang on 12-7-15.
//  Copyright (c) 2012年 Glacier. All rights reserved.
//

#import "SharedApp.h"

@implementation SharedApp
{
    SDKVersion mSDKVersion;
}

- (SDKVersion)currentVersion
{
    if (!mSDKVersion.firstVersion) 
    {
        UIDevice * wDevice = [UIDevice currentDevice];
        NSArray * wArr = [wDevice.systemVersion componentsSeparatedByString:@"."];
        if ([wArr count] > 0) {
            mSDKVersion.firstVersion = ((NSString *)[wArr objectAtIndex:0]).intValue;
        }
        if ([wArr count] > 2) {
            mSDKVersion.secondVersion = ((NSString *)[wArr objectAtIndex:2]).intValue;
        }
        if ([wArr count] > 4) {
            mSDKVersion.thirdVersion = ((NSString *)[wArr objectAtIndex:4]).intValue;
        }
    }
    return mSDKVersion;
}


+ (SharedApp *) instance
{
    static SharedApp * _instance;
    if (!_instance) 
    {
        _instance = [[SharedApp alloc]init];
    }
    return _instance;
}


@end
