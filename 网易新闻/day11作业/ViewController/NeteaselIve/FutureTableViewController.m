//
//  FutureTableViewController.m
//  day11作业
//
//  Created by tarena29 on 16/9/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "FutureTableViewController.h"
#import "FutureDetailTableViewCell.h"
#import "LiveViewController.h"
#import "PageController.h"
@interface FutureTableViewController ()

@end

@implementation FutureTableViewController
#pragma mark - life
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[FutureDetailTableViewCell class] forCellReuseIdentifier:@"cell"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FutureDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    NSString *time = [self.dataList[indexPath.row].startTime substringWithRange:NSMakeRange(11, 5)];
    cell.timeLb.text = time;
    cell.contentLb.text = self.dataList[indexPath.row].roomName;
    [cell.iconIv setImage:[UIImage imageNamed:@"block"]];
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PageController *pc = [[PageController alloc]init];
    pc.ID = self.dataList[indexPath.row].roomId;
    [self.navigationController pushViewController:pc animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

#pragma mark - lazy
- (NSMutableArray<LiveFutureModel*> *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray<LiveFutureModel*> alloc] init];
        
    }
    return _dataList;
}

@end
