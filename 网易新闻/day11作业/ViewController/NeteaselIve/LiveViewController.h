//
//  LiveViewController.h
//  day11作业
//
//  Created by tarena29 on 16/9/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetManager.h"
@interface LiveViewController : UIViewController
@property (nonatomic) NSInteger ID;
-(id)initWithRoomID:(NSInteger)ID;
@end
