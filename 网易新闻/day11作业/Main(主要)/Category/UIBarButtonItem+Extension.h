//
//  UIBarButtonItem+Extension.h
//  EncapsulationClass
//
//  Created by tarena07 on 16/9/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+(UIBarButtonItem*)itemImageName:(NSString*)imageName highImageName:(NSString*)highImageName target:(id)target action:(SEL)action;

@end
