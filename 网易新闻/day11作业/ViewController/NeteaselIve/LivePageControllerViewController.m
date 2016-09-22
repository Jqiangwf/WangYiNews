//
//  LivePageControllerViewController.m
//  day11作业
//
//  Created by tarena29 on 16/9/21.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LivePageControllerViewController.h"
#import "NeteaselIveViewController.h"
#import "LiveCategoryTableViewController.h"
@interface LivePageControllerViewController ()

@end

@implementation LivePageControllerViewController
#pragma mark - life
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - page
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.menuViewLayoutMode = WMMenuViewLayoutModeCenter;
        self.menuViewStyle = WMMenuViewStyleSegmented;
        self.showOnNavigationBar = YES;
        self.progressColor = [UIColor whiteColor];
        
    }
    return self;
}

-(NSArray<NSString *> *)titles{
    return @[@"热门",@"分类"];
}
-(NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return self.titles.count;
}
-(UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    self.titleColorNormal = [UIColor whiteColor];
    self.titleColorSelected = [UIColor redColor];
    self.menuBGColor = [UIColor clearColor];
    self.menuItemWidth = 100;
    self.menuHeight = 33;
    self.titleSizeNormal = 14;
    self.titleSizeSelected = 14;
    if (index == 0) {
        NeteaselIveViewController *nvc = [[NeteaselIveViewController alloc]init];
        return nvc;
    }else{
        
        LiveCategoryTableViewController *lvc = [[LiveCategoryTableViewController alloc]init];
        return lvc;
    }
}


@end
