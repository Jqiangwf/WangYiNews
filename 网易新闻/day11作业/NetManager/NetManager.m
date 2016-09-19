//
//  NetManager.m
//  day11作业
//
//  Created by tarena07 on 16/9/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NetManager.h"
//精选
#define kNewsPath @"http://c.m.163.com/nc/article/list/T1467284926140/%ld-20.html"

//娱乐推荐
#define kRecommend @"http://c.3g.163.com/recommend/getSubDocNews?channel=T1348648517839&passport=&devId=%2BHR%2BqKmEtzzOiJc1B1%2B5KUOAPPZbmjCUsahBddPwEqUgQyxEjg%2BSovpUfWEA3x%2BG&offset=0&size=5&version=15.1&spever=false&net=wifi&lat=&lon=&ts=1474010702&sign=LSVJQFMRAsHX%2BZrFHl6ES5FD5vYND4MnCiYR86zhx9J48ErR02zJ6%2FKXOnxX046I&encryption=1&canal=appstore"
//娱乐
#define kAmusement @"http://c.m.163.com/nc/article/list/T1348648517839/%ld-20.html"
//直播
#define kLivePath @"http://data.live.126.net/livechannel/previewlist/%ld.json"

//精选
@implementation NetManager
+(id)getNewsModelPage:(NSInteger)page handler:(void (^)(NewsModel *, NSError *))handler{
return [self GET:[NSString stringWithFormat:kNewsPath,page] parameters:nil handler:^(id responseObj, NSError *error) {
    !handler?:handler([NewsModel parse:responseObj],error);
}];
}

//娱乐推荐Model
+(id)getRecommendModelhanler:(void (^)(NSArray<RecommendModel *> *, NSError *))handler{
    return [self POST:@"http://c.3g.163.com/recommend/getSubDocNews" parameters:@{@"channel":@"T1348648517839",@"passport":@"",@"devId":@"%2BHR%2BqKmEtzzOiJc1B1%2B5KUOAPPZbmjCUsahBddPwEqUgQyxEjg%2BSovpUfWEA3x%2BG&offset=0",@"size":@"5",@"version":@"15.1",@"spever":@"false",@"net":@"wifi",@"lat":@"",@"lon":@"",@"ts":@"1474010702",@"sign":@"LSVJQFMRAsHX%2BZrFHl6ES5FD5vYND4MnCiYR86zhx9J48ErR02zJ6%2FKXOnxX046I&encryption=1&canal=appstore"} handler:^(id responseObj, NSError *error) {
        !handler?:handler([RecommendModel parse:responseObj],error);
    }];
}
//娱乐
+(id)getAmusementModelPage:(NSInteger)page handler:(void (^)(AmusementModel *, NSError *))handler{
return [self GET:[NSString stringWithFormat:kAmusement,page] parameters:nil handler:^(id responseObj, NSError *error) {
    !handler?: handler([AmusementModel parse:responseObj],error);
}];
}
//直播
+(id)getLivePage:(NSInteger)page handler:(void (^)(LiveModel *, NSError *))handler{
    return [self GET:[NSString stringWithFormat:kLivePath,page] parameters:nil handler:^(id responseObj, NSError *error) {
        !handler ?:handler([LiveModel parse:responseObj],error);
    }];
}

@end
