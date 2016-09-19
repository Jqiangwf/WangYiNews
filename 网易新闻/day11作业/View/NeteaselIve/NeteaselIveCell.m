//
//  NeteaselIveCell.m
//  day11作业
//
//  Created by tarena07 on 16/9/17.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NeteaselIveCell.h"

@implementation NeteaselIveCell

-(UIImageView*)neteaImageView{
    if (_neteaImageView==nil) {
        _neteaImageView=[[UIImageView alloc]init];
        [self.contentView addSubview:_neteaImageView];
        _neteaImageView.alpha = 0.85;
        [_neteaImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(0);
            make.bottom.equalTo(-4);
            make.height.equalTo(135).priorityHigh();
        }];
    }
    return _neteaImageView;
}

-(UIImageView*)neteaImage{
    if (_neteaImage==nil) {
        _neteaImage=[[UIImageView alloc]init];
        [self.contentView addSubview:_neteaImage];
        [_neteaImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.bottom.equalTo(-17);
            make.width.equalTo(60);
            make.height.equalTo(20);
        }];
    }
    return _neteaImage;
}

-(UILabel*)redContent{
    if (_redContent==nil) {
        _redContent=[[UILabel alloc]init];
        [self.contentView addSubview:_redContent];
        [_redContent mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.neteaImage.mas_right).offset(2);
            make.bottom.equalTo(self.neteaImage);
            make.width.lessThanOrEqualTo(100);
        }];
        _redContent.font=[UIFont systemFontOfSize:11];
        _redContent.textColor=[UIColor whiteColor];
        _redContent.layer.cornerRadius=3;
        _redContent.layer.borderColor=[UIColor whiteColor].CGColor;
        _redContent.layer.borderWidth=1;
        _redContent.layer.masksToBounds=YES;
    }
    return _redContent;
}


-(UILabel*)neteaTitle{
    if (_neteaTitle==nil) {
        _neteaTitle=[[UILabel alloc]init];
        [self.contentView addSubview:_neteaTitle];
        [_neteaTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            [self.contentView addSubview:_neteaTitle];
            [_neteaTitle mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.neteaImage);
                make.bottom.equalTo(self.neteaImage.mas_top).offset(-3);
                make.right.equalTo(-10);
            }];
            _neteaTitle.font=[UIFont systemFontOfSize:16 weight:2];
            _neteaTitle.textColor=[UIColor whiteColor];
            _neteaTitle.numberOfLines=0;
        }];
    }
    return _neteaTitle;
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
