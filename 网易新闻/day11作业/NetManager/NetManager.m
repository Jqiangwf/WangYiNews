//
//  NetManager.m
//  day11作业
//
//  Created by tarena07 on 16/9/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NetManager.h"

//头条
#define kHeadLine @"http://c.3g.163.com/recommend/getSubDocPic?from=toutiao&fn=2&prog=LMA1&passport=&devId=%2BHR%2BqKmEtzzOiJc1B1%2B5KUOAPPZbmjCUsahBddPwEqUgQyxEjg%2BSovpUfWEA3x%2BG&offset=19&size=20&version=15.1&spever=false&net=wifi&lat=w0Znxluz0graG2Rj856s3g%3D%3D&lon=Et5pBDwGFZ98hHvd%2BwmOhA%3D%3D&ts=1474297295&sign=e2yY6TOajOAVHolR%2FElOpgsUWJkbdqgpiuRsNcbB0XJ48ErR02zJ6%2FKXOnxX046I&encryption=1&canal=appstore"
//精选
#define kJingXuan @"http://c.m.163.com/nc/article/list/T1467284926140/%ld-20.html"

//娱乐推荐
#define kRecommend @"http://c.3g.163.com/recommend/getSubDocNews?channel=T1348648517839&passport=&devId=%2BHR%2BqKmEtzzOiJc1B1%2B5KUOAPPZbmjCUsahBddPwEqUgQyxEjg%2BSovpUfWEA3x%2BG&offset=0&size=5&version=15.1&spever=false&net=wifi&lat=&lon=&ts=1474010702&sign=LSVJQFMRAsHX%2BZrFHl6ES5FD5vYND4MnCiYR86zhx9J48ErR02zJ6%2FKXOnxX046I&encryption=1&canal=appstore"
//娱乐
#define kAmusement @"http://c.m.163.com/nc/article/list/T1348648517839/%ld-20.html"
//体育
#define kSports @"http://c.m.163.com/nc/article/list/T1348649079062/%ld-20.html"
//网易号
#define kWanYiHao @"http://c.3g.163.com/recommend/getSubDocPic?from=netease_h&passport=&devId=%2BHR%2BqKmEtzzOiJc1B1%2B5KUOAPPZbmjCUsahBddPwEqUgQyxEjg%2BSovpUfWEA3x%2BG&offset=0&size=20&version=15.1&spever=false&net=wifi&lat=w0Znxluz0graG2Rj856s3g%3D%3D&lon=Et5pBDwGFZ98hHvd%2BwmOhA%3D%3D&ts=1474297187&sign=6AWeweVLbi3O6bubSH%2FnVZ4E75m%2BIPxbC3BWcQwrQDB48ErR02zJ6%2FKXOnxX046I&encryption=1&canal=appstore"
//本地
#define kBenDi @"http://c.m.163.com/nc/article/local/5rex5Zyz/%ld-20.html"
//视频
#define kVideo @"http://c.3g.163.com/recommend/getChanListNews?channel=T1457068979049&fn=1&passport=&devId=%2BHR%2BqKmEtzzOiJc1B1%2B5KUOAPPZbmjCUsahBddPwEqUgQyxEjg%2BSovpUfWEA3x%2BG&offset=20&size=10&version=15.1&spever=false&net=wifi&lat=w0Znxluz0graG2Rj856s3g%3D%3D&lon=Et5pBDwGFZ98hHvd%2BwmOhA%3D%3D&ts=1474292218&sign=h8ba0jFVLVSprNEBYDhBJyMl%2F%2FlO4FuoGWB%2Bk0RriC548ErR02zJ6%2FKXOnxX046I&encryption=1&canal=appstore"
//财经
#define kFinance @"http://c.m.163.com/nc/article/list/T1348648756099/%ld-20.html"
//科技
#define kScience @"http://c.m.163.com/nc/article/list/T1348649580692/%ld-20.html"
//汽车
#define kCar @"http://c.m.163.com/nc/auto/list/5rex5Zyz/%ld-20.html"
//时尚
#define kFashion @"http://c.m.163.com/nc/article/list/T1348650593803/%ld-20.html"

