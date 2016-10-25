//
//  GoodSecurityController.m
//  BanTang
//
//  Created by stone on 2016/10/25.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "GoodSecurityController.h"

@interface GoodSecurityController ()<UIWebViewDelegate>

@end

@implementation GoodSecurityController
{
    UIWebView* _webview;
}

-(instancetype)initWithUrl:(NSString*)url{
    if (self = [super init]) {
        self.url = url;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _webview = [[UIWebView alloc]init];
    _webview.delegate = self;
    [self.view addSubview:_webview];
    _webview.frame = self.view.bounds;
     NSURLRequest* request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:self.url]];
    [_webview loadRequest:request];
}
-(void)dealloc{
    ZMLogfunc;
}



@end
