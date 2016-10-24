//
//  TopNetwork.h
//  BanTang
//
//  Created by stone on 2016/10/23.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseNetManager.h"

typedef NS_ENUM(NSInteger,TopType){
    TopTypeMRTJ = 1,
    TopTypeTop100 = 2,
    TopTypeDLYCB = 3,
    TopTypeXXB = 4
};

@interface TopNetwork : BaseNetManager

+(id)getTopModelWithType:(TopType)type
                    offset:(NSInteger)offset
            completeHandle:(void(^)(id responseObj,NSError* error))completeHandle;


@end
