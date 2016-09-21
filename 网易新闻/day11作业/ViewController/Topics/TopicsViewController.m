//
//  TopicsViewController.m
//  day11作业
//
//  Created by tarena07 on 16/9/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TopicsViewController.h"
#import "SubjectModel.h"
#import "SubjectHeadModel.h"
#import "RX_NormalViewCell.h"
@interface TopicsViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic) UITableView *subjectTableView;

@property (nonatomic) NSMutableArray<SubjectDataExpertlistModel *> *sbList;
@property (nonatomic) NSInteger page;
@end

@implementation TopicsViewController
#pragma mark - Navigation_method
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

#pragma matk - Networking
-(void) getNetwoking {
    self.subjectTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [NetManager getSubjectModelPage:0 handler:^(SubjectModel *model, NSError *error) {
            [self.subjectTableView.mj_header endRefreshing];
            [self.sbList removeAllObjects];
            [self.sbList addObjectsFromArray:model.data.expertList];
            [self.subjectTableView reloadData];
            _page = 0;
        }];
    }];
    [self.subjectTableView.mj_header beginRefreshing];
    
    self.subjectTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [NetManager getSubjectModelPage:_page = 10 handler:^(SubjectModel *model, NSError *error) {
            [self.subjectTableView.mj_footer endRefreshing];
            [self.sbList addObjectsFromArray:model.data.expertList];
            [self.subjectTableView reloadData];
            _page += 10;
        }];
        
    }];
    [self.subjectTableView.mj_footer endRefreshing];
}

#pragma mark - life
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationItem];
    [self getNetwoking];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - lazy
- (UITableView *)subjectTableView {
    if(_subjectTableView == nil) {
        _subjectTableView = [[UITableView alloc] initWithFrame:CGRectNull style:(UITableViewStylePlain)];
        _subjectTableView.delegate = self;
        _subjectTableView.dataSource = self;
        _subjectTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_subjectTableView registerClass:[RX_NormalViewCell class] forCellReuseIdentifier:@"RX_NormalViewCell"];
        [self.view addSubview:_subjectTableView];
        [_subjectTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _subjectTableView;
}
- (NSMutableArray<SubjectDataExpertlistModel *> *)sbList {
    if(_sbList == nil) {
        _sbList = [[NSMutableArray<SubjectDataExpertlistModel *> alloc] init];
    }
    return _sbList;
}
#pragma mark - UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.sbList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //        if (indexPath.row == 0) {
    //            
    //        }
    
    SubjectDataExpertlistModel *model = self.sbList[indexPath.row];
    
    RX_NormalViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RX_NormalViewCell" forIndexPath:indexPath];
    [cell.headPicIV setImageWithURL:model.headpicurl.lp_URL];
    cell.nameAndTitleLb.text = [NSString stringWithFormat:@"%@ / %@", model.name, model.title];
    [cell.picurlIV setImageWithURL:model.picurl.lp_URL];
    cell.aliasLb.text = model.alias;
    cell.classificationLb.text = model.classification;
    if (model.questionCount >= 10000) {
        cell.questionCountLb.text = [NSString stringWithFormat:@"%.2ld万关注", model.questionCount / 10000];
    }else{
        cell.questionCountLb.text = [NSString stringWithFormat:@"%ld关注", model.questionCount];
    }
    if (model.answerCount >= 10000) {
        cell.answerCountLb.text = [NSString stringWithFormat:@"%.2ld万评论", model.answerCount / 10000];
    }else{
        cell.answerCountLb.text = [NSString stringWithFormat:@"%ld评论", model.answerCount];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
    
}





@end
