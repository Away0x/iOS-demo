//
//  ViewController.m
//  hybrid
//
//  Created by wutong on 2019/12/13.
//  Copyright © 2019 wutong. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController () <WKUIDelegate, WKScriptMessageHandler>

@property (nonatomic, strong) WKWebView *webview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 150, 100, 300, 30);
        btn.backgroundColor = [UIColor grayColor];
        [btn setTitle:@"调用 web 方法" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
        btn;
    })];
    
    [self.view addSubview:({
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        // 注册 ios 方法供 web 调用
        WKUserContentController *uc = [[WKUserContentController alloc] init];
        [uc addScriptMessageHandler:self name:@"iosDoAction"]; // web 可通过 iosDoAction 给 ios 发消息
        config.userContentController = uc;
        
        CGRect rect = [[UIScreen mainScreen] bounds];
        rect.size.height = rect.size.height - 30;
        rect.origin.y = 100 + 50;
        WKWebView *webView = [[WKWebView alloc] initWithFrame:rect configuration:config];
        webView.layer.borderWidth = 1;
        webView.layer.borderColor = [UIColor grayColor].CGColor;
        
        // 加载 html
        // NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://www.baidu.com"]];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]];
        [webView loadRequest:request];
        
        _webview = webView;
        _webview.UIDelegate = self;
        webView;
    })];
}

#pragma mark - ios 按钮点击事件
- (void)btnClicked {
    // 调用 web 的方法
    [self.webview evaluateJavaScript:@"webFunc('我是来自 iOS 的数据')"
       completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"ios alert" message:result preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:({
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            action;
        })];
        [self presentViewController:alert animated:YES completion:nil];
    }];
}

#pragma mark - 显示 web alert
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"web alert" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:({
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            completionHandler();
        }];
        
        action;
    })];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - WKScriptMessageHandler
// 接收来自 web 端的消息
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    
    // WKScriptMessage 类的 name 属性是消息名称，body 是发送的数据
    NSLog(@"message.name:%@", message.name);
    NSLog(@"message.body:%@", message.body);
    
    // web 发送消息给 ios 后，无法得到 ios 的返回值，所以可在这里将需要返回的数据再调用 web 方法传递过去
    [self.webview evaluateJavaScript:@"webFunc('我是来自 iOS 的数据')" completionHandler:nil];
}

@end