//图片(NO)
#define kPhoto @"http://c.m.163.com/photo/api/list/0096/4GJ60096.json"
#define kPhoto1 @"http://c.m.163.com/photo/api/morelist/0096/4GJ60096/%ld.json"//-10,108480

//直播(NO)
#define kNeteaseLive @"http://data.live.126.net/livechannel/previewlist.json"
#define kNeteaseLive1 @"http://data.live.126.net/livechannel/previewlist/%ld.json"//+1;2

//热点
#define KHotSpot @"http://c.3g.163.com/recommend/getSubDocNews?passport=&devId=%2BHR%2BqKmEtzzOiJc1B1%2B5KUOAPPZbmjCUsahBddPwEqUgQyxEjg%2BSovpUfWEA3x%2BG&offset=10&size=20&version=15.1&spever=false&net=wifi&lat=w0Znxluz0graG2Rj856s3g%3D%3D&lon=Et5pBDwGFZ98hHvd%2BwmOhA%3D%3D&ts=1474293334&sign=zkd1idoGghNT80Yv2SzuzepF%2BtdoMDMM7xROKrwsu1l48ErR02zJ6%2FKXOnxX046I&encryption=1&canal=appstore"
//跟帖(NO)
#define kGenTie @"http://c.m.163.com/nc/article/comment/bestlist/T1419315959525/%ld-20.html?format=building&headLimit=3&ibc=newsappios&limit=20&offset=0&showLevelThreshold=5&tailLimit=2"//+20
//房产(NO)
#define kHouse @"http://c.m.163.com/nc/article/house/5rex5Zyz/%ld-20.html"
//轻松一刻
#define kRelaxedMoment @"http://c.m.163.com/nc/article/list/T1350383429665/%ld-20.html"
//段子

#define kJOKE @"http://c.3g.163.com/recommend/getChanRecomNews?channel=duanzi&passport=&devId=%2BHR%2BqKmEtzzOiJc1B1%2B5KUOAPPZbmjCUsahBddPwEqUgQyxEjg%2BSovpUfWEA3x%2BG&offset=0&size=20&version=15.1&spever=false&net=wifi&lat=w0Znxluz0graG2Rj856s3g%3D%3D&lon=Et5pBDwGFZ98hHvd%2BwmOhA%3D%3D&ts=1474293797&sign=wYxUf5KceR4jZi%2F17xLYszPaPFy4jKysqpxyEXYy3o148ErR02zJ6%2FKXOnxX046I&encryption=1&canal=appstore"

//军事
#define kJunShi   @"http://c.m.163.com/nc/article/list/T1348648141035/%ld-20.html"
//历史
#define kHistory  @"http://c.m.163.com/nc/article/list/T1368497029546/%ld-20.html"
//家居
#define kJiaJun   @"http://c.m.163.com/nc/article/list/T1348654105308/%ld-20.html"
//独家
#define kDuJia    @"http://c.m.163.com/nc/article/list/T1370583240249/%ld-20.html"
//游戏
#define kGame @"http://c.m.163.com/nc/article/list/T1348654151579/%ld-20.html"
//健康
#define kHealth @"http://c.m.163.com/nc/article/list/T1414389941036/%ld-20.html"
//政法
#define kPolitics @"http://c.m.163.com/nc/article/list/T1414142214384/%ld-20.html"
//漫画
#define kCartoon  @"http://c.m.163.com/nc/article/list/T1444270454635/%ld-20.html"
//哒哒趣闻
#define kDaDaQuWen @"http://c.m.163.com/nc/article/list/T1444289532601/%ld-20.html"
//彩票
#define kLottery @"http://c.m.163.com/nc/article/list/T1356600029035/%ld-20.html"

