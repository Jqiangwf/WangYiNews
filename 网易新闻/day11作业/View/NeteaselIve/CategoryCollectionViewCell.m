//
//  CategoryCollectionViewCell.m
//  day11作业
//
//  Created by tarena29 on 16/9/21.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "CategoryCollectionViewCell.h"

@implementation CategoryCollectionViewCell
- (UIView *)bottomView {
    if(_bottomView == nil) {
        _bottomView = [[UIView alloc] init];
        [self.contentView  addSubview:_bottomView];
        _bottomView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _bottomView.layer.borderWidth = 1;
        _bottomView.layer.cornerRadius = 15;
        _bottomView.layer.masksToBounds = YES;
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
            
        }];
    }
    return _bottomView;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.bottomView addSubview:_titleLb];
        _titleLb.font = [UIFont systemFontOfSize:15];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(0);
            
        }];
    }
    return _titleLb;
}
@end
