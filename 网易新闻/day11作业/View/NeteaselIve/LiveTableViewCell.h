//
//  LiveTableViewCell.h
//  day11作业
//
//  Created by tarena29 on 16/9/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChairModel.h"
@interface LiveTableViewCell : UITableViewCell
@property (nonatomic) UILabel *timeLb;
@property (nonatomic) UIView *lowView;
@property (nonatomic) UILabel *nickNameLb;
@property (nonatomic) UILabel *contentLb;
@property (nonatomic) UIView *line;
-(void) setImageWithCount:(NSInteger)count andModelList:(NSArray<ChairMessageImagesModel *> *)list;


@end