//美女
#define kBelle @"http://c.3g.163.com/recommend/getChanListNews?channel=T1456112189138&passport=&devId=%2BHR%2BqKmEtzzOiJc1B1%2B5KUOAPPZbmjCUsahBddPwEqUgQyxEjg%2BSovpUfWEA3x%2BG&offset=0&size=20&version=15.1&spever=false&net=wifi&lat=w0Znxluz0graG2Rj856s3g%3D%3D&lon=Et5pBDwGFZ98hHvd%2BwmOhA%3D%3D&ts=1474295069&sign=W7DrbW6X6%2B2%2FIF%2FtyfMNDtPFeGuSZ0s%2BAe%2BAzfDEO7548ErR02zJ6%2FKXOnxX046I&encryption=1&canal=appstore"
//社会
#define kSociety @"http://c.m.163.com/nc/article/list/T1348648037603/%ld-20.html"
//跑步

#define kRunning @"http://c.m.163.com/nc/article/list/T1411113472760/%ld-20.html"
//数码
#define kShuMa @"http://c.m.163.com/nc/article/list/T1348649776727/%ld-20.html"
//NBA
#define kNBA @"http://c.m.163.com/nc/article/list/T1348649145984/%ld-20.html"
//航空
#define kAviation @"http://c.m.163.com/nc/article/list/T1474271789612/%ld-20.html"
//影视歌
#define kYSSong @"http://c.m.163.com/nc/article/list/T1348648650048/%ld-20.html"

//股票
#define kStock @"http://c.m.163.com/nc/article/list/T1473054348939/%ld-20.html"

//中国足球
#define kChineseFootball @"http://c.m.163.com/nc/article/list/T1348649503389/%ld-20.html"

//国际足球
#define kInternationalFootball @"http://c.m.163.com/nc/article/list/T1348649176279/%ld-20.html"
//CBA
#define kCBA @"http://c.m.163.com/nc/article/list/T1348649176279/%ld-20.html"
//手机
#define kPhone @"http://c.m.163.com/nc/article/list/T1348649654285/%ld-20.html"

//智能
#define kBrainPower @"http://c.m.163.com/nc/article/list/T1351233117091/%ld-20.html"
//云课堂
#define kYKT @"http://c.m.163.com/nc/article/list/T1421997195219/%ld-20.html"
//态度公开课
#define kTDGKK @"http://c.m.163.com/nc/article/list/T1456394562871/%ld-20.html"
//旅游
#define kTravel @"http://c.m.163.com/nc/article/list/T1348654204705/%ld-20.html"
//读书
#define kDuShu @"http://c.m.163.com/nc/article/list/T1401272877187/%ld-20.html"
//酒香
#define kJiuXiang @"http://c.m.163.com/nc/article/list/T1385429690972/%ld-20.html"
//教育
#define kEducation @"http://c.m.163.com/nc/article/list/T1348654225495/%ld-20.html"
//亲子
#define kQinZi @"http://c.m.163.com/nc/article/list/T1397116135282/%ld-20.html"
//暴风游戏
#define kBFGame @"http://c.m.163.com/nc/article/list/T1397016069906/%ld-20.html"
//态度营销
#define kTDYingX @"http://c.m.163.com/nc/article/list/T1464592736048/%ld-20.html"
//情感
#define kEmotion @"http://c.m.163.com/nc/article/list/T1348650839000/%ld-20.html"
//艺术
#define kArt @"http://c.m.163.com/nc/article/list/T1441074311424/%ld-20.html"
//海外
#define kHaiWai @"http://c.m.163.com/nc/oversea/defaultList/%ld-20.html"
//博客
#define kBlogs @"http://c.m.163.com/nc/article/list/T1419386532423/%ld-20.html"
//论坛
#define kForum @"http://c.m.163.com/nc/article/list/T1419386592923/%ld-20.html"
//萌宠
#define kMengCong @"http://c.3g.163.com/recommend/getChanListNews?channel=T1456112438822&passport=&devId=%2BHR%2BqKmEtzzOiJc1B1%2B5KUOAPPZbmjCUsahBddPwEqUgQyxEjg%2BSovpUfWEA3x%2BG&offset=0&size=20&version=15.1&spever=false&net=wifi&lat=w0Znxluz0graG2Rj856s3g%3D%3D&lon=Et5pBDwGFZ98hHvd%2BwmOhA%3D%3D&ts=1474297136&sign=wMmXaJyd%2FOVgRSzXN7Ga3OvmWS05jJyenvaUD7S2att48ErR02zJ6%2FKXOnxX046I&encryption=1&canal=appstore"







