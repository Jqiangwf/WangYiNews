//
//  SubjectHeadModel.m
//  day11作业
//
//  Created by tarena36 on 16/9/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "SubjectHeadModel.h"

@implementation SubjectHeadModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data":@"SubjectHeadDataModel"};
}
@end
@implementation SubjectHeadDataModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}
@end


