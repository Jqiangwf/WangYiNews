//
//  SubjectHeadModel.h
//  day11作业
//
//  Created by tarena36 on 16/9/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
//http://c.3g.163.com/newstopic/list/classification.html
@class SubjectHeadDataModel;
@interface SubjectHeadModel : NSObject


@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) NSArray<SubjectHeadDataModel *> *data;

@property (nonatomic, assign) NSInteger code;

@end
@interface SubjectHeadDataModel : NSObject
//id->ID
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *picurl;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger createTime;

@property (nonatomic, assign) NSInteger updateTime;

@end

