//
//  UITableView+Extension.h
//  EncapsulationClass
//
//  Created by tarena07 on 16/9/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Extension)

+(void)tableViewWithShadow:(UITableView*)tableView Color:(UIColor*)Color  shadowOffset:(CGSize)shadowOffset shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius;

@end
