//
//  HomeViewModel.h
//  BanTang
//
//  Created by stone on 2016/10/23.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseViewModel.h"
#import "HomeModel.h"
#import "HomeNetwork.h"

@interface HomeViewModel : BaseViewModel

@property (nonatomic,assign)HomeType type;



-(instancetype)initWithHomeType:(HomeType)type;

-(HomeDataItemModel*)itemModelForRow:(NSInteger)row;

//获取下一页所url中所需的id 
-(NSString*)getidForRow:(NSInteger)row;



@end
