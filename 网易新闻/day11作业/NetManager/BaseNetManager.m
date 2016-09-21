//
//  BaseNetManager.m
//  day11作业
//
//  Created by tarena07 on 16/9/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseNetManager.h"

@implementation BaseNetManager
+(id)POST:(NSString *)path parameters:(NSDictionary*)parameters handler:(void (^)(id , NSError *))handler{
    AFHTTPSessionManager* manager=[AFHTTPSessionManager manager];
    return [manager GET:path parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        !handler?:handler(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        !handler?: handler(nil,error);
    }];
}

+(id)GET:(NSString *)path parameters:(NSDictionary *)parameters handler:(void (^)(id, NSError *))handler{
    AFHTTPSessionManager* manager=[AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", nil];
    manager.requestSerializer.timeoutInterval = 30;

return [manager GET:path parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    !handler?:handler(responseObject,nil);
} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    !handler?:handler(nil,error);
}];
}

@end
