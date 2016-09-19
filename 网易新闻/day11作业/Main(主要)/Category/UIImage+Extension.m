//
//  UIImage+Extension.m
//  EncapsulationClass
//
//  Created by tarena07 on 16/9/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+(UIImage*)imageWithName:(NSString*)name{
    UIImage* image=nil;
    if (iOS7) {
        NSString* newName=[name stringByAppendingString:@"_os7"];
        image=[UIImage imageNamed:newName];
    }
    if (image==nil) {
        image=[UIImage imageNamed:name];
    }
    return image;
}
@end
