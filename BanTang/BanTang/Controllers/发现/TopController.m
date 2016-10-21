//
//  FindController.m
//  BanTang
//
//  Created by stone on 2016/10/20.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "TopController.h"

@interface TopController ()

@end

@implementation TopController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.view.backgroundColor = [UIColor whiteColor];
    [self setNavi];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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


@end
