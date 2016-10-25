//
//  DanpingViewController.m
//  BanTang
//
//  Created by stone on 2016/10/24.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "GoodDetailViewController.h"
#import "GoodDetailViewModel.h"
@interface GoodDetailViewController ()

@end

@implementation GoodDetailViewController

{
    UIWebView* _webview;
}
-(instancetype)initWithrequest:(NSString *)request{
    if (self = [super init]) {
        self.pathId = request;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addWebView];
    
}
-(void)addWebView{
    self.automaticallyAdjustsScrollViewInsets = NO;
    _webview = [[UIWebView alloc]init];
    [self.view addSubview:_webview];
    _webview.frame = self.view.bounds;
    [_webview loadHTMLString:self.pathId baseURL:nil];
}

//-(void)setPathId:(NSString *)pathId{
//     [_webview loadHTMLString:self.pathId baseURL:nil];
//}
-(void)dealloc{
    ZMLogfunc;
}

@end
