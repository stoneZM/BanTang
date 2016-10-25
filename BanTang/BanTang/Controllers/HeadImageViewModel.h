//
//  HeadImageViewModel.h
//  BanTang
//
//  Created by stone on 2016/10/23.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseViewModel.h"
#import "HeadImageModel.h"
#import "HomeNetwork.h"
@interface HeadImageViewModel : BaseViewModel

@property (nonatomic,strong)HeadImageDataModel* model;

//获取轮换图片
-(NSMutableArray*)getImages;

@end