//直播
#define kLivePath @"http://data.live.126.net/livechannel/previewlist/%ld.json"
//评论
#define kDisscusPath @"http://data.chat.126.net/route_room?topicid=%ld"
#define kChairPath @"http://data.live.126.net/liveAll/%ld.json"





//话题
#define kSubjectPath @"http://c.3g.163.com/newstopic/list/expert/YWxs/%ld-10.html"


@implementation NetManager



+(id)getNewsModelPage:(NSInteger)page newsPageEnum:(NewsPageEnum)newsPageEnum handler:(void (^)(NewsModel *, NSError *))handler{
    NSString* str=nil;
    switch (newsPageEnum) {
        case HeadLine: {
            str=kHeadLine;
            break;
        }
        case JingXuan: {
            str=[NSString stringWithFormat:kJingXuan,page];
            break;
        }
        case Amusement: {
            str=[NSString stringWithFormat:kAmusement,page];
            break;
        }
        case Sports: {
            str=[NSString stringWithFormat:kSports,page];
            break;
        }
        case WanYiHao: {
            str=kWanYiHao;
            break;
        }
        case BenDi: {
            str=[NSString stringWithFormat:kBenDi,page];
            break;
        }
        case Video: {
            str=kVideo;
            break;
        }
        case Finance: {
            str=[NSString stringWithFormat:kFinance,page];
            break;
        }
        case Science: {
            str=[NSString stringWithFormat:kScience,page];
            break;
        }
        case Car: {
            str=[NSString stringWithFormat:kCar,page];
            break;
        }
        case Fashion: {
            str=[NSString stringWithFormat:kFashion,page];
            break;
        }
        case Photo: {
            str=[NSString stringWithFormat:kPhoto1,108480-page/2];
            break;
        }
        case NeteaseLive: {
            str=[NSString stringWithFormat:kNeteaseLive1,2+page/20];
            break;
        }
        case HotSpot: {
            str=KHotSpot;
            break;
        }
        case GenTie: {
            str=[NSString stringWithFormat:kGenTie,page];
            break;
        }
        case House: {
            str=[NSString stringWithFormat:kHouse,page];
            break;
        }
        case RelaxedMoment: {
            str=[NSString stringWithFormat:kRelaxedMoment,page];
            break;
        }
        case JOKE: {
            str=kJOKE;
            break;
        }
        case JunShi: {
            str=[NSString stringWithFormat:kJunShi,page];
            break;
        }
        case History: {
            str=[NSString stringWithFormat:kHistory,page];
            break;
        }
        case JiaJun: {
            str=[NSString stringWithFormat:kJiaJun,page];
            break;
        }
        case DuJia: {
            str=[NSString stringWithFormat:kDuJia,page];
            break;
        }
        case Game: {
            str=[NSString stringWithFormat:kGame,page];
            break;
        }
        case Health: {
            str=[NSString stringWithFormat:kHealth,page];
            break;
        }
        case Politics: {
            str=[NSString stringWithFormat:kPolitics,page];
            break;
        }
        case Cartoon: {
            str=[NSString stringWithFormat:kCartoon,page];
            break;
        }
        case DaDaQuWen: {
            str=[NSString stringWithFormat:kDaDaQuWen,page];
            break;
        }
        case Lottery: {
            str=[NSString stringWithFormat:kLottery,page];
            break;
        }
        case Belle: {
            str=kBelle;
            break;
        }
        case Society: {
            str=[NSString stringWithFormat:kSociety,page];
            break;
        }
        case Running: {
            str=[NSString stringWithFormat:kRunning,page];
            break;
        }
        case ShuMa: {
            str=[NSString stringWithFormat:kShuMa,page];
            break;
        }
        case NBA: {
            str=[NSString stringWithFormat:kNBA,page];
            break;
        }
        case Aviation: {
            str=[NSString stringWithFormat:kAviation,page];
            break;
        }
        case YSSong: {
            str=[NSString stringWithFormat:kYSSong,page];
            break;
        }
        case Stock: {
            str=[NSString stringWithFormat:kStock,page];
            break;
        }
        case ChineseFootball: {
            str=[NSString stringWithFormat:kChineseFootball,page];
            break;
        }
        case InternationalFootball: {
            str=[NSString stringWithFormat:kInternationalFootball,page];
            break;
        }
        case CBA: {
            str=[NSString stringWithFormat:kCBA,page];
            break;
        }
        case Phone: {
            str=[NSString stringWithFormat:kPhone,page];
            break;
        }
        case BrainPower: {
            str=[NSString stringWithFormat:kBrainPower,page];
            break;
        }
        case YKT: {
            str=[NSString stringWithFormat:kYKT,page];
            break;
        }
        case TDGKK: {
            str=[NSString stringWithFormat:kTDGKK,page];
            break;
        }
        case Travel: {
            str=[NSString stringWithFormat:kTravel,page];
            break;
        }
        case DuShu: {
            str=[NSString stringWithFormat:kDuShu,page];
            break;
        }
        case JiuXiang: {
            str=[NSString stringWithFormat:kJiuXiang,page];
            break;
        }
        case Education: {
            str=[NSString stringWithFormat:kEducation,page];
            break;
        }
        case QinZi: {
            str=[NSString stringWithFormat:kQinZi,page];
            break;
        }
        case BFGame: {
            str=[NSString stringWithFormat:kBFGame,page];
            break;
        }
        case TDYingX: {
            str=[NSString stringWithFormat:kTDYingX,page];
            break;
        }
        case Emotion: {
            str=[NSString stringWithFormat:kEmotion,page];
            break;
        }
        case Art: {
            str=[NSString stringWithFormat:kArt,page];
            break;
        }
        case HaiWai: {
            str=[NSString stringWithFormat:kHaiWai,page];
            break;
        }
        case Blogs: {
            str=[NSString stringWithFormat:kBlogs,page];
            break;
        }
        case Forum: {
            str=[NSString stringWithFormat:kForum,page];
            break;
        }
        case MengCong: {
            str=kMengCong;
            break;
        }
    }
    return [self GET:str parameters:nil handler:^(id responseObj, NSError *error) {
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
//评论
+(id)getID:(NSInteger)ID Handler:(void (^)(DiscussModel *, NSError *))handler{

    return [self GET:[NSString stringWithFormat:kDisscusPath,ID] parameters:@{@"topicid":@(ID)} handler:^(id responseObj, NSError *error) {
        !handler ?: handler([DiscussModel parse:responseObj],error);
    }];
}
+(id)getRoomID:(NSInteger)ID Handler:(void (^)(ChairModel *, NSError *))handler{
    return [self GET:[NSString stringWithFormat:kChairPath,ID] parameters:nil handler:^(id responseObj, NSError *error) {
        !handler ?: handler([ChairModel parse:responseObj],error);
    }];
}


//话题
+(id)getSubjectModelPage:(NSInteger)page handler:(void (^)(SubjectModel *, NSError *))handler{
    NSString *path = [NSString stringWithFormat:kSubjectPath, page];
    
    return [self GET:path parameters:nil handler:^(id responseObj, NSError *error) {
        !handler ?: handler([SubjectModel parse:responseObj], error);
    }];
}

@end
