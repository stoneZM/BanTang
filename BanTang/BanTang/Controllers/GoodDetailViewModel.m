//
//  GoodDetailViewModel.m
//  BanTang
//
//  Created by stone on 2016/10/24.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "GoodDetailViewModel.h"

@implementation GoodDetailViewModel

{
    GoodsDetailModel* _model;
}

-(instancetype)initWithPathId:(NSString *)pageId{
    if (self = [super init]) {
        self.pathId = pageId;
    }
    return self;
}


-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
        [HomeNetwork getNextDetailWithURLId:self.pathId completeHandle:^(id responseObj, NSError *error) {
            _model = responseObj;
            completionHandle(error);
        }];
}


-(NSString*)getDetailHtml{
    return _model.data.detailHtml;
}

-(NSString *)getDesc{
    return _model.data.dataDescription;
}
-(NSArray *)getImageURLs{
    return _model.data.imageUrls;
}

-(GoodsDetailDataModel *)getDataModel{
    return _model.data;
}
-(NSString *)getGoodSecurtURL{
    return _model.data.authentic.url;
}
-(NSString *)getGoodSecurtDesc{
    return _model.data.authentic.desc;
}

-(void)dealloc{
    ZMLogfunc;
}

@end
