//
//  CustomFlowLayout.m
//  BanTang
//
//  Created by stone on 2016/10/23.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "CustomFlowLayout.h"

#define EDGEMARGIN 10
#define ITEMSPACE 10


@implementation CustomFlowLayout

-(instancetype)init{
    if (self = [super init]) {
        CGFloat width = (ZMSCREENW - 2*EDGEMARGIN -ITEMSPACE) * 0.5;
        CGFloat height = width * 1.5;
        self.itemSize = CGSizeMake(width, height);
        self.minimumLineSpacing = ITEMSPACE;
        self.minimumInteritemSpacing = ITEMSPACE;
        self.sectionInset = UIEdgeInsetsMake(EDGEMARGIN, EDGEMARGIN, 0, EDGEMARGIN);
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        //设置colloctionView头部视图的大小
        self.headerReferenceSize = CGSizeMake(ZMSCREENW, HEADERSCROLLVIEWH);
    }
    return self;
}

@end
