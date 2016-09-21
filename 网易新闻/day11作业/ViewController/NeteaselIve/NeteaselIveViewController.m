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
#import "PageController.h"


@interface NeteaselIveViewController ()<UITableViewDataSource,UITableViewDelegate,iCarouselDelegate,iCarouselDataSource>
@property(nonatomic)UITableView* tableView;

@property (nonatomic) LiveModel *model;
@property (nonatomic) NSMutableArray *topDataList;
@property (nonatomic) NSMutableArray *futureDataList;
@property (nonatomic) NSMutableArray *reviewDataList;
@property (nonatomic) NSInteger count;

/***** tableViewHeader  *****/
@property (nonatomic) iCarousel *ic;
@property (nonatomic) UIView *headerView;
@property (nonatomic) UIPageControl *pc;
@property (nonatomic) UILabel *bottomLb;
@property (nonatomic) NSArray<LiveTopModel *> *topList;
@property (nonatomic) NSTimer *timer;
@end

@implementation NeteaselIveViewController

#pragma mark - ic delegate

-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.topList.count;
}
-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        UIImageView *iv = [[UIImageView alloc]initWithFrame:carousel.bounds];
        view = iv;
    }
    [(UIImageView*)view setImageURL:self.topList[index].image.lp_URL];
    self.bottomLb.text = self.topList[index].roomName;
    
    return view;
}
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    self.pc.currentPage = carousel.currentItemIndex;
}
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}
-(void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    PageController *pc = [[PageController alloc]init];
    pc.ID = self.topList[index].roomId;
    [self.navigationController pushViewController:pc animated:YES];
}


#pragma mark - navi
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
#pragma mark - life
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationItem];
    [self tableView];
    
    [self.tableView registerClass:[FutureTableViewCell class] forCellReuseIdentifier:@"futureCell"];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.timer invalidate];
        [NetManager getLivePage:1 handler:^(LiveModel *model, NSError *error) {
            if (error) {
                self.tableView.tableHeaderView = nil;
            }else{
                
                self.tableView.tableHeaderView = self.headerView;
                self.topList = model.top;
                [self.ic reloadData];
                self.pc.numberOfPages = self.topList.count;
                
                
                self.model = model;
                _count = 1;
                [self.topDataList removeAllObjects];
                [self.futureDataList removeAllObjects];
                [self.reviewDataList removeAllObjects];
                
                
                [self.topDataList addObjectsFromArray:model.top];
                [self.futureDataList addObjectsFromArray:model.future];
                [self.reviewDataList addObjectsFromArray:model.live_review];
                
                self.timer = [NSTimer bk_scheduledTimerWithTimeInterval:6 block:^(NSTimer *timer) {
                    [self.ic scrollToItemAtIndex:self.ic.currentItemIndex + 1 duration:1.5];
                } repeats:YES];
                [self.tableView reloadData];
                [self.tableView.mj_header endRefreshing];
            }
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
        
        if (self.futureDataList.count){
            cell.accessoryType = 1;
            cell.countLb.text = [NSString stringWithFormat:@"%ld场",self.futureDataList.count];
            cell.futureLb.text = @"预告 /";
            cell.contentLb.text = @"       用直播，看新闻，不出门，识天下";
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
    }else{
        Live_ReviewModel *model = self.reviewDataList[indexPath.row - 1];
        
        PageController *pc = [[PageController alloc]init];
        pc.ID = model.roomId;
        [self.navigationController pushViewController:pc animated:YES];
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



- (NSMutableArray *)topDataList {
    if(_topDataList == nil) {
        _topDataList = [[NSMutableArray alloc] init];
    }
    return _topDataList;
}


- (UIView *)headerView {
    if(_headerView == nil) {
        _headerView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, 0, self.tableView.width * 310 / 750))];
        
        _ic = [[iCarousel alloc] init];
        [_headerView addSubview:_ic];
        _ic.scrollSpeed = 0;
        _ic.dataSource = self;
        _ic.delegate = self;
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        
        UIView *bottomView = [UIView new];
        [_headerView addSubview:bottomView];
        bottomView.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.506];
        [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.equalTo(0);
            make.height.equalTo(23);
        }];
        
        _pc = [[UIPageControl alloc] init];
        [bottomView addSubview:_pc];
        _pc.userInteractionEnabled = NO;
        [_pc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(0);
            make.bottom.equalTo(3);
        }];
        
        _bottomLb = [[UILabel alloc] init];
        [bottomView addSubview:_bottomLb];
        _bottomLb.textColor = [UIColor whiteColor];
        _bottomLb.font = [UIFont systemFontOfSize:13];
        [_bottomLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.centerX.equalTo(-self.pc.width/2);
        }];
        
    }
    return _headerView;
}



- (UIPageControl *)pc {
    if(_pc == nil) {
        _pc = [[UIPageControl alloc] init];
    }
    return _pc;
}

- (UILabel *)bottomLb {
    if(_bottomLb == nil) {
        _bottomLb = [[UILabel alloc] init];
    }
    return _bottomLb;
}

@end
