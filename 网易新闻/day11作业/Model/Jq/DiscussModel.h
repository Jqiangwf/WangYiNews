//
//  DiscussModel.h
//  day11作业
//
//  Created by tarena29 on 16/9/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DIscussMsgModel,DiscussLast_LogModel;
@interface DiscussModel : NSObject

@property (nonatomic, copy) NSString *code;

@property (nonatomic, strong) DIscussMsgModel *msg;

@property (nonatomic, assign) NSInteger max_index;

@property (nonatomic, assign) NSInteger min_index;

@property (nonatomic, strong) NSArray<DiscussLast_LogModel *> *last_log;

@end
@interface DIscussMsgModel : NSObject

@property (nonatomic, assign) NSInteger user_count;

@property (nonatomic, copy) NSString *nick_name;

@property (nonatomic, copy) NSString *user_id;

@property (nonatomic, assign) NSInteger room_id;

@property (nonatomic, copy) NSString *topic_id;

@end

@interface DiscussLast_LogModel : NSObject

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *nick_name;

@property (nonatomic, assign) NSInteger time;

@property (nonatomic, assign) NSInteger msg_id;

@property (nonatomic, copy) NSString *msg_style;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, copy) NSString *user_id;

@property (nonatomic, copy) NSString *type;

@end

