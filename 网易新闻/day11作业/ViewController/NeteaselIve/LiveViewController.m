//
//  LiveViewController.m
//  day11作业
//
//  Created by tarena29 on 16/9/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LiveViewController.h"
#import "NetManager.h"
#import "DiscussModel.h"
#import "LiveTableViewCell.h"
@interface LiveViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic) UITableView *tableView;
@property (nonatomic) DiscussModel *model;
@property (nonatomic) UIView *bottomView;
@end

@implementation LiveViewController

-(id)initWithRoomID:(NSInteger)ID{
    if (self = [super init]) {
        self.ID = ID;
        
    }
    return self;
}
#pragma mark - life
- (void)viewDidLoad {
    [super viewDidLoad];
    [self bottomView];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.tableView registerClass:[LiveTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [NetManager getID:_ID Handler:^(DiscussModel *model, NSError *error) {
        self.model = model;
        [self.tableView reloadData];
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - tableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.model.last_log.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LiveTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    DiscussLast_LogModel *mo = self.model.last_log[indexPath.row];
    cell.nickNameLb.text = @"游客";
    cell.contentLb.text = mo.msg;
    cell.backgroundColor = [UIColor clearColor];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSDate *date=[NSDate dateWithTimeIntervalSince1970:mo.time];
    [formatter setDateFormat:@"HH:mm"];
    cell.timeLb.text = [formatter stringFromDate:date];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

#pragma mark - lazy

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor colorWithWhite:0.949 alpha:1.000];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(270);
            make.left.right.equalTo(0);
            make.bottom.equalTo(-45);
        }];
    }
    return _tableView;
}

- (UIView *)bottomView {
    if(_bottomView == nil) {
        _bottomView = [[UIView alloc] init];
        [self.view addSubview:_bottomView];
        _bottomView.layer.borderColor = [UIColor colorWithWhite:0.869 alpha:1.000].CGColor;
        _bottomView.layer.borderWidth = 1;
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.top.equalTo(self.tableView.mas_bottom);
        }];
        
        UITextField *tf = [[UITextField alloc]init];
        [_bottomView addSubview:tf];
        tf.placeholder = @"  我要说两句";
        tf.layer.borderWidth = 1;
        tf.layer.cornerRadius = 10;
        tf.layer.masksToBounds = YES;
        tf.layer.borderColor = [UIColor colorWithWhite:0.837 alpha:1.000].CGColor;
        [tf mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(0);
            make.left.equalTo(10);
            make.right.equalTo(-10);
            
        }];
    }
    return _bottomView;
}

@end
