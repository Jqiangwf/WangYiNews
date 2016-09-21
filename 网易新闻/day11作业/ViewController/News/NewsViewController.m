//
//  NewsViewController.m
//  day11作业
//
//  Created by tarena07 on 16/9/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NewsViewController.h"
#import "ViewController.h"
@interface NewsViewController ()

@end

@implementation NewsViewController

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super initWithCoder:aDecoder]) {
        self.selectIndex=2;
    }
    return self;
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        //        self.selectIndex=1;
    }
    return self;
}

-(NSArray<NSString *> *)titles{
    return @[@"头条",@"精选",@"娱乐",@"体育",@"网易号",@"本地",@"视频",@"财经",@"科技",@"汽车",@"时尚",@"图片",@"直播",@"热点",@"跟帖",@"房产",@"轻松一刻",@"段子",@"军事",@"历史",@"家居",@"独家",@"游戏",@"健康",@"政务",@"漫画",@"哒哒趣闻",@"彩票",@"美女",@"社会",@"跑步",@"数码",@"NBA",@"航空",@"影视歌",@"股票",@"中国足球",@"国际足球",@"CBA",@"手机",@"智能",@"云课堂",@"态度公开课",@"旅游",@"读书",@"酒香",@"教育",@"亲子",@"暴雪游戏",@"态度营销",@"情感",@"艺术",@"海外",@"博客",@"论坛",@"萌宠"];
}

-(NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return self.titles.count;
}

-(UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    ViewController* vc=[[ViewController alloc]initWithNewsPageEnum:index];
    return vc;
}


-(void)setNavigationItem{
    UIBarButtonItem* seek=[[UIBarButtonItem alloc]initWithImage:[UIImage imageWithName:@"night_search_icon"] style:UIBarButtonItemStylePlain target:self action:@selector(seek:)];
    UIBarButtonItem* lefeButton=[UIBarButtonItem itemImageName:@"nav_live_room_image" highImageName:@"" target:self action:@selector(lefeButton:)];
    self.navigationItem.rightBarButtonItem=seek;
    self.navigationItem.leftBarButtonItem=lefeButton;
}
-(void)seek:(UIBarButtonItem*)sender{
    NSLog(@"%@",@"1111");
}

-(void)lefeButton:(UIBarButtonItem*)sender{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationItem];
    self.navigationItem.title=@"网易";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
