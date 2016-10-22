//
//  MainViewController.m
//  BanTang
//
//  Created by stone on 2016/10/20.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "MainViewController.h"
#import "HomeController.h"
#import "TopController.h"
#import "CategoryController.h"
#import "MeController.h"
#import "ComstomNaviController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildVcs];
    [self setTabrBarTitleAttr];
}


/*
 * 添加子控制器
 */
-(void)addChildVcs{

    [self addChildViewController:[self setChildVCWithController:[[HomeController alloc]init] tabBarImage:@"tab_icon_home_default" tabBarSelectedImage:@"tab_icon_home_Select" title:@"首页"]];
    [self addChildViewController:[self setChildVCWithController:[[TopController alloc]init] tabBarImage:@"tab_btn_list_default" tabBarSelectedImage:@"tab_btn_list_select" title:@"榜单"]];
    [self addChildViewController:[self setChildVCWithController:[[CategoryController alloc]init] tabBarImage:@"tab_btn_sort_default" tabBarSelectedImage:@"tab_btn_sort_select"title:@"分类"]];
    [self addChildViewController:[self setChildVCWithController:[[MeController alloc]init] tabBarImage:@"tab_btn_mine_default" tabBarSelectedImage:@"tab_btn_mine_select" title:@"我"]];
 
}
/*
 *初始化控制器
 */
-(UINavigationController*)setChildVCWithController:(UIViewController*)vc tabBarImage:(NSString*)imageName tabBarSelectedImage:(NSString*)selectedImageName title:(NSString*)title{
    
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    vc.tabBarItem.title = title;
    ComstomNaviController* navi = [[ComstomNaviController alloc]initWithRootViewController:vc];
    return navi;
}

/*
 *设置tabbar的文字属性
 */
-(void)setTabrBarTitleAttr{
    NSMutableDictionary* attr = [[NSMutableDictionary alloc]init];
    attr[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.67 green:0.60 blue:0.60 alpha:1.00];
    NSMutableDictionary* selectedAttr = [[NSMutableDictionary alloc]init];
    selectedAttr[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.96 green:0.15 blue:0.27 alpha:1.00];
    [[UITabBarItem appearance] setTitleTextAttributes:attr forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:selectedAttr forState:UIControlStateSelected];
}

@end
