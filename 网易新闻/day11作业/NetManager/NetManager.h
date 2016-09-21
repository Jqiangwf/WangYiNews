//
//  NetManager.h
//  day11作业
//
//  Created by tarena07 on 16/9/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "RecommendModel.h"
#import "AmusementModel.h"
#import "LiveModel.h"
#import "DiscussModel.h"
#import "ChairModel.h"
#import "SubjectModel.h"

typedef NS_ENUM(NSInteger,NewsPageEnum) {
    HeadLine,JingXuan,Amusement,Sports,WanYiHao,BenDi,Video,Finance,Science,Car,Fashion,Photo,NeteaseLive,HotSpot,GenTie,House,RelaxedMoment,JOKE,JunShi,History,JiaJun,DuJia,Game,Health,Politics,Cartoon,DaDaQuWen,Lottery,Belle,Society,Running,ShuMa,NBA,Aviation,YSSong,Stock,ChineseFootball,InternationalFootball,CBA,Phone,BrainPower,YKT,TDGKK,Travel,DuShu,JiuXiang,Education,QinZi,BFGame,TDYingX,Emotion,Art,HaiWai,Blogs,Forum,MengCong
};

@interface NetManager : BaseNetManager
+(id)getNewsModelPage:(NSInteger)page newsPageEnum:(NewsPageEnum)newsPageEnum handler:(void(^)(NewsModel* model,NSError* error))handler;

+(id)getRecommendModelhanler:(void(^)(NSArray<RecommendModel*>* array,NSError* error))handler;

+(id)getAmusementModelPage:(NSInteger)page handler:(void(^)(AmusementModel* model,NSError* error))handler;


+(id)getLivePage:(NSInteger)page handler:(void(^)(LiveModel *model,NSError *error))handler;
+(id)getID:(NSInteger)ID Handler:(void(^)(DiscussModel *model,NSError *error))handler;
+(id)getRoomID:(NSInteger)ID Handler:(void(^)(ChairModel *model,NSError *error))handler;

+(id)getSubjectModelPage:(NSInteger)page handler:(void(^)(SubjectModel *model, NSError *error))handler;
@end
