//
//  ComposeController.m
//  BanTang
//
//  Created by stone on 2016/10/20.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "CategoryController.h"
#import "ZMSearchBarController.h"
#import "SearchBarBtn.h"
#import "CategoryChildController.h"
@interface CategoryController ()

@end

@implementation CategoryController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = VIEWBGCOLOR;
    [self addSearchBtnToView];
}

-(void)addSearchBtnToView{
    SearchBarBtn* bar = [[SearchBarBtn alloc]init];
    [self.view addSubview:bar];
    [bar addTarget:self action:@selector(popSearchVC) forControlEvents:UIControlEventTouchUpInside];
    [bar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(50);
        make.right.mas_equalTo(-50);
        make.height.mas_equalTo(25);
        make.top.mas_equalTo(64);
    }];
}
-(void)popSearchVC{
    ZMSearchBarController* searchVC = [[ZMSearchBarController alloc]init];;
    [self.navigationController pushViewController:searchVC animated:YES];
}
-(instancetype)init{
    if (self = [super init]) {
        [self defaultConfig];
    }
    return self;
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
    return 2;
}
-(NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return 2;
}
-(NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index{
    if (index == 0) {
        return @"攻略";
    }else{
        return @"单品";
    }
}
-(UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    return [[CategoryChildController alloc]init];
}





@end
