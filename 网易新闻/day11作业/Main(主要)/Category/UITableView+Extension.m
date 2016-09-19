//
//  UITableView+Extension.m
//  EncapsulationClass
//
//  Created by tarena07 on 16/9/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "UITableView+Extension.h"

@implementation UITableView (Extension)
+(void)tableViewWithShadow:(UITableView*)tableView Color:(UIColor*)Color  shadowOffset:(CGSize)shadowOffset shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius{
    tableView.layer.shadowColor=Color.CGColor;
    tableView.layer.shadowOffset=shadowOffset;
    tableView.layer.shadowOpacity=shadowOpacity;
    tableView.layer.shadowRadius=shadowRadius;
    tableView.clipsToBounds=NO;
    
}
@end
