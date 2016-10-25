//
//  HomeNetwork.m
//  BanTang
//
//  Created by stone on 2016/10/22.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "HomeNetwork.h"

@implementation HomeNetwork

+(id)getHomeModelWithType:(HomeType)type
                   offset:(NSInteger)offset
           completeHandle:(void (^)(id, NSError *))completeHandle{

    NSString* path = [NSString stringWithFormat:@"http://api.liwushuo.com/v2/channels/%ld/items_v2?gender=1&generation=1&limit=20&offset=%ld",type,offset];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([HomeModel mj_objectWithKeyValues:responseObj],error);
    }];
}

//获取表头的滚动视图
+(id)getHeadImageModelCompleteHandle:(void(^)(id responseObj,NSError* error))completeHandle{
    NSString* path = @"http://api.liwushuo.com/v2/banners?channel=iOS";
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
         completeHandle([HeadImageModel mj_objectWithKeyValues:responseObj],error);
    }];
}

//获取每一个单元的详情页
+(id)getDetailWithUr:(NSString*)url completeHandle:(void(^)(id responseObj,NSError* error))completeHandle{
    NSString* base = @"http://api.liwushuo.com/v2/posts_v2/";
    NSString* path = [NSString stringWithFormat:@"%@%@",base,url];
  return  [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([HomeDetailModel mj_objectWithKeyValues:responseObj],error);
    }];
}

//获取下一级的详情
+(id)getNextDetailWithURLId:(NSString*)urlID completeHandle:(void(^)(id responseObj,NSError* error))completeHandle{
    NSString* base = @"http://www.liwushuo.com/v2/items/";
    NSString* path = [NSString stringWithFormat:@"%@%@?",base,urlID];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([GoodsDetailModel mj_objectWithKeyValues:responseObj],error);
    }];
}


@end
