//
//  NeteaselIveViewController.m
//  day11作业
//
//  Created by tarena07 on 16/9/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NeteaselIveViewController.h"
#import "NeteaselIveCell.h"
#import "LiveModel.h"
#import "NetManager.h"
#import "FutureTableViewCell.h"
#import "FutureTableViewController.h"

@interface NeteaselIveViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic)UITableView* tableView;
@property (nonatomic) UIScrollView *fView;
@property (nonatomic) UIPageControl *pc;
@property (nonatomic) LiveModel *model;
@property (nonatomic) NSMutableArray *topDataList;
@property (nonatomic) NSMutableArray *futureDataList;
@property (nonatomic) NSMutableArray *reviewDataList;
@property (nonatomic) NSInteger count;


@end

@implementation NeteaselIveViewController

-(void)setNavigationItem{
    UIView* view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
    //    view.backgroundColor=[UIColor orangeColor];
    view.layer.cornerRadius=view.frame.size.height*0.5;
    view.layer.masksToBounds=YES;
    view.layer.borderWidth=1;
    view.layer.borderColor=[UIColor whiteColor].CGColor ;
    UISegmentedControl* seg=[[UISegmentedControl alloc]initWithItems:@[@"热门",@"分类"]];
    seg.selectedSegmentIndex=0;
    [seg addTarget:self action:@selector(neteaselIvesegmented:) forControlEvents:(UIControlEventValueChanged)];
    
    seg.frame=CGRectMake(0, 0, 200, 30);
    [view addSubview:seg];
    self.navigationItem.titleView =view;
}
-(void)neteaselIvesegmented:(UISegmentedControl*)sender{
    //    NSLog(@"neteaselIve=%ld",sender.selectedSegmentIndex);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationItem];
    [self tableView];
    
    [self.tableView registerClass:[FutureTableViewCell class] forCellReuseIdentifier:@"futureCell"];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [NetManager getLivePage:1 handler:^(LiveModel *model, NSError *error) {
            self.model = model;
            _count = 1;
            [self.topDataList removeAllObjects];
            [self.futureDataList removeAllObjects];
            [self.reviewDataList removeAllObjects];
            
            
            [self.topDataList addObjectsFromArray:model.top];
            [self fView];
            [self.futureDataList addObjectsFromArray:model.future];
            [self.reviewDataList addObjectsFromArray:model.live_review];
            
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
        }];
        
        
    }];
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [NetManager getLivePage:_count + 1 handler:^(LiveModel *model, NSError *error) {
            _count ++;
            self.model = model;
            
            [self.topDataList addObjectsFromArray:model.top];
            
            [self.futureDataList addObjectsFromArray:model.future];
            [self.reviewDataList addObjectsFromArray:model.live_review];
            
            [self.tableView reloadData];
            [self.tableView.mj_footer endRefreshing];
        }];
    }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - tableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.reviewDataList.count + 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        FutureTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"futureCell" forIndexPath:indexPath];
        cell.accessoryType = 1;
        if (self.futureDataList.count){
            cell.countLb.text = [NSString stringWithFormat:@"%ld场",self.futureDataList.count];
            cell.futureLb.text = @"预告 /";
        }
        return cell;
    }
    
    
    NeteaselIveCell* cell=[tableView dequeueReusableCellWithIdentifier:@"NeteaselIveCell" forIndexPath:indexPath];
    Live_ReviewModel *model = self.reviewDataList[indexPath.row - 1];
    [cell.neteaImageView setImageURL:model.image.lp_URL];
    
    cell.redContent.text = [NSString stringWithFormat:@"%ld参与",model.userCount];
    cell.neteaTitle.text=model.roomName;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        FutureTableViewController *vc = [[FutureTableViewController alloc]init];
        vc.dataList = self.futureDataList;
        
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
    
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

#pragma mark - lazyload

-(UITableView *)tableView{
    if (_tableView==nil) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectNull style:(UITableViewStylePlain)];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _tableView.dataSource=self;
        _tableView.delegate=self;
        [_tableView registerClass:[NeteaselIveCell class] forCellReuseIdentifier:@"NeteaselIveCell"];
    }
    return _tableView;
}


- (UIScrollView *)fView {
    if(_fView == nil) {
        UIView *bv = [[UIView alloc]initWithFrame:(CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width/2.5))];
        self.tableView.tableHeaderView = bv;
        
        _fView = [[UIScrollView alloc] initWithFrame:(CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width/2.5))];
        _fView.pagingEnabled = YES;
        [bv addSubview:_fView];
        UIImageView *lastIv = nil;
        for (int i = 0 ; i < self.topDataList.count; i ++) {
            
            UIImageView *iconIv = [UIImageView new];
            
            [_fView addSubview:iconIv];
            iconIv.contentMode = UIViewContentModeScaleAspectFill;
            iconIv.clipsToBounds = YES;
            [iconIv mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(0);
                make.size.equalTo(_fView);
                if (i == 0) {
                    make.left.equalTo(0);
                    
                }else{
                    make.left.equalTo(lastIv.mas_right);
                }
                if (i == 2) {
                    make.right.equalTo(0);
                    
                }
            }];
            lastIv = iconIv;
            
            LiveTopModel *model = self.topDataList[i];
            [iconIv setImageURL:model.image.lp_URL];
            
            
            
            UIView *v = [UIView new];
            [bv addSubview:v];
            v.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.370];
            [v mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.bottom.equalTo(0);
                make.height.equalTo(20);
                
            }];
            UILabel *titileLb = [UILabel new];
            titileLb.text = model.roomName;
            [v addSubview:titileLb];
            titileLb.font = [UIFont systemFontOfSize:13];
            titileLb.textColor = [UIColor whiteColor];
            [titileLb mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(0);
                make.centerX.equalTo(-_pc.bounds.size.width/2);
            }];
        }
        [bv addSubview:_pc];
        [_pc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(4);
        }];
        
    }
    return _fView;
}

- (NSMutableArray *)reviewDataList {
    if(_reviewDataList == nil) {
        _reviewDataList = [[NSMutableArray alloc] init];
    }
    return _reviewDataList;
}

- (NSMutableArray *)futureDataList {
    if(_futureDataList == nil) {
        _futureDataList = [[NSMutableArray alloc] init];
    }
    return _futureDataList;
}

- (UIPageControl *)pc {
    if(_pc == nil) {
        _pc = [[UIPageControl alloc] init];
        
    }
    return _pc;
}

- (NSMutableArray *)topDataList {
    if(_topDataList == nil) {
        _topDataList = [[NSMutableArray alloc] init];
    }
    return _topDataList;
}


@end
