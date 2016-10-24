//
//  ScrollImageView.m
//  BanTang
//
//  Created by stone on 2016/10/23.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "HeadScrollView.h"
#import "iCarousel.h"

@interface HeadScrollView()<iCarouselDelegate,iCarouselDataSource>

@property (nonatomic,strong)NSTimer* timer;

@end

@implementation HeadScrollView

{
    UIPageControl* _pageControl;
    iCarousel* _ic;
    NSMutableArray<HeadImageDataBannerModel*>* _modelArr;
}

#pragma mark 添加头部滚动视图
-(iCarousel *)ic{
    if (_ic == nil) {
        _ic = [iCarousel new];
        _ic.pagingEnabled = YES;
        _ic.delegate = self;
        _ic.dataSource = self;
    }
    return _ic;
}
-(UIPageControl *)pageControl{
    if (_pageControl == nil) {
        _pageControl = [UIPageControl new];
        _pageControl.enabled = NO;
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        _pageControl.pageIndicatorTintColor = [UIColor colorWithWhite:0.95 alpha:0.7];
    }
    return _pageControl;
}

-(void)setModel:(HeadImageDataModel *)model{
    if (_modelArr.count!=0) {
        return;
    }
    _modelArr = [NSMutableArray arrayWithArray:model.banners];
     self.pageControl.numberOfPages = _modelArr.count;
    NSLog(@"------%ld-----",_modelArr.count);
    [_ic reloadData];
}

/** 头部视图 */
-(instancetype)initHeaderView{
    if (self = [super init]) {
        [self addIC];
    }
    //开一个定时器，让头部视图自动滚动
    self.timer = [NSTimer scheduledTimerWithTimeInterval:SCROLLSPEED repeats:YES block:^(NSTimer * _Nonnull timer) {
        [self.ic scrollToItemAtIndex:self.ic.currentItemIndex+1 animated:YES];
    }];  
    return self;
}

-(void)addIC{
    //刷新的时候，先把原来的定时器销毁
    [self.timer invalidate];
    self.timer = nil;
    self.ic.currentItemIndex = 0;
    //头部视图，origin无效，宽度无效
    //添加滚动栏
    [self addSubview:self.ic];
    [self addSubview:self.pageControl];
    [self.ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(ZMSCREENW);
        make.height.mas_equalTo(5);
        make.bottom.mas_equalTo(-10);
    }];
}

#pragma mark -  iCarouselDelegate,iCarouselDataSource
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return _modelArr.count;
}
-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (view == nil) {
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ZMSCREENW, HEADERSCROLLVIEWH)];
        UIImageView* imageView = [[UIImageView alloc]init];
        imageView.tag = 100;
        imageView.contentMode = UIViewContentModeScaleToFill;
        view.clipsToBounds = YES;
        [view addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        imageView.backgroundColor = ZMRandomColor;
    }
    UIImageView* imageView = [view viewWithTag:100];
    NSURL* url = [NSURL URLWithString:_modelArr[index].imageUrl];
    [imageView sd_setImageWithURL:url];
    return view;
}
/** 允许循环滚动*/
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}
/**监控当前滚动到第几个*/
-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
    self.pageControl.currentPage = carousel.currentItemIndex;
}

@end
