//
//  SharedApp.h
//  GlacierFramework
//
//  Created by chang liang on 12-7-15.
//  Copyright (c) 2012年 Glacier. All rights reserved.
//
struct SDKVersion 
{
    int firstVersion;
    int secondVersion;
    int thirdVersion;
};
typedef struct SDKVersion SDKVersion;


@interface SharedApp : NSObject
+ (SharedApp *) instance;
@property (nonatomic,readonly) SDKVersion currentVersion;
@end

