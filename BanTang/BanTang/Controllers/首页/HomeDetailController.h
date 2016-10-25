//
//  HomeDetailController.h
//  BanTang
//
//  Created by stone on 2016/10/24.
//  Copyright © 2016年 zm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeDetailController : UIViewController

@property (nonatomic,strong)NSString* pathId;

-(instancetype)initWithPathId:(NSString*)pathId;
@end
