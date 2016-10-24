//
//  BaseModel.m
//  BanTang
//
//  Created by stone on 2016/10/22.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
MJExtensionCodingImplementation
//驼峰转下划线
+(id)mj_replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName mj_underlineFromCamel];
}


@end
