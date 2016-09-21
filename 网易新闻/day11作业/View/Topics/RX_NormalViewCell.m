//
//  RX_NormalViewCell.m
//  day11作业
//
//  Created by tarena36 on 16/9/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "RX_NormalViewCell.h"

@implementation RX_NormalViewCell

- (UIView *)cellView {
    if(_cellView == nil) {
        _cellView = [[UIView alloc] init];
        [self.contentView addSubview:_cellView];
        [_cellView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(UIEdgeInsetsMake(10, 15, 10, 15));
        }];
        _cellView.layer.borderWidth = 2;
        _cellView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _cellView.backgroundColor = [UIColor whiteColor];
    }
    return _cellView;
}

- (UIImageView *)headPicIV {
    if(_headPicIV == nil) {
        _headPicIV = [[UIImageView alloc] init];
        [self.cellView addSubview:_headPicIV];
        [_headPicIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(20);
            make.height.width.equalTo(60);
        }];
        _headPicIV.layer.cornerRadius = 30;
        _headPicIV.layer.borderColor = [UIColor whiteColor].CGColor;
        _headPicIV.layer.borderWidth = 2;
    }
    return _headPicIV;
}

- (UILabel *)nameAndTitleLb {
    if(_nameAndTitleLb == nil) {
        _nameAndTitleLb = [[UILabel alloc] init];
        [self.cellView addSubview:_nameAndTitleLb];
        [_nameAndTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headPicIV.mas_right).equalTo(15);
            make.centerY.equalTo(self.headPicIV.mas_centerY).offset(-15);
        }];
        _nameAndTitleLb.font = [UIFont systemFontOfSize:15];
        
    }
    return _nameAndTitleLb;
}

- (UIImageView *)picurlIV {
    if(_picurlIV == nil) {
        _picurlIV = [[UIImageView alloc] init];
        [self.cellView addSubview:_picurlIV];
        [_picurlIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.nameAndTitleLb.mas_bottom).offset(10);
            make.left.right.equalTo(0);
            make.height.equalTo(220);
            make.width.equalTo(self.cellView);
        }];
        [self.cellView sendSubviewToBack:_picurlIV];
    }
    return _picurlIV;
}

- (UILabel *)aliasLb {
    if(_aliasLb == nil) {
        _aliasLb = [[UILabel alloc] init];
        [self.cellView addSubview:_aliasLb];
        [_aliasLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.picurlIV.mas_bottom).offset(12);
            make.left.equalTo(20);
            make.right.equalTo(-20);
        }];
        _aliasLb.numberOfLines = 2;
        _aliasLb.font = [UIFont systemFontOfSize:17];
    }
    return _aliasLb;
}

- (UILabel *)classificationLb {
    if(_classificationLb == nil) {
        _classificationLb = [[UILabel alloc] init];
        [self.cellView addSubview:_classificationLb];
        [_classificationLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.aliasLb.mas_bottom).offset(20);
            make.left.equalTo(self.aliasLb);
            make.bottom.equalTo(-18);
        }];
        _classificationLb.font = [UIFont systemFontOfSize:13];
        _classificationLb.textColor = [UIColor cyanColor];
    }
    return _classificationLb;
}

- (UILabel *)questionCountLb {
    if(_questionCountLb == nil) {
        UIView *view = [UIView new];
        _questionCountLb = [[UILabel alloc] init];
        [self.cellView addSubview: _questionCountLb];
        [self.cellView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(1);
            make.height.equalTo(12);
            make.left.equalTo(self.classificationLb.mas_right).offset(5);
            make.centerY.equalTo(self.classificationLb);
        }];
        view.backgroundColor = [UIColor grayColor];
        [_questionCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view.mas_right).offset(5);
            make.width.equalTo(70);
            make.centerY.equalTo(self.classificationLb);
        }];
        _questionCountLb.font = [UIFont systemFontOfSize:13];
        _questionCountLb.textColor = [UIColor grayColor];
        _questionCountLb.textAlignment = NSTextAlignmentCenter ;
    }
    return _questionCountLb;
}

- (UILabel *)answerCountLb {
    if(_answerCountLb == nil) {
        _answerCountLb = [[UILabel alloc] init];
        UIView *view = [UIView new];
        [self.cellView addSubview: _answerCountLb];
        [self.cellView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(1);
            make.height.equalTo(12);
            make.left.equalTo(self.questionCountLb.mas_right).offset(5);
            make.centerY.equalTo(self.classificationLb);
        }];
        view.backgroundColor = [UIColor grayColor];
        [_answerCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view.mas_right).offset(5);
            make.width.equalTo(70);
            make.centerY.equalTo(self.classificationLb);
        }];
        _answerCountLb.font = [UIFont systemFontOfSize:13];
        _answerCountLb.textColor = [UIColor grayColor];
        _answerCountLb.textAlignment = NSTextAlignmentCenter;
    }
    return _answerCountLb;
}

- (UIButton *)attionBt {
    if(_attionBt == nil) {
        _attionBt = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.cellView addSubview:_aliasLb];
        
        [_aliasLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.classificationLb);
            make.width.equalTo(100);
            make.height.equalTo(50);
            make.right.equalTo(-10);
        }];
        _aliasLb.layer.cornerRadius = 25;
    }
    return _attionBt;
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
