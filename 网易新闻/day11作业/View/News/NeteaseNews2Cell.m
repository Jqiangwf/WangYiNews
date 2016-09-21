//
//  NeteaseNews2Cell.m
//  day11作业
//
//  Created by tarena07 on 16/9/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NeteaseNews2Cell.h"

@implementation NeteaseNews2Cell
- (UIImageView *)imageIV {
    if(_imageIV == nil) {
        _imageIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageIV];
        [_imageIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(80, 60));
            make.top.equalTo(8);
            make.bottom.equalTo(-8);
            make.left.equalTo(10);
        }];
    }
    return _imageIV;
}

- (UILabel *)title {
    if(_title == nil) {
        _title = [[UILabel alloc] init];
        [self.contentView addSubview:_title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageIV.mas_top);
            make.left.equalTo(self.imageIV.mas_right).offset(5);
            make.right.equalTo(-10);
        }];
        _title.font=[UIFont systemFontOfSize:17 weight:2];
        _title.numberOfLines=2;
        
    }
    return _title;
}

- (UILabel *)newsName {
    if(_newsName == nil) {
        _newsName = [[UILabel alloc] init];
        [self.contentView addSubview:_newsName];
        [_newsName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.title.mas_left);
            make.bottom.equalTo(self.imageIV.mas_bottom);
            make.top.equalTo(self.title.mas_bottom).offset(5);
        }];
        _newsName.font=[UIFont systemFontOfSize:12];
        _newsName.textColor=[UIColor grayColor];
    }
    return _newsName;
}

- (UILabel *)redContent {
    if(_redContent == nil) {
        _redContent = [[UILabel alloc] init];
        [self.contentView addSubview:_redContent];
        [_redContent mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-10);
            make.top.equalTo(self.title.mas_bottom).offset(5);
            make.bottom.equalTo(self.imageIV.mas_bottom);
        }];
        _redContent.font=[UIFont systemFontOfSize:12];
        _redContent.textColor=[UIColor colorWithWhite:0.399 alpha:1.000];
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
