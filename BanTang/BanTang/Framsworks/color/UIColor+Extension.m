//
//  UIColor+Extension.m
//  我的微信
//
//  Created by Mac on 16/4/21.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)
//给一个十进制数直接返回一个颜色
+(UIColor *)colorWith255Red:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue alpha:(CGFloat)alpha
{

    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];

}
// 给一个十六进制的数直接转化成颜色
+(UIColor *)colorWithHex:(long)hex andAlpha:(CGFloat)alpha
{
  //hex为十六进制数 0x3A5B6C
    float red = ((float)(hex & 0xFF0000))/255.0;
    float green = ((float)(hex & 0xFF00))/255.0;
    float blue = ((float)(hex & 0xFF))/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];

}


@end
