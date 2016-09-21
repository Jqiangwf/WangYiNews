//
//  NewsDetailsViewController.h
//  day11作业
//
//  Created by tarena07 on 16/9/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsDetailsViewController : UIViewController
@property(nonatomic)NSString* webPaths;
-(instancetype)initWithWebPaths:(NSString*)webPaths;
@end
