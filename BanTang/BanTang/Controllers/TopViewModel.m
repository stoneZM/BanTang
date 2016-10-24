//
//  TopViewModel.m
//  BanTang
//
//  Created by stone on 2016/10/23.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "TopViewModel.h"

@implementation TopViewModel
{
    TopModel* _model;
    NSInteger _offSet;
}

-(instancetype)initWithType:(TopType)type{
    if (self = [super init]) {
        self.type = type;
    }
    return self;
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    [TopNetwork getTopModelWithType:self.type offset:_offSet completeHandle:^(id responseObj, NSError *error) {
        _model = responseObj;
        if (_offSet == 0) {
            if (!error) {
                [self.dataArr removeAllObjects];
                [self archiveObjc:_model setupAllowedPropertyNames:@[@"data"] identifier:[NSString stringWithFormat:@"%ld",self.type]];
            }
        }
        [self.dataArr addObjectsFromArray:_model.data.items];
        completionHandle(error);
    }];
}

-(TopDataItemModel *)modelForItem:(NSInteger)item{
    return self.dataArr[item];
}

-(NSURL *)getHeaderImageUrl{
    NSString* path = _model.data.coverImage;
    return [NSURL URLWithString:path];
}
//刷新
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _offSet = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}
//获取更多数据
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _offSet += 20;
    [self getDataFromNetCompleteHandle:completionHandle];
}
//获取磁盘缓存的数据
-(void)getCacheDataCompletionHandle:(void (^)(BOOL))completionhandle{
    [self decodeObjForClassName:@"TopModel"
                     identifier:[NSString stringWithFormat:@"%ld",self.type]
                 completeHandle:^(id responObj, BOOL isSuccess) {
                     TopModel* model = (TopModel*)responObj;
                     _model = model;
                     [self.dataArr addObjectsFromArray:model.data.items];
                     completionhandle(isSuccess);
                 }];
}


@end
