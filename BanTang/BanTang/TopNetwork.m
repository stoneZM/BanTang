//
//  TopNetwork.m
//  BanTang
//
//  Created by stone on 2016/10/23.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "TopNetwork.h"
#import "TopModel.h"
@implementation TopNetwork

+(id)getTopModelWithType:(TopType)type offset:(NSInteger)offset completeHandle:(void (^)(id, NSError *))completeHandle{

    NSString* path = [NSString stringWithFormat:@"http://api.liwushuo.com/v2/ranks_v2/ranks/%ld?limit=20&offset=%ld",type,offset];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([TopModel mj_objectWithKeyValues:responseObj],error);
    }];
}

@end
