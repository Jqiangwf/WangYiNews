//
//  NeteaseNews3Cell.m
//  day11作业
//
//  Created by tarena07 on 16/9/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NeteaseNews3Cell.h"

@implementation NeteaseNews3Cell

- (UILabel *)title {
    if(_title == nil) {
        _title = [[UILabel alloc] init];
        [self.contentView addSubview:_title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.right.equalTo(-10);
            make.top.equalTo(8);
        }];
        _title.font=[UIFont systemFontOfSize:17 weight:2];
    }
    return _title;
}

- (UIImageView *)imgsrcImage {
    if(_imgsrcImage == nil) {
        _imgsrcImage = [[UIImageView alloc] init];
        [self.contentView addSubview:_imgsrcImage];
        [_imgsrcImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.title.mas_bottom).offset(5);
            make.left.equalTo(self.title);
            make.right.equalTo(self.title);
            make.height.equalTo(_imgsrcImage.mas_width).multipliedBy(0.3);
        }];
    }
    return _imgsrcImage;
}

- (UILabel *)source {
    if(_source == nil) {
        _source = [[UILabel alloc] init];
        [self.contentView addSubview:_source];
        [_source mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imgsrcImage.mas_bottom).offset(5);
            make.left.equalTo(self.imgsrcImage);
            make.bottom.equalTo(-8);
        }];
        _source.font=[UIFont systemFontOfSize:13];
        _source.textColor=[UIColor grayColor];
    }
    return _source;
}

- (UILabel *)replyCount {
    if(_replyCount == nil) {
        _replyCount = [[UILabel alloc] init];
        [self.contentView addSubview:_replyCount];
        [_replyCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-10);
            make.bottom.equalTo(self.source);
            make.top.equalTo(self.source);
        }];
        _replyCount.font=[UIFont systemFontOfSize:13];
        _replyCount.textColor=[UIColor colorWithWhite:0.231 alpha:1.000];
        _replyCount.layer.cornerRadius=4;
        _replyCount.layer.borderColor=[UIColor colorWithRed:0.786 green:0.849 blue:0.942 alpha:1.000].CGColor;
        _replyCount.layer.borderWidth=1;
        _replyCount.layer.backgroundColor=[UIColor colorWithRed:0.786 green:0.849 blue:0.942 alpha:1.000].CGColor;
        _replyCount.layer.masksToBounds=YES;
    }
    return _replyCount;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
