//
//  ComstomNaviController.m
//  BanTang
//
//  Created by stone on 2016/10/21.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "ComstomNaviController.h"

@interface ComstomNaviController ()<UIGestureRecognizerDelegate>

@end

@implementation ComstomNaviController

+(void)initialize{
    [[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //去掉导航栏的分割线
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //重新设置代理，恢复系统的边缘滑动推出手势
    self.interactivePopGestureRecognizer.delegate = self;
}
//第一个控制器不支持手势
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{

    return self.childViewControllers.count > 1;
}

/**
 设置全局的导航栏返回时的按钮样式
 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{

    //只能更改push出来的leftBaritem
    if (self.childViewControllers.count > 0) { //第一个控制器不做处理
        UIBarButtonItem* fixItem = [[UIBarButtonItem alloc]
                                    initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                    target:nil
                                    action:nil];
         fixItem.width = -15;
        UIBarButtonItem* backBtn = [[UIBarButtonItem alloc]initWithCustomView:[self naviBtn]];
        viewController.navigationItem.leftBarButtonItems = @[fixItem,backBtn];
        viewController.hidesBottomBarWhenPushed = YES;  //push出控制器的时候，隐藏底部
    }
    [super pushViewController:viewController animated:animated];
}

-(UIButton*)naviBtn{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"public_back_btn"] forState:UIControlStateNormal];
    [button sizeToFit];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    return button;
}
-(void)back{
    ZMLogfunc;
    [self popViewControllerAnimated:YES];
}

@end
