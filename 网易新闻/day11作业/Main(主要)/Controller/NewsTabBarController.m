//
//  KuGooTabBarController.m
//  EncapsulationClass
//
//  Created by tarena07 on 16/9/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NewsTabBarController.h"
#import "NewsNavigationController.h"
#import "PersonalViewController.h"
#import "LivePageControllerViewController.h"
#import "ViewController.h"
#import "NewsViewController.h"
#import "TopicsViewController.h"
@interface NewsTabBarController ()

@end

@implementation NewsTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NewsViewController* home=[[NewsViewController alloc]init];
    
    [self addOneChildController:home title:@"新闻" imageName:@"tabbar_icon_news_normal" selectedImageName:@"tabbar_icon_news_highlight"];
    
    LivePageControllerViewController *pvc = [[LivePageControllerViewController alloc]init];
    [self addOneChildController:pvc title:@"直播" imageName:@"tabbar_icon_media_normal" selectedImageName:@"tabbar_icon_media_highlight"];
    
    TopicsViewController* topics=[[TopicsViewController alloc]init];
    [self addOneChildController:topics title:@"话题" imageName:@"tabbar_icon_bar_normal" selectedImageName:@"tabbar_icon_bar_highlight"];
    
    PersonalViewController* personal=[[PersonalViewController alloc]init];
    [self addOneChildController:personal title:@"我" imageName:@"tabbar_icon_me_normal" selectedImageName:@"tabbar_icon_me_highlight"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)addOneChildController:(UIViewController*)childViewController title:(NSString*)title imageName:(NSString*)imageName selectedImageName:(NSString*)selectedImageName{
    childViewController.tabBarItem.title=title;
    childViewController.tabBarItem.image=[UIImage imageWithName:imageName];
    childViewController.tabBarItem.selectedImage=[[UIImage imageWithName:selectedImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NewsNavigationController* navi=[[NewsNavigationController alloc]initWithRootViewController:childViewController];
    navi.navigationBar.barStyle=UIBarStyleBlack;
    [self addChildViewController:navi];
}


@end
