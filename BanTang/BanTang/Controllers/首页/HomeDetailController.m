//
//  HomeDetailController.m
//  BanTang
//
//  Created by stone on 2016/10/24.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "HomeDetailController.h"
#import "HomeNetwork.h"
#import "HomeDetailModel.h"
#import "GoodsMainController.h"
@interface HomeDetailController ()<UIWebViewDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewBottomCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewTopCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *webTopCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeightCons;
@end

@implementation HomeDetailController
-(instancetype)initWithPathId:(NSString *)pathId{
    if (self = [super init]) {
        self.pathId = pathId;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.webView.delegate = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.webView.scrollView.delegate = self;
    [HomeNetwork getDetailWithUr:self.pathId completeHandle:^(id responseObj, NSError *error) {
        HomeDetailModel* model = (HomeDetailModel*)responseObj;
        [self.webView loadHTMLString:model.data.contentHtml baseURL:nil];
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.data.coverImageUrl]];
    }];
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    if (navigationType==UIWebViewNavigationTypeLinkClicked) {
        NSString* str = [request.URL absoluteString];
        NSArray* array = [str componentsSeparatedByString:@"/"];
        NSLog(@"%@",array.lastObject);
        GoodsMainController* vc = [[GoodsMainController alloc]initWithrequest:array.lastObject];
        [self.navigationController pushViewController:vc animated:YES];
        return NO;
    }
    NSLog(@"这不是链接");
    return YES;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
//    self.imageHeightCons.constant = -offsetY;
    self.imageViewTopCons.constant = -offsetY;
    if (offsetY<0) {
//        self.imageViewTopCons.constant = offsetY;
    }
}

-(void)dealloc{
    ZMLogfunc;
}

@end
