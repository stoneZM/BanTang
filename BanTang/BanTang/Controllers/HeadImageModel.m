//
//  HeadImageModel.m
//  BanTang
//
//  Created by stone on 2016/10/23.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "HeadImageModel.h"

@implementation HeadImageModel

@end

@implementation HeadImageDataModel

+(NSDictionary *)mj_objectClassInArray{
    return @{@"banners":[HeadImageDataBannerModel class]};
}

@end

@implementation HeadImageDataBannerModel

@end
@implementation HeadImageDataBannerTargetModel

@end

