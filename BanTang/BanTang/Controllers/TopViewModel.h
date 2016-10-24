//
//  TopViewModel.h
//  BanTang
//
//  Created by stone on 2016/10/23.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseViewModel.h"
#import "TopNetwork.h"
#import "TopModel.h"
@interface TopViewModel : BaseViewModel

@property (nonatomic,assign)TopType type;

-(instancetype)initWithType:(TopType)type;

-(TopDataItemModel*)modelForItem:(NSInteger)item;

-(NSURL*)getHeaderImageUrl;


@end
