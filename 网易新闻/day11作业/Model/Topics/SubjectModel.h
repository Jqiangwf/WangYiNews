//
//  SubjectModel.h
//  day11作业
//
//  Created by tarena36 on 16/9/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SubjectDataModel,SubjectDataExpertlistModel;
@interface SubjectModel : NSObject

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) SubjectDataModel *data;

@property (nonatomic, assign) NSInteger code;

@end
@interface SubjectDataModel : NSObject

@property (nonatomic, strong) NSArray<SubjectDataExpertlistModel *> *expertList;

@property (nonatomic, strong) NSArray *localExpert;

@end

@interface SubjectDataExpertlistModel : NSObject
//description->desc
@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *classification;

@property (nonatomic, assign) NSInteger state;

@property (nonatomic, assign) NSInteger expertState;

@property (nonatomic, copy) NSString *picurl;

@property (nonatomic, assign) NSInteger concernCount;

@property (nonatomic, assign) NSInteger questionCount;

@property (nonatomic, copy) NSString *headpicurl;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger answerCount;

@property (nonatomic, copy) NSString *stitle;

@property (nonatomic, copy) NSString *alias;

@property (nonatomic, assign) long long createTime;

@property (nonatomic, copy) NSString *expertId;

@property (nonatomic, copy) NSString *name;

@end

