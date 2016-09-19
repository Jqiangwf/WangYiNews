//
//  AmusementViewController.m
//  day11作业
//
//  Created by tarena07 on 16/9/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "AmusementViewController.h"

@interface AmusementViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic)NSMutableArray<RecommendModel*>* recommendArray;
@property(nonatomic)NSMutableArray<AmusementModel*>* amusementArray;
@property(nonatomic)AmusementModel* model;
@property(nonatomic)NSInteger page;
@property(nonatomic)UITableView* amusementtableView;

@end

@implementation AmusementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSMutableArray<RecommendModel*> *)recommendArray {
	if(_recommendArray == nil) {
		_recommendArray = [[NSMutableArray<RecommendModel*> alloc] init];
	}
	return _recommendArray;
}

- (NSMutableArray<AmusementModel*> *)amusementArray {
	if(_amusementArray == nil) {
		_amusementArray = [[NSMutableArray<AmusementModel*> alloc] init];
	}
	return _amusementArray;
}

- (UITableView *)amusementtableView {
	if(_amusementtableView == nil) {
		_amusementtableView = [[UITableView alloc] initWithFrame:CGRectNull style:UITableViewStylePlain];
        [self.view addSubview:_amusementtableView];
        [_amusementtableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
	}
	return _amusementtableView;
}

@end
