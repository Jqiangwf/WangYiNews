//
//  SubjectModel.m
//  day11作业
//
//  Created by tarena36 on 16/9/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "SubjectModel.h"

@implementation SubjectModel

@end
@implementation SubjectDataModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"expertList":[SubjectDataExpertlistModel class]};
}
@end


@implementation SubjectDataExpertlistModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"desc":@"description"};
}
@end


