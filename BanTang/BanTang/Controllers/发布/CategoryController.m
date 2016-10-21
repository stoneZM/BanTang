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
@interface CategoryController ()

@end

@implementation CategoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addSearchBtnToView];
}

-(void)addSearchBtnToView{
    SearchBarBtn* bar = [[SearchBarBtn alloc]init];
    [self.view addSubview:bar];
    [bar addTarget:self action:@selector(popSearchVC) forControlEvents:UIControlEventTouchUpInside];
    bar.frame = CGRectMake(0, 64,300, 30);
}
-(void)popSearchVC{
    ZMSearchBarController* searchVC = [[ZMSearchBarController alloc]init];;
    [self.navigationController pushViewController:searchVC animated:YES];
}




@end
