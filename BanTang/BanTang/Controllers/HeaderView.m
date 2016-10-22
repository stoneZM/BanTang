//
//  HeaderView.m
//  BanTang
//
//  Created by stone on 2016/10/22.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "HeaderView.h"

@interface HeaderView()
@property (weak, nonatomic) IBOutlet UILabel *LoginLb;
@property (weak, nonatomic) IBOutlet UIImageView *coverIV;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *coverIvCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bgTopCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bgBottomCons;
@end

static CGFloat coverIvCons = 100;

@implementation HeaderView



-(void)setTableViewOffset:(CGFloat)tableViewOffset{
   
    //偏移量小鱼0的时候，背景图只上下拉伸
    if (tableViewOffset<0) {
        self.LoginLb.alpha = 1;
        self.bgBottomCons.constant = 60;
        self.bgTopCons.constant = tableViewOffset;
        self.coverIvCons.constant = 100;
        self.coverIV.transform = CGAffineTransformIdentity;
        return ;
    }
    //变换大小
    CGFloat rota = (1 - tableViewOffset/self.height);
    if (rota > 0.55) {
         NSLog(@"%lf",rota);
        self.LoginLb.alpha = 1-(1.0/0.4 * (1-rota));
        self.coverIV.transform = CGAffineTransformMakeScale(rota,rota);
    }
    if (rota < 0.55) {
        self.LoginLb.alpha = 0;
        self.coverIV.transform = CGAffineTransformMakeScale(0.55,0.55);
    }
    //头像的偏移
    CGFloat constant = coverIvCons - tableViewOffset;
    if (constant > -10) {
        self.coverIvCons.constant = constant;
    }
    if (tableViewOffset > self.height-60-64) {
        self.coverIvCons.constant = constant + 54;
        self.bgBottomCons.constant = constant + 64;
    }


}


@end
