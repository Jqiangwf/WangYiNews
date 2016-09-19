//
//  FutureTableViewCell.m
//  day11作业
//
//  Created by tarena29 on 16/9/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "FutureTableViewCell.h"

@implementation FutureTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (UILabel *)futureLb {
    if(_futureLb == nil) {
        _futureLb = [[UILabel alloc] init];
        [self.contentView addSubview:_futureLb];
        _futureLb.textColor = [UIColor colorWithRed:0.230 green:0.553 blue:1.000 alpha:1.000];
        _futureLb.font = [UIFont systemFontOfSize:15];
        [_futureLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(5);
            
        }];
        
    }
    return _futureLb;
}

- (UILabel *)contentLb {
    if(_contentLb == nil) {
        _contentLb = [[UILabel alloc] init];
        [self.contentView addSubview:_contentLb];
        _contentLb.font = [UIFont systemFontOfSize:15];
        [_contentLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.futureLb.mas_right).offset(3);
            make.centerY.equalTo(0);
            make.right.equalTo(self.countLb.mas_left).offset(-3);
        }];
    }
    return _contentLb;
}

- (UILabel *)countLb {
    if(_countLb == nil) {
        _countLb = [[UILabel alloc] init];
        [self.contentView addSubview:_countLb];
        _countLb.textColor = [UIColor redColor];
        _countLb.font = [UIFont systemFontOfSize:12];
        [_countLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-3);
            make.centerY.equalTo(0);
        }];
    }
    return _countLb;
}
@end
