//
//  HomeController.m
//  BanTang
//
//  Created by stone on 2016/10/20.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "HomeController.h"
#import "TestViewController.h"
@interface HomeController ()
@property (nonatomic,strong)UIView* myview;
@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavi];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    TestViewController* vc = [[TestViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)setNavi{
    UIImageView* leftImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"jingxuan_navi_left"]];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftImageView];
    UIButton* rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn addTarget:self action:@selector(rightBtn) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"guide_btn_remind"] forState:UIControlStateNormal];
    [rightBtn sizeToFit];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
}
-(void)rightBtn{
    ZMLogfunc;
}


@end
