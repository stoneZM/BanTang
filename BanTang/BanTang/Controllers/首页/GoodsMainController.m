//
//  GoodsMainController.m
//  BanTang
//
//  Created by stone on 2016/10/24.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "GoodsMainController.h"
#import "GoodViewController.h"
#import "GoodDetailViewController.h"
#import "GoodDetailViewModel.h"
@interface GoodsMainController ()
@property (nonatomic,strong)GoodDetailViewModel* viewModel;
@end

@implementation GoodsMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = VIEWBGCOLOR;
    [self loadData];
}

-(instancetype)initWithrequest:(NSString *)request{
    if (self = [super init]) {
        self.pathId = request;
        [self defaultConfig];
    }
    return self;
}
-(GoodDetailViewModel *)viewModel{
    if (_viewModel == nil) {
        _viewModel = [[GoodDetailViewModel alloc]initWithPathId:self.pathId];
    }
    return _viewModel;
}


-(void)loadData{
       __weak typeof(self) weakslef = self;
        [weakslef.viewModel getDataFromNetCompleteHandle:^(NSError *error) {
            if (error) {
                return;
            }
            [self reloadData];
        }];
}

-(void)defaultConfig{
    self.menuBGColor = [UIColor clearColor];
    self.menuViewStyle = WMMenuViewStyleLine;
    self.titleColorNormal = MenuItemTitleColor;
    self.titleColorSelected = [UIColor redColor];
    self.menuViewLayoutMode = WMMenuViewLayoutModeCenter;
    self.showOnNavigationBar = YES;
    self.progressWidth = 30;
    self.titleSizeNormal = 13;
    self.titleSizeSelected = 14;
    self.speedFactor = 5;
}
#pragma mark - WMPageControllerDelegate
-(NSInteger)numbersOfTitlesInMenuView:(WMMenuView *)menu{
    return 3;
}
-(NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return 3;
}
-(NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index{
    if (index == 0) {
        return @"单品";
    }if (index == 1){
        return @"详情";
    }else{
        return @"评论";
    }
}
-(UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    if (index == 0) {
        return [[GoodViewController alloc]initWithModel:[self.viewModel getDataModel]];
    }else{
        return [[GoodDetailViewController alloc]initWithrequest:[self.viewModel getDetailHtml]];
    }
}
-(void)dealloc{
    ZMLogfunc;
}



@end
