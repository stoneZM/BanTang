//
//  GoodsDetailModel.h
//  BanTang
//
//  Created by stone on 2016/10/24.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseModel.h"

@class GoodsDetailDataModel,GoodsDataSourceModel,GoodDataAuthenticModel;

@interface GoodsDetailModel : BaseModel
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) GoodsDetailDataModel *data;
@property (nonatomic, assign) double code;
@end

@interface GoodsDetailDataModel : BaseModel
@property (nonatomic, strong) GoodDataAuthenticModel *authentic;
@property (nonatomic, assign) BOOL favorited;
@property (nonatomic, assign) double purchaseStatus;
@property (nonatomic, assign) double dataIdentifier;
@property (nonatomic, assign) double createdAt;
@property (nonatomic, strong) NSString *purchaseId;
@property (nonatomic, assign) double editorId;
@property (nonatomic, strong) NSArray *imageUrls;
@property (nonatomic, strong) NSArray *webpUrls;
@property (nonatomic, assign) id rank;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *purchaseUrl;
@property (nonatomic, assign) double favoritesCount;
@property (nonatomic, strong) NSString *dataDescription;
@property (nonatomic, strong) NSString* desc;
@property (nonatomic, assign) id brandId;
@property (nonatomic, strong) NSString *detailHtml;
@property (nonatomic, strong) NSString *coverImageUrl;
@property (nonatomic, assign) double sharesCount;
@property (nonatomic, strong) NSArray *postIds;
@property (nonatomic, strong) NSString *coverWebpUrl;
@property (nonatomic, assign) double commentsCount;
@property (nonatomic, assign) BOOL liked;
@property (nonatomic, strong) GoodsDataSourceModel *source;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) id subcategoryId;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, assign) double purchaseType;
@property (nonatomic, strong) NSString *purchaseShopId;
@property (nonatomic, assign) id brandOrder;
@property (nonatomic, assign) double updatedAt;
@property (nonatomic, strong) NSString *keywords;
@property (nonatomic, assign) double likesCount;
@property (nonatomic, assign) id categoryId;
@property (nonatomic, strong) NSString *shortDescription;
@property (nonatomic, assign) id adMonitors;
@end

@interface GoodDataAuthenticModel : BaseModel
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *url;
@end


@interface GoodsDataSourceModel : BaseModel
@property (nonatomic, strong) NSString *pageTitle;
@property (nonatomic, strong) NSString *buttonTitle;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *type;
@end

