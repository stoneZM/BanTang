//
//  HomeDetailModel.h
//  BanTang
//
//  Created by stone on 2016/10/24.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseModel.h"

@class HomeDetailDataModel,HomeDataColumModel,HomeDataItemAdMonitorsModel;

@interface HomeDetailModel : BaseModel

@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) HomeDetailDataModel *data;
@property (nonatomic, assign) double code;
@end

@interface HomeDetailDataModel : BaseModel
@property (nonatomic, strong) NSString *columnBottom;
@property (nonatomic, assign) double createdAt;
@property (nonatomic, assign) double publishedAt;
@property (nonatomic, assign) double dataIdentifier;
@property (nonatomic, assign) id coverAnimatedWebpUrl;
@property (nonatomic, assign) double editorId;
@property (nonatomic, assign) double contentType;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) double approvedAt;
@property (nonatomic, assign) double sharesCount;
@property (nonatomic, strong) NSString *coverImageUrl;
@property (nonatomic, strong) NSString *template;
@property (nonatomic, strong) NSString *coverWebpUrl;
@property (nonatomic, strong) NSString *contentHtml;
@property (nonatomic, strong) NSString *shareMsg;
@property (nonatomic, strong) NSArray *labelIds;
@property (nonatomic, assign) double commentsCount;
@property (nonatomic, strong) NSString *contentUrl;
@property (nonatomic, strong) NSString *columnHeader;
@property (nonatomic, assign) BOOL liked;
@property (nonatomic, strong) HomeDataColumModel *column;
@property (nonatomic, assign) id limitEndAt;
@property (nonatomic, strong) NSString *introduction;
@property (nonatomic, strong) NSArray *featureList;
@property (nonatomic, assign) double status;
@property (nonatomic, assign) id content;
@property (nonatomic, strong) NSString *shortTitle;
@property (nonatomic, assign) double updatedAt;
@property (nonatomic, assign) double likesCount;
@property (nonatomic, strong) HomeDataItemAdMonitorsModel *itemAdMonitors;
@property (nonatomic, assign) double mediaType;
@property (nonatomic, assign) id adMonitors;
@property (nonatomic, strong) NSString *title;
@end

@interface HomeDataColumModel : BaseModel
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

@interface  HomeDataItemAdMonitorsModel: BaseModel

@end




