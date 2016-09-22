//
//  LiveCategoryTableViewController.m
//  day11作业
//
//  Created by tarena29 on 16/9/21.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LiveCategoryTableViewController.h"
#import "CategoryCollectionViewCell.h"
#import "NeteaselIveCell.h"
#import "NetManager.h"
#import "PageController.h"
#import "CategoryModel.h"
@interface LiveCategoryTableViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) NSArray *titleList;
@property (nonatomic) UITableView *tableView;
@property (nonatomic) NSInteger selectorNum;
@property (nonatomic) NSMutableArray *dataList;
@property (nonatomic) NSInteger page;
@end

@implementation LiveCategoryTableViewController

#pragma mark - collectionView Delegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.titleList.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CategoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    cell.titleLb.text = self.titleList[indexPath.row];
    if (self.selectorNum == indexPath.row) {
        cell.titleLb.textColor = [UIColor whiteColor];
        cell.bottomView.backgroundColor = [UIColor colorWithRed:0.949 green:0.118 blue:0.204 alpha:1.000];
    }else{
        cell.titleLb.textColor = [UIColor blackColor];
        cell.bottomView.backgroundColor = [UIColor whiteColor];
    }
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.selectorNum = indexPath.row;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [NetManager getPage:1 andNum:self.selectorNum + 3 handler:^(CategoryModel *model, NSError *error) {
            self.page = 1;
            [self.dataList removeAllObjects];
            [self.dataList addObjectsFromArray:model.live_review];
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
        }];
        
    }];
    [self.tableView.mj_header beginRefreshing];
    
    
    [self.collectionView reloadData];
}

#pragma mark - life

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[NeteaselIveCell class] forCellReuseIdentifier:@"NeteaselIveCell"];
    [self.collectionView registerClass:[CategoryCollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [NetManager getPage:1 andNum:self.selectorNum + 3 handler:^(CategoryModel *model, NSError *error) {
            self.page = 1;
            [self.dataList removeAllObjects];
            [self.dataList addObjectsFromArray:model.live_review];
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
        }];
        
    }];
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [NetManager getPage:_page + 1 andNum:self.selectorNum + 3 handler:^(CategoryModel *model, NSError *error) {
            _page ++;
            [self.dataList addObjectsFromArray:model.live_review];
            [self.tableView reloadData];
            [self.tableView.mj_footer endRefreshing];
        }];
        
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Tableview dataSource


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count ;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NeteaselIveCell* cell=[tableView dequeueReusableCellWithIdentifier:@"NeteaselIveCell" forIndexPath:indexPath];
    CategoryLive_ReviewModel *model = self.dataList[indexPath.row];
    [cell.neteaImageView setImageURL:model.image.lp_URL];
    
    cell.redContent.text = [NSString stringWithFormat:@"%ld参与",model.userCount];
    cell.neteaTitle.text=model.roomName;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CategoryLive_ReviewModel *model = self.dataList[indexPath.row];
    
    PageController *pc = [[PageController alloc]init];
    pc.ID = model.roomId;
    [self.navigationController pushViewController:pc animated:YES];
    
    
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

#pragma mark - lazy

- (UICollectionView *)collectionView {
    if(_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 12;
        layout.minimumInteritemSpacing = 6;
        layout.itemSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width - 8 * 2 - 6 * 4)/5, 30);
        layout.sectionInset = UIEdgeInsetsMake(10, 8, 10, 8);
        _collectionView = [[UICollectionView alloc] initWithFrame:(CGRectMake(0, 0, 100, 100)) collectionViewLayout:layout];
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            make.height.equalTo(150);
        }];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor colorWithWhite:0.979 alpha:1.000];
        
    }
    return _collectionView;
}

- (NSArray *)titleList {
    if(_titleList == nil) {
        _titleList = [[NSArray alloc] init];
        _titleList = @[@"TOP100",@"大直播",@"在现场",@"星在线",@"纵横谈",@"资讯",@"娱乐",@"本地",@"体育",@"时尚",@"汽车",@"科技",@"财经",@"生活"];
    }
    return _titleList;
}

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.collectionView.mas_bottom);
            make.left.right.bottom.equalTo(0);
            
        }];
    }
    return _tableView;
}



- (NSMutableArray *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray alloc] init];
    }
    return _dataList;
}

@end
