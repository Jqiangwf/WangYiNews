//
//  NSString+URLCategory.m
//  day11作业
//
//  Created by tarena07 on 16/9/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NSString+URLCategory.h"

@implementation NSString (URLCategory)

-(NSURL *)lp_URL{
    return [NSURL URLWithString:self];
}

@end
