//
//  ADWebVC.m
//  ADExample
//
//  Created by 马文帅 on 16/5/27.
//  Copyright © 2016年 ekeguan. All rights reserved.
//

#import "ADWebVC.h"

@interface ADWebVC ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation ADWebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"网页浏览";
    [self.view addSubview:self.webView];
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView {
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
}

#pragma mark - lazy loading
- (UIWebView *)webView {
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        _webView.scalesPageToFit = YES;
        _webView.delegate = self;
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    }
    return _webView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
