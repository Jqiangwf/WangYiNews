//
//  UITableViewCell+Extension.m
//  EncapsulationClass
//
//  Created by tarena07 on 16/9/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "UITableViewCell+Extension.h"

@implementation UITableViewCell (Extension)

//cell的内容和复用
+(UITableViewCell*)cellWithTableViewCell:(UITableView*)tableView style:(NSInteger)style accessoryType:(NSInteger)accessoryType txetLabel_text:(NSString*)txetLabel_text detailTextLabel_text:(NSString*)detailTextLabel_text imageView_image:(NSString*)imageView_image selectionStyle:(NSInteger)selectionStyle{
    
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:style reuseIdentifier:@"cell"];
    }
    
    cell.selectionStyle=selectionStyle;
    cell.accessoryType=accessoryType;
    cell.textLabel.text=txetLabel_text;
    cell.detailTextLabel.text=detailTextLabel_text;
    cell.imageView.image=[UIImage imageWithName:imageView_image];
    [self cellWithShadow:cell Color:[UIColor colorWithWhite:0.764 alpha:1.000] shadowOffset:CGSizeMake(0, 0) shadowOpacity:0.5 shadowRadius:1];
    return cell;
    

}
//cell的阴影
+(void)cellWithShadow:(UITableViewCell*)tableViewCell Color:(UIColor*)Color  shadowOffset:(CGSize)shadowOffset shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius{
    
    tableViewCell.layer.shadowColor=Color.CGColor;
    tableViewCell.layer.shadowOffset=shadowOffset;
    tableViewCell.layer.shadowOpacity=shadowOpacity;
    tableViewCell.layer.shadowRadius=shadowRadius;
    tableViewCell.clipsToBounds=NO;
    
}

@end
