//
//  HomeCell.m
//  BanTang
//
//  Created by stone on 2016/10/22.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "HomeCell.h"
#import <SDWebImageManager.h>
@interface HomeCell()

@property (weak, nonatomic) IBOutlet UIImageView *coverIv;
@property (weak, nonatomic) IBOutlet UILabel *contentLb;
@property (weak, nonatomic) IBOutlet UILabel *introducLb;
@property (weak, nonatomic) IBOutlet UILabel *columLb;
@property (weak, nonatomic) IBOutlet UILabel *likedCount;

@end

@implementation HomeCell

-(void)setModel:(HomeDataItemModel *)model{
 
    [self.coverIv sd_setImageWithURL:[NSURL URLWithString:model.coverImageUrl]];
    self.introducLb.text = model.introduction;
    self.contentLb.text = model.title;
    self.columLb.text = model.column.title;
    self.likedCount.text = [NSString stringWithFormat:@"%ld",(NSInteger)model.likesCount];
    
}

@end
