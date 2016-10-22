//
//  FindController.m
//  BanTang
//
//  Created by stone on 2016/10/20.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "TopController.h"
#import "BangDanController.h"
@interface TopController ()
@property (nonatomic,strong)NSArray* titleArr;
@end

@implementation TopController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHex:0xFAF5f5 andAlpha:1];
    [self setNavi];

}
-(NSArray *)titleArr{
    if (_titleArr == nil) {
        _titleArr = @[@"每日推荐",@"TOP100",@"独立原创榜",@"星星榜"];
    }
    return _titleArr;
}
-(instancetype)init{
    if (self = [super init]) {
        [self defaultConfig];
    }
    return self;
}
-(void)defaultConfig{
    self.menuBGColor = [UIColor clearColor];
    [self setMenuViewStyle:WMMenuViewStyleLine];
    self.titleColorNormal = MenuItemTitleColor;
    self.titleColorSelected = [UIColor redColor];
    self.menuItemWidth = ZMSCREENW * 0.25;
    self.titleSizeNormal = 13;
    self.titleSizeSelected = 14;
    self.progressViewWidths = @[@55,@45,@65,@45];
    self.bounces = YES;
    self.speedFactor = 5;
}
-(void)setNavi{
    self.navigationItem.title = @"礼物榜";
    UIButton* shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"toolbar_btn_share"] forState:UIControlStateNormal];
    [shareBtn sizeToFit];
    [shareBtn addTarget:self action:@selector(shareAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:shareBtn];
}
-(void)shareAction{
    
}
#pragma mark - WMPageControllerDelegate
-(NSInteger)numbersOfTitlesInMenuView:(WMMenuView *)menu{
    return 4;
}
-(NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return 4;
}
-(NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index{
   return  self.titleArr[index];
}
-(UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    return [[BangDanController alloc]init];
}



@end
