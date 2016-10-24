//
//  TopCell.m
//  BanTang
//
//  Created by stone on 2016/10/23.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "TopCell.h"

@interface TopCell()
@property (weak, nonatomic) IBOutlet UIImageView *coverIV;
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UILabel *contentLb;
@property (weak, nonatomic) IBOutlet UILabel *priceLb;

@end


@implementation TopCell


-(void)setTopModel:(TopDataItemModel *)topModel{
    [self.coverIV sd_setImageWithURL:[NSURL URLWithString:topModel.coverImageUrl]];
    self.titleLb.text = topModel.name;
    self.contentLb.text = topModel.shortDescription;
    self.priceLb.text = [NSString stringWithFormat:@"￥%@",topModel.price];
}

@end
