//
//  TopModel.h
//  BanTang
//
//  Created by stone on 2016/10/23.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseModel.h"
@class TopDataModel , TopDataPageModel , TopDataItemModel;
@interface TopModel : BaseModel
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) TopDataModel *data;
@property (nonatomic, assign) double code;
@end

@interface TopDataModel : BaseModel
@property (nonatomic, strong) NSString *coverImage;
@property (nonatomic, strong) NSString *shareUrl;
@property (nonatomic, strong) NSString *coverWebp;
@property (nonatomic, strong) NSString *coverUrl;
@property (nonatomic, strong) NSArray<TopDataItemModel*> *items;
@property (nonatomic, strong) TopDataPageModel *paging;
@end

@interface TopDataItemModel : BaseModel
@property (nonatomic, strong) NSString *coverImageUrl;
@property (nonatomic, assign) double editorId;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) id adMonitors;
@property (nonatomic, strong) NSString *purchaseUrl;
@property (nonatomic, assign) double updatedAt;
@property (nonatomic, strong) NSArray *imageUrls;
@property (nonatomic, assign) double purchaseType;
@property (nonatomic, strong) NSString *keywords;
@property (nonatomic, assign) id brandId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double purchaseStatus;
@property (nonatomic, strong) NSArray *postIds;
@property (nonatomic, assign) double itemsIdentifier;
@property (nonatomic, assign) double favoritesCount;
@property (nonatomic, strong) NSString *shortDescription;
@property (nonatomic, strong) NSString *purchaseShopId;
@property (nonatomic, strong) NSString *purchaseId;
@property (nonatomic, assign) id brandOrder;
@property (nonatomic, assign) double subcategoryId;
@property (nonatomic, assign) double createdAt;
@property (nonatomic, assign) double order;
@property (nonatomic, assign) double categoryId;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *coverWebpUrl;
@property (nonatomic, strong) NSString *itemsDescription;
@end


@interface TopDataPageModel : BaseModel
@property (nonatomic, strong) NSString *nextUrl;
@end

