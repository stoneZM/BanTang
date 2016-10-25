//
//  GoodDetailCell.m
//  BanTang
//
//  Created by stone on 2016/10/25.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "GoodDetailCell.h"

@interface GoodDetailCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UILabel *priceLb;
@property (weak, nonatomic) IBOutlet UILabel *likesLb;
@property (weak, nonatomic) IBOutlet UILabel *descLb;

@end


@implementation GoodDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
-(void)setModel:(GoodsDetailDataModel *)model{
    self.titleLb.text = model.name;
    CGFloat price = [model.price floatValue];
    self.priceLb.text = [NSString stringWithFormat:@"￥%.0lf",price];
    self.likesLb.text = [NSString stringWithFormat:@"%.0lf",model.likesCount];
    self.descLb.text = model.desc;
}


@end
