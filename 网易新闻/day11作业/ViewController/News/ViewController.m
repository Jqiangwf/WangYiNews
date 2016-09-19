//
//  ViewController.m
//  day11作业
//
//  Created by tarena07 on 16/9/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic)UITableView* newsTableView;
@property(nonatomic)NSMutableArray<NewsTModel*>* newsArray;
@property(nonatomic)NewsModel* model;
@property(nonatomic)NSInteger page;
@end

@implementation ViewController

-(void)setNavigationItem{
    UIBarButtonItem* seek=[[UIBarButtonItem alloc]initWithImage:[UIImage imageWithName:@"night_search_icon"] style:UIBarButtonItemStylePlain target:self action:@selector(seek:)];
    UIBarButtonItem* lefeButton=[UIBarButtonItem itemImageName:@"" highImageName:@"" target:self action:@selector(lefeButton:)];
    self.navigationItem.rightBarButtonItems=@[seek,lefeButton];
}
-(void)seek:(UIBarButtonItem*)sender{
}

-(void)lefeButton:(UIBarButtonItem*)sender{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self newsTableView];
    [self setNavigationItem];
    self.navigationItem.title=@"网易";
    self.newsTableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [NetManager getNewsModelPage:0 handler:^(NewsModel *model, NSError *error) {
            if (!error) {
                self.model=model;
                NSLog(@"%@",model.T);
                [self.newsArray removeAllObjects];
                self.page=0;
                [self.newsArray addObjectsFromArray:model.T];
                [self.newsTableView reloadData];
            }
            [self.newsTableView.mj_header endRefreshing];
        }];
    }];
    [self.newsTableView.mj_header beginRefreshing];
    
    self.newsTableView.mj_footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [NetManager getNewsModelPage:self.page+20 handler:^(NewsModel *model, NSError *error) {
            if (!error) {
                self.model=model;
                self.page+=20;
                [self.newsArray addObjectsFromArray:model.T];
                [self.newsTableView reloadData];
            }
            [self.newsTableView.mj_footer endRefreshing];
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - tableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.newsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NeteaseNewsCell* cell=[tableView dequeueReusableCellWithIdentifier:@"NeteaseNewsCell" forIndexPath:indexPath];
    
    NeteaseNews2Cell* cell2=[tableView dequeueReusableCellWithIdentifier:@"NeteaseNews2Cell" forIndexPath:indexPath];
    
    NewsTModel* model=self.newsArray[indexPath.row];
    
//    NSLog(@"row=%@",self.newsArray[indexPath.row]);
    NSLog(@"%ld",[model replyCount]);
    
    if ([model.source isEqualToString:@"网易原创"]) {
        cell.title.text=model.title;
        [cell.imageIV1 setImageURL:model.imgsrc.lp_URL];
//        NSArray<NewsImgextraModel*>* array=model.imgextra;
//        NSLog(@"%@",array);
//        NewsImgextraModel* ImgextraModel=array
//        cell.imageIV2 setImageURL:array
        NSArray* aa=model.imgextra;
        NSDictionary* dic1=aa[1];
        NSDictionary* dic=aa[0];
        NSString* str=dic[@"imgsrc"];
        NSString* str1=dic1[@"imgsrc"];
        [cell.imageIV2 setImageURL:str.lp_URL];
        [cell.imageIV3 setImageURL:str1.lp_URL];
    cell.newsName.text=model.source;
    cell.redContent.text=[NSString stringWithFormat:@"%ld跟帖",model.replyCount];
        
        return cell;
    }
    else{
        [cell2.imageIV setImageURL:model.imgsrc.lp_URL];
        cell2.title.text=model.title;
        cell2.newsName.text=model.source;
        cell2.redContent.text=[NSString stringWithFormat:@"%ld跟帖",model.replyCount];
        return cell2;
    }
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

#pragma mark - lazyload
- (UITableView *)newsTableView {
	if(_newsTableView == nil) {
		_newsTableView = [[UITableView alloc] initWithFrame:CGRectNull style:UITableViewStylePlain];
        [self.view addSubview:_newsTableView];
        [_newsTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _newsTableView.dataSource=self;
        _newsTableView.delegate=self;
        
        [_newsTableView registerClass:[NeteaseNewsCell class] forCellReuseIdentifier:@"NeteaseNewsCell"];
        
        [_newsTableView registerClass:[NeteaseNews2Cell class] forCellReuseIdentifier:@"NeteaseNews2Cell"];
	}
	return _newsTableView;
}

- (NSMutableArray<NewsTModel*> *)newsArray {
	if(_newsArray == nil) {
		_newsArray = [[NSMutableArray<NewsTModel*> alloc] init];
	}
	return _newsArray;
}

@end
