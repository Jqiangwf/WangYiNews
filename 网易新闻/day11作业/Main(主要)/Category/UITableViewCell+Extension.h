//
//  UITableViewCell+Extension.h
//  EncapsulationClass
//
//  Created by tarena07 on 16/9/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (Extension)

+(UITableViewCell*)cellWithTableViewCell:(UITableView*)tableView style:(NSInteger)style accessoryType:(NSInteger)accessoryType txetLabel_text:(NSString*)txetLabel_text detailTextLabel_text:(NSString*)detailTextLabel_text imageView_image:(NSString*)imageView_image selectionStyle:(NSInteger)selectionStyle;

+(void)cellWithShadow:(UITableViewCell*)tableViewCell Color:(UIColor*)Color shadowOffset:(CGSize)shadowOffset shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius;
@end