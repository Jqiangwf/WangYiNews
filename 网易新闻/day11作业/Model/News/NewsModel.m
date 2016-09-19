//
//  NewsModel.m
//  day11作业
//
//  Created by tarena07 on 16/9/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"T":[NewsTModel class]};
}
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"T":@"T1467284926140"};
}
@end
@implementation NewsTModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"imgsrc":[NewsImgextraModel class]};
}
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"templateT":@"template"};
}
@end


@implementation NewsImgextraModel

@end


