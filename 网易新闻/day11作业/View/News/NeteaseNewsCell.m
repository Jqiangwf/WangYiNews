//
//  NeteaseNewsCell.m
//  day11作业
//
//  Created by tarena07 on 16/9/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NeteaseNewsCell.h"

@implementation NeteaseNewsCell
- (UILabel *)title {
    if(_title == nil) {
        _title = [[UILabel alloc] init];
        [self.contentView addSubview:_title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.top.equalTo(8);
            make.right.equalTo(-10);
        }];
        _title.font=[UIFont systemFontOfSize:17 weight:2];
    }
    return _title;
}

- (UIImageView *)imageIV1 {
    if(_imageIV1 == nil) {
        _imageIV1 = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageIV1];
        [_imageIV1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.title.mas_bottom).offset(8);
            make.left.equalTo(self.title.mas_left);
            make.height.equalTo(_imageIV1.mas_width).multipliedBy(0.8);
        }];
    }
    return _imageIV1;
}

- (UILabel *)newsName {
    if(_newsName == nil) {
        _newsName = [[UILabel alloc] init];
        [self.contentView addSubview:_newsName];
        [_newsName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageIV1.mas_bottom).offset(5);
            make.left.equalTo(self.imageIV1.mas_left);
            make.bottom.equalTo(-8);
        }];
        _newsName.font=[UIFont systemFontOfSize:13];
        _newsName.textColor=[UIColor grayColor];
        
    }
    return _newsName;
}

- (UIImageView *)imageIV2 {
    if(_imageIV2 == nil) {
        _imageIV2 = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageIV2];
        [_imageIV2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imageIV1.mas_right).offset(5);
            make.top.equalTo(self.imageIV1);
            make.bottom.equalTo(self.imageIV1);
            make.width.equalTo(self.imageIV1);
//            make.height.equalTo(60);
            make.height.equalTo(_imageIV2.mas_width).multipliedBy(0.8);
//            make.size.equalTo(CGSizeMake(80, 60));
        }];
    }
    return _imageIV2;
}

- (UIImageView *)imageIV3 {
    if(_imageIV3 == nil) {
        _imageIV3 = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageIV3];
        [_imageIV3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imageIV2.mas_right).offset(5);
            make.top.equalTo(self.imageIV2);
            make.bottom.equalTo(self.imageIV2);
            make.width.equalTo(self.imageIV2);
            make.right.equalTo(-10);
//            make.height.equalTo(60);
            make.height.equalTo(_imageIV3.mas_width).multipliedBy(0.8);
//            make.size.equalTo(CGSizeMake(80, 60));
        }];
    }
    return _imageIV3;
}

- (UILabel *)redContent {
    if(_redContent == nil) {
        _redContent = [[UILabel alloc] init];
        [self.contentView addSubview:_redContent];
        [_redContent mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageIV3.mas_bottom).offset(5);
            make.bottom.equalTo(-8);
            make.right.equalTo(self.imageIV3);
        }];
        _redContent.font=[UIFont systemFontOfSize:12];
        _redContent.textColor=[UIColor colorWithWhite:0.231 alpha:1.000];
        _redContent.layer.cornerRadius=4;
        _redContent.layer.borderColor=[UIColor colorWithRed:0.786 green:0.849 blue:0.942 alpha:1.000].CGColor;
        _redContent.layer.borderWidth=1;
        _redContent.layer.backgroundColor=[UIColor colorWithRed:0.786 green:0.849 blue:0.942 alpha:1.000].CGColor;
        _redContent.layer.masksToBounds=YES;
    }
    return _redContent;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
