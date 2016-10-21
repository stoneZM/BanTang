//
//  ComstomNaviController.m
//  BanTang
//
//  Created by stone on 2016/10/21.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "ComstomNaviController.h"

@interface ComstomNaviController ()

@end

@implementation ComstomNaviController

+(void)initialize{
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}
/**
 设置全局的导航栏返回时的按钮样式
 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{

    //只能更改push出来的leftBaritem
    if (self.childViewControllers.count > 0) { //第一个控制器不做处理
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[self naviBtn]];
        viewController.hidesBottomBarWhenPushed = YES;  //push出控制器的时候，隐藏底部
    }
    [super pushViewController:viewController animated:animated];
}

-(UIButton*)naviBtn{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"navbar_btn_back_fault"] forState:UIControlStateNormal];
    [button sizeToFit];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    return button;
}
-(void)back{
    [self popViewControllerAnimated:YES];
}

@end
