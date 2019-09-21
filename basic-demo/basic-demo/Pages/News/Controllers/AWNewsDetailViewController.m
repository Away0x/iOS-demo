//
//  AWNewsDetailViewController.m
//  basic-demo
//
//  Created by wutong on 2019/9/10.
//  Copyright © 2019 wutong. All rights reserved.
//

#import "AWNewsDetailViewController.h"
#import <WebKit/WebKit.h>
#import "AWScreen.h"

@interface AWNewsDetailViewController ()<WKNavigationDelegate>

@property (nonatomic, strong, readwrite) WKWebView *webView;
@property (nonatomic, strong, readwrite) UIProgressView *progressView;
@property (nonatomic, copy, readwrite) NSString *articleUrl;

@end

@implementation AWNewsDetailViewController

- (instancetype)initWithUrlString:(NSString *)url {
    self = [super init];
    if (self) {
        self.articleUrl = url;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(_shareArticle)];
    
    [self.view addSubview:({
        self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, STATUSBARHEIGHT + 44, self.view.frame.size.width, self.view.frame.size.height - STATUSBARHEIGHT - 44)];
        self.webView.navigationDelegate = self;
        self.webView;
    })];
    
    [self.view addSubview:({
        self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, STATUSBARHEIGHT + 44, self.view.frame.size.width, 20)];
        self.progressView;
    })];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.articleUrl]]];
    
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

#pragma mark - WKNavigationDelegate

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    // webview 加载完成，但不代表整个 webview 渲染结束
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    // 加载进度条
    self.progressView.progress = self.webView.estimatedProgress;
}

- (void)_shareArticle {
    
}

@end
