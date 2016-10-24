//
//  HomeController.m
//  BanTang
//
//  Created by stone on 2016/10/20.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "HomeController.h"
#import "HomeChildController.h"
#import "SearchBarBtn.h"
#import "ZMSearchBarController.h"
@interface HomeController ()
@property (nonatomic,strong)NSArray* titleArr;
@property (nonatomic,strong)NSArray* types;
@property (nonatomic,strong)NSArray* menuWidths;
@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = VIEWBGCOLOR;
    [self setNavi];
}
-(void)setNavi{
    UIImageView* leftImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"jingxuan_navi_left"]];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftImageView];
    UIButton* rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn addTarget:self action:@selector(rightBtn) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"guide_btn_remind"] forState:UIControlStateNormal];
    [rightBtn sizeToFit];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    SearchBarBtn* searchBtn = [[SearchBarBtn alloc]init];
    [searchBtn addTarget:self action:@selector(popSearchVC) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = searchBtn;
    searchBtn.frame = CGRectMake(0, 0, 200, 20);
}

/*
 *  按钮的事件监听
 */
-(void)popSearchVC{
    ZMSearchBarController* searchVC = [[ZMSearchBarController alloc]init];;
    [self.navigationController pushViewController:searchVC animated:YES];
}
-(void)rightBtn{
    ZMLogfunc;
}
-(NSArray *)titleArr{
    if (_titleArr == nil) {
        _titleArr = @[@"精选",@"送女票",@"海涛",@"创意生活",@"科技范",@"送爸妈",@"送基友",@"送👭",@"送同事",@"送宝贝",@"设计感",@"文艺风",@"奇葩搞怪",@"萌哒哒"];
    }
    return _titleArr;
}
-(NSArray *)types{
    if (_types == nil) {
        _types = @[@100,@10,@129,@125,@28,@6,@26,@5,@17,@24,@127,@14,@126,@11];
    }
    return _types;
}
-(NSArray *)menuWidths{
    if (_menuWidths == nil) {
        _menuWidths = @[@50,@60,@50,@75,@60,@60,@60,@60,@60,@60,@60,@60,@60,@75,@60];
    }
    return _menuWidths;
}
-(instancetype)init{
    if (self = [super init]) {
        [self defaultConfig];
    }
    return self;
}
#pragma mark 菜单栏的基础配置
-(void)defaultConfig{
    self.menuBGColor = [UIColor clearColor];
    self.menuViewLayoutMode = WMMenuViewLayoutModeLeft;
    [self setMenuViewStyle:WMMenuViewStyleLine];
    self.titleColorNormal = MenuItemTitleColor;
    self.titleColorSelected = [UIColor redColor];
    self.menuItemWidth = ZMSCREENW * 0.25;
    self.titleSizeNormal = MenuItemFontSize;
    self.titleSizeSelected = MenuItemSelectedFontSize;
    self.progressViewWidths = @[@35,@50,@35,@70,@50,@50,@50,@50,@50,@50,@50,@50,@50,@70,@50];
    self.bounces = YES;
    self.speedFactor = 5;
    self.menuView.delegate = self;
}

#pragma mark - WMMenuDelegate
-(CGFloat)menuView:(WMMenuView *)menu widthForItemAtIndex:(NSInteger)index{
    return [self.menuWidths[index] integerValue];
}

#pragma mark - WMPageControllerDelegate
-(NSInteger)numbersOfTitlesInMenuView:(WMMenuView *)menu{
    return self.titleArr.count;
}
-(NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return self.titleArr.count;
}
-(NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index{
    return  self.titleArr[index];
}
-(UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    HomeChildController* vc = [[HomeChildController alloc]init];
    vc.type = [self.types[index] integerValue];
    return vc;
}





@end
