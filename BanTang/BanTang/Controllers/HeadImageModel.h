//
//  HeadImageModel.h
//  BanTang
//
//  Created by stone on 2016/10/23.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseModel.h"

@class HeadImageDataModel,HeadImageDataBannerModel,HeadImageDataBannerTargetModel;

@interface HeadImageModel : BaseModel
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) HeadImageDataModel *data;
@property (nonatomic, assign) double code;
@end

@interface HeadImageDataModel : BaseModel
@property (nonatomic, strong) NSArray<HeadImageDataBannerModel*> *banners;
@end

@interface HeadImageDataBannerModel : BaseModel
@property (nonatomic, assign) double bannersIdentifier;
@property (nonatomic, strong) NSArray *adMonitors;
@property (nonatomic, strong) NSString *channel;
@property (nonatomic, strong) NSString *webpUrl;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, assign) id targetId;
@property (nonatomic, assign) double order;
@property (nonatomic, strong) NSString *targetType;
@property (nonatomic, strong) HeadImageDataBannerTargetModel *target;
@property (nonatomic, assign) double status;
@property (nonatomic, strong) NSString *targetUrl;
@end

@interface HeadImageDataBannerTargetModel : BaseModel
@property (nonatomic, assign) double status;
@property (nonatomic, strong) NSString *bannerImageUrl;
@property (nonatomic, strong) NSString *coverWebpUrl;
@property (nonatomic, assign) double targetIdentifier;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double createdAt;
@property (nonatomic, strong) NSString *bannerWebpUrl;
@property (nonatomic, strong) NSString *coverImageUrl;
@property (nonatomic, assign) double updatedAt;
@property (nonatomic, assign) double postsCount;
@end

