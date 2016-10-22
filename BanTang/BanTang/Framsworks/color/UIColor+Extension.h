//
//  UIColor+Extension.h
//  我的微信
//
//  Created by Mac on 16/4/21.
//  Copyright © 2016年 zm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

+(UIColor*)colorWith255Red:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue alpha:(CGFloat)alpha;

+(UIColor*)colorWithHex:(long)hex andAlpha:(CGFloat)alpha;

@end
