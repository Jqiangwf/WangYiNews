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
#import "NeteaselIveViewController.h"
#import "ViewController.h"
#import "TopicsViewController.h"
@interface NewsTabBarController ()

@end

@implementation NewsTabBarController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    ViewController* home=[[ViewController alloc]init];
    [self addOneChildController:home title:@"新闻" imageName:@"night_tabbar_icon_news_normal" selectedImageName:@"night_tabbar_icon_news_highlight"];
    
    NeteaselIveViewController* NeteaselIve=[[NeteaselIveViewController alloc]init];
    [self addOneChildController:NeteaselIve title:@"直播" imageName:@"night_tabbar_icon_media_normal" selectedImageName:@"night_tabbar_icon_media_highlight"];
    
    TopicsViewController* topics=[[TopicsViewController alloc]init];
    [self addOneChildController:topics title:@"话题" imageName:@"night_tabbar_icon_bar_normal" selectedImageName:@"night_tabbar_icon_bar_highlight"];
    
    PersonalViewController* personal=[[PersonalViewController alloc]init];
    [self addOneChildController:personal title:@"我" imageName:@"night_tabbar_icon_me_normal" selectedImageName:@"night_tabbar_icon_me_highlight"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)addOneChildController:(UIViewController*)childViewController title:(NSString*)title imageName:(NSString*)imageName selectedImageName:(NSString*)selectedImageName{
    childViewController.title=title;
    childViewController.tabBarItem.image=[UIImage imageWithName:imageName];
    childViewController.tabBarItem.selectedImage=[[UIImage imageWithName:selectedImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NewsNavigationController* navi=[[NewsNavigationController alloc]initWithRootViewController:childViewController];
    navi.navigationBar.barStyle=UIBarStyleBlack;
    [self addChildViewController:navi];
}


@end
