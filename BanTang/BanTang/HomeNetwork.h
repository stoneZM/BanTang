//
//  HomeNetwork.h
//  BanTang
//
//  Created by stone on 2016/10/22.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseNetManager.h"
#import "HomeModel.h"
#import "HeadImageModel.h"
typedef NS_ENUM(NSInteger,HomeType){

    HomeTypeJingXuan = 100,
    HomeTypeSongNvPiao = 10,
    HomeTypeHaiTao = 129,
    HomeTypeCysh = 125,
    HomeTypeKJF = 28,
    HomeTypeSBM = 6,
    HomeTypeSJY = 26,
    HomeTypeSGM = 5,
    HomeTypeSTS = 17,
    HomeTypeSBB = 24,
    HomeTypeSJG = 127,
    HomeTypeWYF = 14,
    HomeTypeQPGG = 126,
    HomeTypeMDD = 11
};

@interface HomeNetwork : BaseNetManager

+(id)getHomeModelWithType:(HomeType)type
                   offset:(NSInteger)offset
           completeHandle:(void(^)(id responseObj,NSError* error))completeHandle;

//获取表头的滚动视图
+(id)getHeadImageModelCompleteHandle:(void(^)(id responseObj,NSError* error))completeHandle;

@end
