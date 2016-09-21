//
//  RX_HeaderViewCell.m
//  day11作业
//
//  Created by tarena36 on 16/9/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "RX_HeaderViewCell.h"

@implementation RX_HeaderViewCell
@synthesize cellView = _cellView;

- (NSMutableArray<UIButton *> *)btList {
    if(_btList == nil) {
        _btList = [[NSMutableArray<UIButton *> alloc] init];
        
            for (int i = 0; i < 15; i++) {
                UIButton *button = [UIButton buttonWithType:(UIButtonTypeSystem)];
                [_cellView addSubview:button];
                
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.height.equalTo(90);
                    if (i == 0 || i == 5 || i == 10) {
                        make.left.equalTo(30);
                    }else{
                        make.left.equalTo(_btList.lastObject.mas_right).offset(35);
                    }
                    if (i < 5) {
                        make.top.equalTo(20);
                    }else{
                        make.top.equalTo(_btList[i - 5].mas_bottom).offset(15);
                    }
                    
                    if (i == 4 || i == 9 || i == 14) {
                        make.right.equalTo(-30);
                    }
                    if (9 < i && i < 15) {
                        make.bottom.equalTo(-20);
                    }
                    
                }];
                
            }
        
    }
    return _btList;
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
