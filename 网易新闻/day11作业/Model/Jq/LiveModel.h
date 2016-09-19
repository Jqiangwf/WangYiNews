//
//  LiveModel.h
//  day11作业
//
//  Created by tarena29 on 16/9/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LiveFutureModel,Live_ReviewModel,LiveTopModel;
@interface LiveModel : NSObject

@property (nonatomic, assign) NSInteger pageNo;

@property (nonatomic, strong) NSArray<Live_ReviewModel *> *live_review;

@property (nonatomic, assign) NSInteger nextPage;

@property (nonatomic, strong) NSArray<LiveTopModel *> *top;

@property (nonatomic, strong) NSArray<LiveFutureModel *> *future;

@end
@interface LiveFutureModel : NSObject

@property (nonatomic, copy) NSString *startTime;

@property (nonatomic, assign) NSInteger roomId;

@property (nonatomic, copy) NSString *roomName;

@property (nonatomic, copy) NSString *image;

@end

@interface Live_ReviewModel : NSObject

@property (nonatomic, assign) NSInteger confirm;

@property (nonatomic, assign) NSInteger liveType;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, assign) NSInteger roomId;

@property (nonatomic, copy) NSString *roomName;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) NSInteger userCount;

@property (nonatomic, assign) NSInteger liveStatus;

@property (nonatomic, copy) NSString *endTime;

@property (nonatomic, assign) BOOL mutilVideo;

@property (nonatomic, copy) NSString *startTime;

@property (nonatomic, assign) BOOL pano;

@property (nonatomic, assign) BOOL video;

@end

@interface LiveTopModel : NSObject

@property (nonatomic, assign) NSInteger confirm;

@property (nonatomic, assign) NSInteger liveType;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, assign) NSInteger roomId;

@property (nonatomic, copy) NSString *roomName;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *endTime;

@property (nonatomic, assign) NSInteger liveStatus;

@property (nonatomic, assign) BOOL mutilVideo;

@property (nonatomic, assign) NSInteger userCount;

@property (nonatomic, copy) NSString *startTime;

@property (nonatomic, assign) BOOL pano;

@property (nonatomic, assign) BOOL video;

@end

