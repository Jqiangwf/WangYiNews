//
//  FutureDetailTableViewCell.m
//  day11作业
//
//  Created by tarena29 on 16/9/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "FutureDetailTableViewCell.h"

@implementation FutureDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    
}
- (UILabel *)timeLb {
    if(_timeLb == nil) {
        _timeLb = [[UILabel alloc] init];
        [self.contentView addSubview:_timeLb];
        _timeLb.textColor = [UIColor blueColor];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(15);
            make.top.equalTo(17);
        }];
    }
    return _timeLb;
}

- (UILabel *)contentLb {
    if(_contentLb == nil) {
        _contentLb = [[UILabel alloc] init];
        [self.contentView addSubview:_contentLb];
        _contentLb.font = [UIFont systemFontOfSize:17];
        _contentLb.numberOfLines = 0;
        [_contentLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.timeLb.mas_bottom).offset(6);
            make.height.lessThanOrEqualTo(44);
            make.left.equalTo(self.timeLb);
            
        }];
    }
    return _contentLb;
}

- (UIImageView *)iconIv {
    if(_iconIv == nil) {
        _iconIv = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIv];
        _iconIv.contentMode = UIViewContentModeScaleAspectFill;
        _iconIv.clipsToBounds = YES;
        [_iconIv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentLb);
            make.right.equalTo(-15);
            make.size.equalTo(CGSizeMake(50, 50));
        }];
    }
    return _iconIv;
}

@end
