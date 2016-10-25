//
//  GoodDetailViewModel.h
//  BanTang
//
//  Created by stone on 2016/10/24.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseViewModel.h"
#import "HomeNetwork.h"
#import "GoodsDetailModel.h"
@interface GoodDetailViewModel : BaseViewModel
@property (nonatomic,strong)NSString* pathId;


-(instancetype)initWithPathId:(NSString*)pageId;



-(NSString*)getDetailHtml;

-(NSString*)getDesc;

-(NSArray*)getImageURLs;

-(GoodsDetailDataModel*)getDataModel;

-(NSString*)getGoodSecurtURL;

-(NSString*)getGoodSecurtDesc;

@end
