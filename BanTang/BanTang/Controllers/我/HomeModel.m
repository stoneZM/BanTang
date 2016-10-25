//
//  HomeModel.m
//  BanTang
//
//  Created by stone on 2016/10/22.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel

@end

@implementation HomeDataModel

+(NSDictionary*)mj_objectClassInArray{
    return @{@"items":[HomeDataItemModel class]};
}

@end

@implementation HomeDataPageModel

@end

@implementation HomeDataItemModel
+(NSDictionary*)mj_replacedKeyFromPropertyName{
    return @{@"pathid":@"id"};
}

@end

@implementation HomeDataItemColumModel

@end

@implementation HomeDataItemAuthorModel

@end
