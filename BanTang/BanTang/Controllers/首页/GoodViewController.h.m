//
//  SecondViewController.m
//  BanTang
//
//  Created by stone on 2016/10/24.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "GoodViewController.h"
#import "HomeNetwork.h"
#import "HeadScrollView.h"
#import "GoodDetailCell.h"
#import "GoodSecurityController.h"
@interface GoodViewController ()
@property (nonatomic,strong)HeadScrollView* headView;
@end

@implementation GoodViewController

-(HeadScrollView *)headView{
    if (_headView == nil) {
        _headView = [[HeadScrollView alloc]init];
    }
    return _headView;
}

-(instancetype)initWithModel:(GoodsDetailDataModel *)model{
    if (self = [super init]) {
        self.model = model;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addHeaderView];
    [self defaultConfig];
}

-(void)addHeaderView{
    self.tableView.tableHeaderView = self.headView;
    self.tableView.tableHeaderView.height = GOODSCROLLIVH;
    self.headView.images = [self.model.imageUrls copy];
}
-(void)defaultConfig{
    self.automaticallyAdjustsScrollViewInsets = NO;
}
#pragma mark - UITableViewDataSouce
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
    GoodDetailCell* cell = [[NSBundle mainBundle]loadNibNamed:@"GoodDetailCell" owner:self options:nil].firstObject;
        cell.model = self.model;
         return cell;
    }else{
        UITableViewCell* cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = self.model.authentic.desc;
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 200;
    }else{
        return 44;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        GoodSecurityController* vc = [[GoodSecurityController alloc]initWithUrl:self.model.authentic.url];        [self.navigationController pushViewController:vc animated:YES];
    }
}

-(void)dealloc{
    ZMLogfunc;
}


@end
