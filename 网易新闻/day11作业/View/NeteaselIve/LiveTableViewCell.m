//
//  LiveTableViewCell.m
//  day11作业
//
//  Created by tarena29 on 16/9/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LiveTableViewCell.h"

@implementation LiveTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
- (UILabel *)timeLb {
    if(_timeLb == nil) {
        UIImageView *iv = [[UIImageView alloc]init];
        [self.contentView addSubview:iv];
        [iv setImage:[UIImage imageNamed:@"圈"]];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(5);
            make.top.equalTo(15);
        }];
        
        UIView *view = [UIView new];
        [self.contentView addSubview:view];
        view.backgroundColor = [UIColor colorWithWhite:0.902 alpha:1.000];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(iv);
            make.height.equalTo(self.contentView);
            make.width.equalTo(1);
        }];
        [self.contentView sendSubviewToBack:view];
        
        
        _timeLb = [[UILabel alloc] init];
        [self.contentView addSubview:_timeLb];
        _timeLb.textColor = [UIColor colorWithRed:0.784 green:0.349 blue:0.384 alpha:1.000];
        _timeLb.font = [UIFont systemFontOfSize:14];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(iv).offset(-5);
            make.left.equalTo(iv.mas_right).offset(6);
        }];
        
    }
    return _timeLb;
}

- (UIView *)lowView {
    if(_lowView == nil) {
        _lowView = [[UIView alloc] init];
        [self.contentView addSubview:_lowView];
        _lowView.backgroundColor = [UIColor colorWithRed:0.992 green:1.000 blue:1.000 alpha:1.000];
        _lowView.layer.borderWidth = 1;
        _lowView.layer.borderColor = [UIColor colorWithWhite:0.811 alpha:1.000].CGColor;
        [_lowView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.timeLb.mas_bottom).offset(10);
            make.left.equalTo(self.timeLb).offset(-20);
            make.right.equalTo(-10);
            make.bottom.equalTo(0);
        }];
    }
    return _lowView;
}

- (UILabel *)nickNameLb {
    if(_nickNameLb == nil) {
        
        UIImageView *iv = [UIImageView new];
        [self.lowView addSubview:iv];
        [iv setImage:[UIImage imageNamed:@"头像"]];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(12);
            make.size.equalTo(CGSizeMake(25, 25));
        }];
        
        
        _nickNameLb = [[UILabel alloc] init];
        [self.lowView addSubview:_nickNameLb];
        _nickNameLb.textColor = [UIColor grayColor];
        _nickNameLb.font = [UIFont systemFontOfSize:16];
        [_nickNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(iv.mas_right).offset(10);
            make.centerY.equalTo(iv);
        }];
        
    }
    return _nickNameLb;
}

- (UILabel *)contentLb {
    if(_contentLb == nil) {
        _contentLb = [[UILabel alloc] init];
        [self.lowView addSubview:_contentLb];
        _contentLb.font = [UIFont systemFontOfSize:16];
        _contentLb.numberOfLines = 0;
        
        [_contentLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-20).priorityHigh();
            make.top.equalTo(self.nickNameLb.mas_bottom).offset(10);
            make.right.lessThanOrEqualTo(-12);
            make.left.equalTo(12);
        }];
    }
    return _contentLb;
}
@end
