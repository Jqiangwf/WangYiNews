//
//  ViewController.m
//  day11作业
//
//  Created by tarena07 on 16/9/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,iCarouselDelegate,iCarouselDataSource>
@property(nonatomic)UITableView* newsTableView;
@property(nonatomic)NSMutableArray<NewsTModel*>* newsArray;
@property(nonatomic)NewsModel* model;
@property(nonatomic)NSInteger page;
/******TableViewHeader******/
@property(nonatomic)UIView* headerView;
@property(nonatomic)iCarousel* ic;
@property(nonatomic)UILabel* neteatitle;
@property(nonatomic)UIPageControl* pc;

@property(nonatomic)NSTimer* timer;

@end

@implementation ViewController

-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return 2;
}
-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        UIImageView* iv=[[UIImageView alloc]initWithFrame:carousel.bounds];
        view=iv;
    }
    [((UIImageView*)view) setImageURL:self.newsArray[index].imgsrc.lp_URL];
    
    return view;
}

-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    self.pc.currentPage=self.ic.currentItemIndex;
    self.neteatitle.text=self.newsArray[self.ic.currentItemIndex].title;
}

-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option==iCarouselOptionWrap) {
        value=YES;
    }
    return value;
}

-(void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{

}
-(instancetype)initWithNewsPageEnum:(NewsPageEnum)newsPageEnum{
    self=[super init];
    if (self) {
        self.newsPageEnum=newsPageEnum;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self newsTableView];
    
    self.newsTableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [NetManager getNewsModelPage:0 newsPageEnum:self.newsPageEnum handler:^(NewsModel *model, NSError *error) {
            if (!error) {
                self.model=model;
                [self.newsArray removeAllObjects];
                self.page=0;
                [self.newsArray addObjectsFromArray:model.T];
                self.neteatitle.text=self.newsArray[0].title;
                [self.timer invalidate];
                self.newsTableView.tableHeaderView=self.headerView;
                [self.ic reloadData];
                self.pc.numberOfPages=2;
                self.timer=[NSTimer bk_scheduledTimerWithTimeInterval:10 block:^(NSTimer *timer) {
                    [self.ic scrollToItemAtIndex:self.ic.currentItemIndex+1 duration:2];
                } repeats:YES];
                [self.newsTableView reloadData];
            }
            [self.newsTableView.mj_header endRefreshing];
        }];
    }];
    [self.newsTableView.mj_header beginRefreshing];
    
    self.newsTableView.mj_footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [NetManager getNewsModelPage:self.page+20 newsPageEnum:self.newsPageEnum handler:^(NewsModel *model, NSError *error) {
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
    
}
#pragma mark - tableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.newsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NewsTModel* model=self.newsArray[indexPath.row+1];
//    if (indexPath.row==0) {
//        NeteaseNews1Cell* cell=[tableView dequeueReusableCellWithIdentifier:@"NeteaseNews1Cell" forIndexPath:indexPath];
//        [cell.imgsrcImage setImageURL:model.imgsrc.lp_URL];
//        cell.title.text=model.title;
//        return cell;
//    }
//    else
        if (model.imgextra.count>=2&&indexPath.row!=0) {
        NeteaseNewsCell* cell=[tableView dequeueReusableCellWithIdentifier:@"NeteaseNewsCell" forIndexPath:indexPath];
        cell.title.text=model.title;
        [cell.imageIV1 setImageURL:model.imgsrc.lp_URL];
        [cell.imageIV2 setImageURL:model.imgextra[0].imgsrc.lp_URL];
        [cell.imageIV3 setImageURL:model.imgextra[1].imgsrc.lp_URL];
        cell.newsName.text=model.source;
        cell.redContent.text=[NSString stringWithFormat:@"%ld跟帖",model.replyCount];
        return cell;
    }else if(model.imgType==1) {
        NeteaseNews3Cell* cell=[tableView dequeueReusableCellWithIdentifier:@"NeteaseNews3Cell" forIndexPath:indexPath];
        [cell.imgsrcImage setImageURL:model.imgsrc.lp_URL];
        cell.title.text=model.title;
        cell.replyCount.text=[NSString stringWithFormat:@"%ld跟帖",model.replyCount];
        cell.source.text=model.source;
        return cell;
    }
    else{
        NeteaseNews2Cell* cell=[tableView dequeueReusableCellWithIdentifier:@"NeteaseNews2Cell" forIndexPath:indexPath];
        [cell.imageIV setImageURL:model.imgsrc.lp_URL];
        cell.title.text=model.title;
        cell.newsName.text=model.source;
        cell.redContent.text=[NSString stringWithFormat:@"%ld跟帖",model.replyCount];
        return cell;
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
        [_newsTableView registerClass:[NeteaseNews3Cell class] forCellReuseIdentifier:@"NeteaseNews3Cell"];
        [_newsTableView registerClass:[NeteaseNews1Cell class] forCellReuseIdentifier:@"NeteaseNews1Cell"];
	}
	return _newsTableView;
}

- (NSMutableArray<NewsTModel*> *)newsArray {
	if(_newsArray == nil) {
		_newsArray = [[NSMutableArray<NewsTModel*> alloc] init];
	}
	return _newsArray;
}

- (UIView *)headerView {
	if(_headerView == nil) {
		_headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, self.newsTableView.width* 548 / 1080.0 )];
	}
    return _headerView;
}

- (iCarousel *)ic {
	if(_ic == nil) {
		_ic = [[iCarousel alloc] init];
        [self.headerView addSubview:_ic];
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.headerView);
        }];
        _ic.scrollSpeed=0;
        _ic.dataSource=self;
        _ic.delegate=self;
	}
	return _ic;
}
- (UILabel *)neteatitle {
    if(_neteatitle == nil) {
        _neteatitle = [[UILabel alloc] init];
        UIView* view=[[UIView alloc]init];
        view.backgroundColor=[UIColor grayColor];
        [self.ic addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(30);
        }];

        [view addSubview:_neteatitle];
        [_neteatitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.right.equalTo(-50);
            make.bottom.top.equalTo(0);
        }];
        _neteatitle.font=[UIFont systemFontOfSize:15];
        _neteatitle.textColor=[UIColor whiteColor];
    }
    return _neteatitle;
}
- (UIPageControl *)pc {
	if(_pc == nil) {
		_pc = [[UIPageControl alloc] init];
        [self.headerView addSubview:_pc];
        [_pc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-10);
            make.centerY.equalTo(self.neteatitle);
        }];
        _pc.userInteractionEnabled=NO;
	}
	return _pc;
}



@end
