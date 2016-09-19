//
//  LiveModel.m
//  day11作业
//
//  Created by tarena29 on 16/9/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LiveModel.h"

@implementation LiveModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"live_review":[Live_ReviewModel class],@"top":[LiveTopModel class],@"future":[LiveFutureModel class]};
}
@end
@implementation LiveFutureModel

@end


@implementation Live_ReviewModel

@end


@implementation LiveTopModel

@end


