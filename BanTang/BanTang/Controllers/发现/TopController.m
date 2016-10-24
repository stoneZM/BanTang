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
    [self setNavi];
    self.view.backgroundColor = VIEWBGCOLOR;

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
    self.titleSizeNormal = MenuItemFontSize;
    self.titleSizeSelected = MenuItemSelectedFontSize;
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
   BangDanController* vc = [[BangDanController alloc]init];
    vc.type = index+1;
    return vc;
}



@end
