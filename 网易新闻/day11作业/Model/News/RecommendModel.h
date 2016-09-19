//
//  RecommendModel.h
//  day11作业
//
//  Created by tarena07 on 16/9/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

//@class 推荐;
@interface RecommendModel : NSObject

//@property (nonatomic, strong) NSArray<推荐 *> *推荐;
//
//@end
//@interface 推荐 : NSObject

@property (nonatomic, assign) NSInteger recType;

@property (nonatomic, copy) NSString *replyid;

@property (nonatomic, assign) NSInteger picCount;

@property (nonatomic, copy) NSString *prompt;

@property (nonatomic, copy) NSString *imgsrc;

@property (nonatomic, assign) NSInteger adtype;

@property (nonatomic, copy) NSString *img;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *ptime;

@property (nonatomic, copy) NSString *docid;

@property (nonatomic, assign) NSInteger imgType;

@property (nonatomic, copy) NSString *program;

@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, assign) NSInteger clkNum;

@end

