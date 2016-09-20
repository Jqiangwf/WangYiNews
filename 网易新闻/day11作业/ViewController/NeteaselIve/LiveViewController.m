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
@end

@implementation LiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.tableView registerClass:[LiveTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [NetManager getDiscuss:_ID Handler:^(DiscussModel *model, NSError *error) {
        self.model = model;
        [self.tableView reloadData];
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
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
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

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

@end
