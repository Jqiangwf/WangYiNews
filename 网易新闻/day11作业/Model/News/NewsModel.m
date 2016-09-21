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
    NSDictionary* dic=@{@"T":@[@"tid",@"T1467284926140",@"T1348648517839",@"T1348649079062",@"推荐",@"深圳",@"视频",@"T1348648756099",@"T1348649580692",@"list",@"T1348650593803",@"live_review",@"深圳",@"T1350383429665",@"T1348648141035",@"T1368497029546",@"T1348654105308",@"T1370583240249",@"T1348654151579",@"T1414389941036",@"T1414142214384",@"T1444270454635",@"T1444289532601",@"T1356600029035",@"T1348648037603",@"T1411113472760",@"T1348649776727",@"T1348649145984",@"T1474271789612",@"T1348648650048",@"T1473054348939",@"T1348649503389",@"T1348649176279",@"T1348649176279",@"T1348649654285",@"T1351233117091",@"T1421997195219",@"T1456394562871",@"T1348654204705",@"T1401272877187",@"T1385429690972",@"T1348654225495",@"T1397116135282",@"T1397016069906",@"T1464592736048",@"T1348650839000",@"T1441074311424",@"default",@"T1419386532423",@"T1419386592923"]};
    return dic;
}
@end
@implementation NewsTModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"imgextra":[NewsImgextraModel class]};
}
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"templateT":@"template"};
}
@end


@implementation NewsImgextraModel

@end


