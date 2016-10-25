//
//  BangDanController.m
//  BanTang
//
//  Created by stone on 2016/10/22.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BangDanController.h"
#import "TopViewModel.h"
#import "TopCell.h"
#import "CustomFlowLayout.h"

static NSString* reuseIdentifier = @"ReuseCell";
static NSString* headerViewIdentifier = @"HeadView";
@interface BangDanController ()
@property (nonatomic,strong)TopViewModel* viewModel;
@property (nonatomic,strong)UIImageView* headView;
@end

@implementation BangDanController

-(UIImageView *)headView{
    if (_headView == nil) {
        _headView = [[UIImageView alloc]init];
        _headView.frame = CGRectMake(0, 0, ZMSCREENW, HEADERSCROLLVIEWH);
    }
    return _headView;
}

-(TopViewModel *)viewModel{
    if (_viewModel == nil) {
        _viewModel = [[TopViewModel alloc]initWithType:self.type];
    }
    return _viewModel;
}
//collectionView初始化时必须指定布局样式
-(instancetype)init{
    if (self = [super init]) {
        CustomFlowLayout* layout = [[CustomFlowLayout alloc]init];
        self = [[BangDanController alloc]initWithCollectionViewLayout:layout];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = VIEWBGCOLOR;
    [self.collectionView registerNib:[UINib nibWithNibName:@"TopCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    //注册头部视图
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerViewIdentifier];
    [self getCacheData];
    [self refreshData];
    [self getmoreData];

}

#pragma mark 获取缓存数据
-(void)getCacheData{
    [self.viewModel getCacheDataCompletionHandle:^(BOOL isSuccess) {
        if (isSuccess) {
             [self.headView sd_setImageWithURL:[self.viewModel getHeaderImageUrl]];
            [self.collectionView reloadData];
        }
    }];
}
#pragma mark - 添加头部视图的代理方法
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *header=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerViewIdentifier forIndexPath:indexPath];
        //头视图添加view
        [header addSubview:self.headView];
        return header;
    }
    //如果底部视图
//        if([kind isEqualToString:UICollectionElementKindSectionFooter]){
//
//        }
    return nil;
}

#pragma  mark - 刷新数据
-(void)refreshData{
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.viewModel refreshDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self.collectionView.mj_header endRefreshing];
                return ;
            }
            [self.collectionView.mj_header endRefreshing];
            [self.collectionView reloadData];
            [self.headView sd_setImageWithURL:[self.viewModel getHeaderImageUrl]];
        }];
    }];
    [self.collectionView.mj_header beginRefreshing];
}
#pragma mark - 获取更多
-(void)getmoreData{
    self.collectionView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        [self.viewModel getMoreDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self.collectionView.mj_header endRefreshing];
                return ;
            }
            [self.collectionView.mj_header endRefreshing];
            [self.collectionView reloadData];
        }];
    }];
}

#pragma mark - UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.viewModel.dataArr.count;;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TopCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.topModel = self.viewModel.dataArr[indexPath.row];
    return cell;
}

@end
