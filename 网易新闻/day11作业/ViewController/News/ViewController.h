//
//  ViewController.h
//  day11作业
//
//  Created by tarena07 on 16/9/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(nonatomic)NewsPageEnum newsPageEnum;
-(instancetype)initWithNewsPageEnum:(NewsPageEnum)newsPageEnum;
@end

