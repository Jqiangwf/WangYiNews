//
//  RX_NormalViewCell.h
//  day11作业
//
//  Created by tarena36 on 16/9/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RX_NormalViewCell : UITableViewCell
@property(nonatomic) UIView * cellView;
@property(nonatomic) UIImageView *headPicIV;
@property(nonatomic) UILabel *nameAndTitleLb;
@property(nonatomic) UIImageView *picurlIV;
@property(nonatomic) UILabel *aliasLb;
@property(nonatomic) UILabel *classificationLb;
@property(nonatomic) UILabel *questionCountLb;
@property(nonatomic) UILabel *answerCountLb;
@property(nonatomic) UIButton *attionBt;
@end
