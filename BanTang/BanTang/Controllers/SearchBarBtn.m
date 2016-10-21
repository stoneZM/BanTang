//
//  SearchBarBtn.m
//  BanTang
//
//  Created by stone on 2016/10/21.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "SearchBarBtn.h"
#import "ZMSearchBarController.h"
@implementation SearchBarBtn

//+(SearchBarBtn*)standSearchBtn{
//    static SearchBarBtn* searchBtn = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        searchBtn = [SearchBarBtn buttonWithType:UIButtonTypeCustom];
//        [searchBtn defaultConfig];
//    });
//    return searchBtn;
//}

-(instancetype)init{
    if (self = [super init]) {
        [self defaultConfig];
    }
    return self;
}

-(void)defaultConfig{
    
    [self setBackgroundImage:[UIImage imageNamed:@"search_bar_bg"] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:@"nav_bar_icon_search"] forState:UIControlStateNormal];
    [self setTitle:@"客官，来选个礼物吧" forState:UIControlStateNormal];
    [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    self.adjustsImageWhenHighlighted = NO;

}

@end
