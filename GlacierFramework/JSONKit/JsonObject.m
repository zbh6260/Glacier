//
//  JsonObject.m
//  GlacierFramework
//
//  Created by chang liang on 12-7-14.
//  Copyright (c) 2012年 Glacier. All rights reserved.
//

#import "JsonObject.h"
#import "JSONKit.h"
#if (! TARGET_OS_IPHONE)
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

@implementation JsonObject
- (NSString *) toJson //有待修改嵌套问题
{
    NSMutableDictionary * wDict = [[NSMutableDictionary alloc]init];
    
    unsigned int outCount;
    objc_property_t *propList = class_copyPropertyList([self class], &outCount);
    for (int i=0; i < outCount; i++)
	{
		objc_property_t oneProp = propList[i];
		NSString *propName = [NSString stringWithUTF8String:property_getName(oneProp)];
		NSString *attrs = [NSString stringWithUTF8String: property_getAttributes(oneProp)];
        
        if ([attrs rangeOfString:@"JsonObject"].location == NSNotFound)
        {
            [wDict setValue:[self valueForKey:propName] forKey:propName];
        }
        else 
        {
            [wDict setValue:[[self valueForKey:propName] toJson] forKey:propName];
        }
    }
    free(propList);
    NSString * wJson = [wDict JSONString];
    [wDict release];
    return wJson;
}

- (void) parseJson:(NSString*)jsonString
{
    
    unsigned int outCount;
    objc_property_t *propList = class_copyPropertyList([self class], &outCount);
    NSMutableDictionary * wPropDict = [[NSMutableDictionary alloc]init];
    
    for (int i=0; i < outCount; i++)
	{
        objc_property_t oneProp = propList[i];
		NSString *propName = [NSString stringWithUTF8String:property_getName(oneProp)];
        [wPropDict setValue:propName forKey:@""];
    }
    
    
    NSDictionary * wDict = [jsonString objectFromJSONString];

    for (NSString * wKey in [wDict allKeys]) 
    {
        if ([wPropDict valueForKey:wKey]) 
        {
            [self setValue:[wDict valueForKey:wKey] forKey:wKey];
        }
    }
    
    free(propList);
    [wPropDict release];
}

@end






