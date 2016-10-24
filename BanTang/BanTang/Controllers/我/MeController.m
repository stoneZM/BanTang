//
//  MeControllerController.m
//  BanTang
//
//  Created by stone on 2016/10/20.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "MeController.h"
#import "HeaderView.h"

@interface MeController ()
@property (nonatomic,strong)HeaderView* hearderView;
@end

@implementation MeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self defaultConfig];
    [self addBtnToNavi];
    [self addChildVc];
}
-(void)defaultConfig{
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController.navigationBar lt_reset];
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    HeaderView* headerView = [[NSBundle mainBundle]loadNibNamed:@"HeaderView" owner:self options:nil].firstObject;
    self.hearderView = headerView;
    headerView.height = ZMSCREENH*0.4;
    self.tableView.tableHeaderView = headerView;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
-(void)addBtnToNavi{
    UIBarButtonItem* fixBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixBtn.width = -10;
    UIBarButtonItem* msgBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_signin_white"] style:UIBarButtonItemStylePlain target:self action:@selector(msgBtn)];
    UIBarButtonItem* signBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_signin_white"] style:UIBarButtonItemStylePlain target:self action:@selector(signBtn)];
    self.navigationItem.leftBarButtonItems = @[fixBtn,msgBtn,signBtn];

    UIBarButtonItem* scanBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"me_scan"] style:UIBarButtonItemStylePlain target:self action:@selector(scanBtn)];
    UIBarButtonItem* setBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"iconSettings"] style:UIBarButtonItemStylePlain target:self action:@selector(setBtn)];
    self.navigationItem.rightBarButtonItems = @[fixBtn,scanBtn,setBtn];
}
-(void)addChildVc{

}

-(void)msgBtn{
    ZMLogfunc;
}
-(void)signBtn{
    ZMLogfunc;
}
-(void)scanBtn{
    ZMLogfunc;
}
-(void)setBtn{
    ZMLogfunc;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 30;
//}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    self.hearderView.tableViewOffset = offsetY;
}


@end
