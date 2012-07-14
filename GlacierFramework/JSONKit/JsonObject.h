//
//  JsonObject.h
//  GlacierFramework
//
//  Created by chang liang on 12-7-14.
//  Copyright (c) 2012年 Glacier. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONObject : NSObject
- (NSString *) toJson;
- (NSData *) toJsonData;
- (void) parseJson:(NSString*)jsonString;
@end
