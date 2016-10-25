//
//  SecondViewController.h
//  BanTang
//
//  Created by stone on 2016/10/24.
//  Copyright © 2016年 zm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsDetailModel.h"
@interface GoodViewController : UITableViewController

@property (nonatomic,strong)GoodsDetailDataModel* model;

-(instancetype)initWithModel:(GoodsDetailDataModel*)model;

@end
