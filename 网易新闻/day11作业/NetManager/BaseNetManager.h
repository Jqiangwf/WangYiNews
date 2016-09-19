//
//  BaseNetManager.h
//  day11作业
//
//  Created by tarena07 on 16/9/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseNetManager : NSObject


+(id)POST:(NSString* )path parameters:(NSDictionary*)parameters handler:(void(^)(id responseObj,NSError* error))handler;

+(id)GET:(NSString*)path parameters:(NSDictionary*)parameters handler:(void(^)(id responseObj,NSError* error))handler;


@end
