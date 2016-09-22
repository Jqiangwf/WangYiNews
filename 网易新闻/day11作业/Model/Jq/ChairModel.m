//
//  ChairModel.m
//  day11作业
//
//  Created by tarena29 on 16/9/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ChairModel.h"

@implementation ChairModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"Template":@"template"};
}
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"messages" :[ChairMessagesModel class], @"commentator" :[ChairCommentatorModel class]};
}
@end
@implementation ChairChatconfigModel

@end


@implementation ChairVideoModel

@end


@implementation ChairFloatlayerModel

@end


@implementation ChairBannerModel

@end


@implementation ChairCommentatorModel

@end


@implementation ChairMessagesModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"images" :[ChairMessageImagesModel class]};
}
@end


@implementation ChairMessagesMsgModel

@end





@implementation ChairMessageImagesModel

@end


