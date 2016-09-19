//
//  AmusementModel.m
//  day11作业
//
//  Created by tarena07 on 16/9/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "AmusementModel.h"

@implementation AmusementModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"T1":[AmusementT1Model class],@"ads":[AmusementAdsModel class]};
}
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"T1":@"T1348648517839"};
}

@end
@implementation AmusementT1Model
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"templateT":@"template"};
}
@end


@implementation AmusementAdsModel

@end


