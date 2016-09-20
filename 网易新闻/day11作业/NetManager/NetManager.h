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
@interface NetManager : BaseNetManager
+(id)getNewsModelPage:(NSInteger)page handler:(void(^)(NewsModel* model,NSError* error))handler;

+(id)getRecommendModelhanler:(void(^)(NSArray<RecommendModel*>* array,NSError* error))handler;

+(id)getAmusementModelPage:(NSInteger)page handler:(void(^)(AmusementModel* model,NSError* error))handler;


+(id)getLivePage:(NSInteger)page handler:(void(^)(LiveModel *model,NSError *error))handler;
+(id)getDiscuss:(NSInteger)ID Handler:(void(^)(DiscussModel *model,NSError *error))handler;
@end
