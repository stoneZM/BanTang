//
//  ScrollImageView.h
//  BanTang
//
//  Created by stone on 2016/10/23.
//  Copyright © 2016年 zm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
#import "HeadImageModel.h"
@interface HeadScrollView : UIView

@property (nonatomic,strong)HeadImageDataModel* model;

-(instancetype)initHeaderView;

@end
