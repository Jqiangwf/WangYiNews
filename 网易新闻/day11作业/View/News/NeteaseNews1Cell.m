//
//  NeteaseNews1Cell.m
//  day11作业
//
//  Created by tarena07 on 16/9/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NeteaseNews1Cell.h"

@implementation NeteaseNews1Cell

- (UIImageView *)imgsrcImage {
    if(_imgsrcImage == nil) {
        _imgsrcImage = [[UIImageView alloc] init];
        [self.contentView addSubview:_imgsrcImage];
        [_imgsrcImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
            make.height.equalTo(_imgsrcImage.mas_width).multipliedBy(0.5);
        }];
    }
    return _imgsrcImage;
}

- (UILabel *)title {
    if(_title == nil) {
        _title = [[UILabel alloc] init];
        UIView* view=[[UIView alloc]init];
        view.backgroundColor=[UIColor colorWithWhite:0.384 alpha:1.000];
        [self.contentView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.equalTo(0);
            make.height.equalTo(30);
        }];
        [view addSubview:_title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(view.centerY);
            make.left.equalTo(10);
            make.right.equalTo(-10);
        }];
        _title.textColor=[UIColor whiteColor];
        _title.font=[UIFont systemFontOfSize:17];
    }
    return _title;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
