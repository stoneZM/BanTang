//
//  HeadImageViewModel.m
//  BanTang
//
//  Created by stone on 2016/10/23.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "HeadImageViewModel.h"

@implementation HeadImageViewModel


-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    [HomeNetwork getHeadImageModelCompleteHandle:^(id responseObj, NSError *error) {
        HeadImageModel* model = responseObj;
        self.model = model.data;
        if (!error) {
         [self archiveObjc:model setupAllowedPropertyNames:@[@"data"] identifier:@""];
        }
        completionHandle(error);
    }];
}
-(void)getCacheDataCompletionHandle:(void (^)(BOOL))completionhandle{
    [self decodeObjForClassName:@"HeadImageModel"
                     identifier:@""
                 completeHandle:^(id responObj, BOOL isSuccess) {
                     HeadImageModel* model = (HeadImageModel*)responObj;
                     self.model = model.data;
                     [self getImages];
                     completionhandle(isSuccess);
                 }];
}
//获取轮换图片
-(NSMutableArray*)getImages{
    NSArray* models = self.model.banners;
    NSMutableArray* arr = [[NSMutableArray alloc]init];
    for (HeadImageDataBannerModel* model in models) {
        [arr addObject:model.imageUrl];
    }
    return arr;
}

@end
