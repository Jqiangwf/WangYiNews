//
//  UIBarButtonItem+Extension.m
//  EncapsulationClass
//
//  Created by tarena07 on 16/9/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+(UIBarButtonItem*)itemImageName:(NSString*)imageName highImageName:(NSString*)highImageName target:(id)target action:(SEL)action{
    
    UIButton* buttion=[UIButton buttonWithType:UIButtonTypeCustom];
    [buttion setBackgroundImage:[UIImage imageWithName:imageName] forState:UIControlStateNormal];
    [buttion setBackgroundImage:[UIImage imageWithName:highImageName] forState:UIControlStateHighlighted];
    [buttion addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    buttion.size=buttion.currentBackgroundImage.size;
    return [[UIBarButtonItem alloc]initWithCustomView:buttion];
    
}

@end
