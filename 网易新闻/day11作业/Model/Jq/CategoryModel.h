//
//  CategoryModel.h
//  day11作业
//
//  Created by tarena29 on 16/9/21.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CategoryLive_ReviewModel;
@interface CategoryModel : NSObject

@property (nonatomic, strong) NSArray<CategoryLive_ReviewModel *> *live_review;

@property (nonatomic, assign) NSInteger nextPage;

@property (nonatomic, copy) NSString *pageNo;

@end
@interface CategoryLive_ReviewModel : NSObject

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

