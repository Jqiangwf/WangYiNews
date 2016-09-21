//
//  ChairModel.h
//  day11作业
//
//  Created by tarena29 on 16/9/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>


@class ChairChatconfigModel,ChairVideoModel,ChairFloatlayerModel,ChairBannerModel,ChairCommentatorModel,ChairMessagesModel,ChairMessagesMsgModel,ChairCommentatorModel,ChairMessageImagesModel;
@interface ChairModel : NSObject


@property (nonatomic, copy) NSString *roomName;

@property (nonatomic, assign) NSInteger duration;

@property (nonatomic, strong) NSArray<ChairMessagesModel *> *messages;

@property (nonatomic, copy) NSString *Template;

@property (nonatomic, strong) NSArray<ChairCommentatorModel *> *commentator;

@property (nonatomic, strong) ChairVideoModel *video;

@property (nonatomic, assign) NSInteger roomId;

@property (nonatomic, copy) NSString *endDate;

@property (nonatomic, copy) NSString *roomDes;

@property (nonatomic, assign) BOOL statExist;

@property (nonatomic, copy) NSString *liveRoomTrigger;

@property (nonatomic, strong) ChairBannerModel *banner;

@property (nonatomic, strong) ChairFloatlayerModel *floatLayer;

@property (nonatomic, copy) NSString *liveVideoUrl;

@property (nonatomic, copy) NSString *liveVideoFull;

@property (nonatomic, assign) NSInteger nextPage;

@property (nonatomic, copy) NSString *order;

@property (nonatomic, copy) NSString *chatRoomTrigger;

@property (nonatomic, strong) ChairChatconfigModel *chatConfig;

@property (nonatomic, strong) NSArray<NSString *> *section;

@property (nonatomic, copy) NSString *startDate;

@end

@interface ChairChatconfigModel : NSObject

@property (nonatomic, assign) NSInteger chatRoomCount;

@property (nonatomic, copy) NSString *chatImgTrigger;

@end

@interface ChairVideoModel : NSObject

@property (nonatomic, copy) NSString *videoFull;

@property (nonatomic, copy) NSString *videoUrl;

@property (nonatomic, copy) NSString *panoUrl;

@property (nonatomic, copy) NSString *isPano;

@end

@interface ChairFloatlayerModel : NSObject

@property (nonatomic, copy) NSString *floatType;

@property (nonatomic, copy) NSString *iconUrl;

@property (nonatomic, copy) NSString *floatUrl;

@end

@interface ChairBannerModel : NSObject

@property (nonatomic, copy) NSString *liveUrl;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *des;

@end

@interface ChairCommentatorModel : NSObject

@property (nonatomic, copy) NSString *name;

@end

@interface ChairMessagesModel : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, strong) ChairCommentatorModel *commentator;

@property (nonatomic, copy) NSString *section;

@property (nonatomic, strong) ChairMessagesMsgModel *msg;

@property (nonatomic, copy) NSString *time;

@property (nonatomic, strong) NSArray<ChairMessageImagesModel *> *images;

@end

@interface ChairMessagesMsgModel : NSObject

@property (nonatomic, copy) NSString *fontType;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *fontColor;

@property (nonatomic, copy) NSString *align;

@end



@interface ChairMessageImagesModel : NSObject

@property (nonatomic, copy) NSString *outerUrl;

@property (nonatomic, copy) NSString *innerUrl;

@property (nonatomic, copy) NSString *fullSizeSrc;

@property (nonatomic, copy) NSString *src;

@property (nonatomic, copy) NSString *fullSrcSize;

@end

