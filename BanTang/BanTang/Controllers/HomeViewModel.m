//
//  HomeViewModel.m
//  BanTang
//
//  Created by stone on 2016/10/23.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "HomeViewModel.h"

@implementation HomeViewModel
{
    NSInteger _offSet;
}

-(instancetype)initWithHomeType:(HomeType)type{
    if (self = [super init]) {
        self.type = type;
    }
    return self;
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    [HomeNetwork getHomeModelWithType:self.type  offset:_offSet completeHandle:^(id responseObj, NSError *error) {
        HomeModel* model = (HomeModel*)responseObj;
        //如果_offSet==0代表是刷新数据，此时应移除所有缓存数据，并判断是否有错误，无错误的话就进行本地存储。保证存储的都是最新的20条数据
        if (_offSet == 0) {
            if (!error) {
                     [self.dataArr removeAllObjects];
                     [self archiveObjc:model setupAllowedPropertyNames:@[@"data"] identifier:[NSString stringWithFormat:@"%ld",self.type]];
                 }
             }
              [self.dataArr addObjectsFromArray:model.data.items];
              completionHandle(error);
    }];
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

-(HomeDataItemModel *)itemModelForRow:(NSInteger)row{
    return self.dataArr[row];
}
//获取磁盘缓存的数据
-(void)getCacheDataCompletionHandle:(void (^)(BOOL))completionhandle{
     [self decodeObjForClassName:@"HomeModel"
                      identifier:[NSString stringWithFormat:@"%ld",self.type]
                  completeHandle:^(id responObj, BOOL isSuccess) {

             HomeModel* model = (HomeModel*)responObj;
             NSLog(@"-------%ld-------",model.data.items.count);
             [self.dataArr addObjectsFromArray:model.data.items];
             completionhandle(isSuccess);
     }];
}

//获取下一页所url中所需的id
-(NSString*)getidForRow:(NSInteger)row{
    HomeDataItemModel* model = self.dataArr[row];
    long pathID = model.pathid;
    return [NSString stringWithFormat:@"%ld",pathID];
}


@end
