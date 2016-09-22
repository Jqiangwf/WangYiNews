//
//  CategoryModel.m
//  day11作业
//
//  Created by tarena29 on 16/9/21.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "CategoryModel.h"

@implementation CategoryModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"live_review" :[CategoryLive_ReviewModel class]};
}
@end
@implementation CategoryLive_ReviewModel

@end


