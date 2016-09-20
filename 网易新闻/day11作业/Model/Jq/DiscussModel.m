//
//  DiscussModel.m
//  day11作业
//
//  Created by tarena29 on 16/9/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "DiscussModel.h"

@implementation DiscussModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"last_log":[DiscussLast_LogModel class]};
}
@end
@implementation DIscussMsgModel

@end


@implementation DiscussLast_LogModel

@end


