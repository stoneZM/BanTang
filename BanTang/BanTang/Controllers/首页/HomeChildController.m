//
//  HomeChildController.m
//  BanTang
//
//  Created by stone on 2016/10/22.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "HomeChildController.h"
#import "HomeViewModel.h"
#import "HomeCell.h"
#import "HeadScrollView.h"
#import "HeadImageViewModel.h"
@interface HomeChildController ()
@property (nonatomic,strong)HomeViewModel* viewModel;
@property (nonatomic,strong)HeadScrollView* scrollImageView;
@property (nonatomic,strong)HeadImageViewModel* imageViewModel;
@property (nonatomic,strong)NSMutableArray* array;
@end


@implementation HomeChildController

-(NSMutableArray *)array{
    if (_array == nil) {
        _array = [[NSMutableArray alloc]init];
        for (int i=0; i<23; i++) {
            UIImage* image = [UIImage imageNamed:[NSString stringWithFormat:@"loading_%02d",i]];
            [_array addObject:image];
        }
    }
    return _array;
}

//属性懒加载
-(HeadScrollView *)scrollImageView{
    if (_scrollImageView == nil) {
        _scrollImageView = [[HeadScrollView alloc]initHeaderView];
    }
    return _scrollImageView;
}
-(HeadImageViewModel *)imageViewModel{
    if (_imageViewModel == nil) {
        _imageViewModel = [[HeadImageViewModel alloc]init];
    }
    return _imageViewModel;
}
-(HomeViewModel *)viewModel{
    if (_viewModel == nil) {
        _viewModel = [[HomeViewModel alloc]initWithHomeType:self.type];
    }
    return _viewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addHeadScrollView];
    [self reloadDataFromCache];
    [self reloadDataFromNetwork];
    [self getmoreData];
}
#pragma mark 获取缓存诗句
-(void)reloadDataFromCache{
    [self.viewModel getCacheDataCompletionHandle:^(BOOL isSuccess) {
        if (isSuccess) {
            [self.tableView reloadData];
        }
    }];
    [self.imageViewModel getCacheDataCompletionHandle:^(BOOL isSuccess) {
        if (isSuccess) {
            self.scrollImageView.model = self.imageViewModel.model;
        }
    }];
}

#pragma mark - 刷新数据
-(void)reloadDataFromNetwork{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
                [self.viewModel refreshDataCompletionHandle:^(NSError *error) {
                    if (error) {
                        [self.tableView.mj_header endRefreshing];
                        return ;
                    }else{
                        [self.tableView.mj_header endRefreshing];
                        [self.tableView reloadData];
                    }
                }];
                [self.imageViewModel getDataFromNetCompleteHandle:^(NSError *error) {
                        if (error) {
                            [self.tableView.mj_header endRefreshing];
                            return ;
                        }
                        self.scrollImageView.model = self.imageViewModel.model;
                    }];
            }];
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark - 获取跟多数据
-(void)getmoreData{
    self.tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        [self.viewModel getMoreDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self.tableView.mj_footer endRefreshing];
                return ;
            }
            [self.tableView.mj_footer endRefreshing];
            [self.tableView reloadData];
        }];
    }];
}

#pragma mark - 添加头部的滚动视图
-(void)addHeadScrollView{
    if (self.type!=100) {
        return ;
    }
    self.tableView.tableHeaderView = self.scrollImageView;
    self.tableView.tableHeaderView.height = HEADERSCROLLVIEWH;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.viewModel.dataArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"HomeCell" owner:nil options:nil].firstObject;
    }
    cell.model = self.viewModel.dataArr[indexPath.section];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return 20;
    }
}
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 0;
//}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}
//去掉section分区头的悬浮效果
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.tableView)
    {
        CGFloat sectionHeaderHeight = 20;
        if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }
}


/*
 //    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
 //        [self.viewModel refreshDataCompletionHandle:^(NSError *error) {
 //            if (error) {
 //                [self.tableView.mj_header endRefreshing];
 //                return ;
 //            }else{
 //                [self.tableView.mj_header endRefreshing];
 //                [self.tableView reloadData];
 //            }
 //        }];
 //        [self.imageViewModel getDataFromNetCompleteHandle:^(NSError *error) {
 //                if (error) {
 //                    [self.tableView.mj_header endRefreshing];
 //                    return ;
 //                }
 //                self.scrollImageView.model = self.imageViewModel.model;
 //            }];
 //    }];
 //    [self.tableView.mj_header beginRefreshing];
 */

@end
