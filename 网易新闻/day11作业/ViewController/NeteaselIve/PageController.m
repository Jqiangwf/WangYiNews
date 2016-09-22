//
//  PageController.m
//  day11作业
//
//  Created by tarena29 on 16/9/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "PageController.h"
#import "LiveViewController.h"
#import "ChairViewController.h"
@implementation PageController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.menuViewLayoutMode = WMMenuViewLayoutModeCenter;
        self.menuBGColor = [UIColor whiteColor];
    }
    return self;
}

-(NSArray<NSString *> *)titles{
    return @[@"直播",@"聊天室"];
}
-(NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return self.titles.count;
}
-(UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    if (index == 1) {
        LiveViewController *lvc = [[LiveViewController alloc]initWithRoomID:_ID];
        return lvc;
    }else{
        ChairViewController *cvc = [[ChairViewController alloc]initWithRoomID:_ID];
        return cvc;
    }
}
@end
