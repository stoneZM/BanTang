//
//  HomeModel.h
//  BanTang
//
//  Created by stone on 2016/10/22.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseModel.h"

@class HomeDataModel,HomeDataPageModel,
       HomeDataItemModel,HomeDataItemColumModel,
       HomeDataItemAuthorModel;

@interface HomeModel : BaseModel

@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) HomeDataModel *data;
@property (nonatomic, assign) double code;

@end

@interface HomeDataModel : BaseModel
@property (nonatomic, strong) NSArray<HomeDataItemModel*> *items;
@property (nonatomic, strong) HomeDataPageModel *paging;
@end

@interface HomeDataItemModel : BaseModel

@property (nonatomic, strong) HomeDataItemColumModel *column;
@property (nonatomic, strong) NSArray *labels;
@property (nonatomic, assign) double mediaType;
@property (nonatomic, assign) BOOL liked;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double editorId;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSArray *adMonitors;
@property (nonatomic, assign) double status;
@property (nonatomic, assign) double publishedAt;
@property (nonatomic, assign) id coverAnimatedWebpUrl;
@property (nonatomic, assign) double updatedAt;
@property (nonatomic, strong) NSString *coverImageUrl;
@property (nonatomic, assign) double approvedAt;
@property (nonatomic, assign) id limitEndAt;
@property (nonatomic, strong) NSString *template;
@property (nonatomic, assign) BOOL hiddenCoverImage;
@property (nonatomic, strong) NSArray *featureList;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, assign) double itemsIdentifier;
@property (nonatomic, assign) double contentType;
@property (nonatomic, strong) NSString *contentUrl;
@property (nonatomic, strong) NSString *shareMsg;
@property (nonatomic, assign) double likesCount;
@property (nonatomic, strong) NSString *introduction;
@property (nonatomic, assign) double createdAt;
@property (nonatomic, strong) NSString *shortTitle;
@property (nonatomic, strong) HomeDataItemAuthorModel *author;
@property (nonatomic, strong) NSString *coverWebpUrl;
@property (nonatomic, assign) long  pathid;
@end

@interface HomeDataPageModel : BaseModel
@property (nonatomic, strong) NSString *nextUrl;
@end

@interface HomeDataItemColumModel : BaseModel
@property (nonatomic, assign) double columnIdentifier;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *columnDescription;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *coverImageUrl;
@property (nonatomic, strong) NSString *bannerImageUrl;
@property (nonatomic, assign) double createdAt;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double postPublishedAt;
@property (nonatomic, assign) double order;
@property (nonatomic, assign) double updatedAt;
@property (nonatomic, assign) double status;
@end

@interface HomeDataItemAuthorModel : BaseModel
@property (nonatomic, assign) double authorIdentifier;
@property (nonatomic, strong) NSString *introduction;
@property (nonatomic, strong) NSString *avatarUrl;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, assign) id avatarWebpUrl;
@property (nonatomic, assign) double createdAt;
@end


