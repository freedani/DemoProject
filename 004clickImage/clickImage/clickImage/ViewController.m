//
//  ViewController.m
//  clickImage
//
//  Created by 李达 on 2017/3/18.
//  Copyright © 2017年 李达. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
#import "NSURLProtocol+WebKitSupport.h"
#import "LDImageBrowserView.h"

@interface ViewController () <WKNavigationDelegate, UIGestureRecognizerDelegate, WKUIDelegate>

@property(nonatomic, strong) WKWebView *webView;
@property(nonatomic, strong) LDImageBrowserView *imageBrowserView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    WKWebViewConfiguration *theConfiguration = [[WKWebViewConfiguration alloc] init];
    
    _webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:theConfiguration];
    _webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    if ([_webView respondsToSelector:@selector(setNavigationDelegate:)]) {
        [_webView setNavigationDelegate:self];
    }
    
    if ([_webView respondsToSelector:@selector(setUIDelegate:)]) {
        [_webView setNavigationDelegate:self];
    }
    
    [self.view addSubview:_webView];
    _webView.userInteractionEnabled = YES;
    _webView.scrollView.bounces = NO;
    NSString *urlStr = @"https://daily.zhihu.com/story/9241686";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    [_webView loadRequest:request];
    
    for (NSString* scheme in @[@"http", @"https"]) {
        [NSURLProtocol wk_registerScheme:scheme];
    }
    
    self.imageBrowserView = [[LDImageBrowserView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.imageBrowserView.hidden = YES;
    [self.view addSubview:self.imageBrowserView];
}

- (void)addJavaScript {
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *filePath = [bundle pathForResource:@"javascript" ofType:@"js"];
    NSString *clickImg = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [_webView evaluateJavaScript:clickImg completionHandler:nil];
    [_webView evaluateJavaScript:@"setImage();" completionHandler:nil];
        // 允许用户交互
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    [self addJavaScript];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(nonnull WKNavigationAction *)navigationAction decisionHandler:(nonnull void (^)(WKNavigationActionPolicy))decisionHandler{
    NSString *requestString = [[navigationAction.request URL] absoluteString];
    NSArray *components = [requestString componentsSeparatedByString:@"::"];
    if ([components[0] isEqualToString:@"clickimg"]) {
        NSLog(@"%@",components[1]);
        int imgIndex = [components[1] intValue];
        [self.imageBrowserView showImageBrowser:components[2] completedBlock:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL){
            if (image) {
                NSData *data = UIImagePNGRepresentation(image);
                if (data != nil) {
                    NSString *base64 = [data base64EncodedStringWithOptions:0];
                    NSString *url = [@"data:application/png;base64," stringByAppendingString:base64];
                    NSString *js = [NSString stringWithFormat:@"changeImage(%d,'%@');",imgIndex,url];
                    [_webView evaluateJavaScript:js completionHandler:nil];
                }
            }

            
        }];
        decisionHandler(WKNavigationActionPolicyCancel);
    } else {
        decisionHandler(WKNavigationActionPolicyAllow);
    }
    return;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
