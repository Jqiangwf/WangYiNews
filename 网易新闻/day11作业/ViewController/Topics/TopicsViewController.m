//
//  TopicsViewController.m
//  day11作业
//
//  Created by tarena07 on 16/9/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TopicsViewController.h"

@interface TopicsViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic)UITableView* topicstbaleView;
@end

@implementation TopicsViewController

-(void)setNavigationItem{
    UIView* view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
    //    view.backgroundColor=[UIColor orangeColor];
    view.layer.cornerRadius=view.frame.size.height*0.5;
    view.layer.masksToBounds=YES;
    view.layer.borderWidth=1;
    view.layer.borderColor=[UIColor whiteColor].CGColor ;
    UISegmentedControl* seg=[[UISegmentedControl alloc]initWithItems:@[@"问吧",@"话题",@"关注"]];
    seg.selectedSegmentIndex=0;
    [seg addTarget:self action:@selector(topicssegmented:) forControlEvents:(UIControlEventValueChanged)];
    
    seg.frame=CGRectMake(0, 0, 200, 30);
    [view addSubview:seg];
    self.navigationItem.titleView =view;
    
    UIBarButtonItem* seek=[[UIBarButtonItem alloc]initWithImage:[UIImage imageWithName:@"night_searchBar_icon"] style:UIBarButtonItemStylePlain target:self action:@selector(seek:)];
    UIBarButtonItem* personal=[[UIBarButtonItem alloc]initWithImage:[UIImage imageWithName:@"login_phone"] style:UIBarButtonItemStylePlain target:self action:@selector(personal:)];
    self.navigationItem.leftBarButtonItem=seek;
    self.navigationItem.rightBarButtonItem=personal;
    
}
-(void)seek:(UIBarButtonItem*)sender{
}
-(void)personal:(UIBarButtonItem*)sender{
}

-(void)topicssegmented:(UISegmentedControl*)sender{
    NSLog(@"topics=%ld",sender.selectedSegmentIndex);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableView *)topicstbaleView{
    if (_topicstbaleView==nil) {
        _topicstbaleView=[[UITableView alloc]initWithFrame:CGRectNull style:(UITableViewStylePlain)];
        [self.view addSubview:_topicstbaleView];
        [_topicstbaleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _topicstbaleView.dataSource=self;
        _topicstbaleView.delegate=self;
    }
    return _topicstbaleView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
