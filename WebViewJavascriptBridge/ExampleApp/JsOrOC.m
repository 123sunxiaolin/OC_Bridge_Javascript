//
//  JsOrOC.m
//  ExampleApp
//
//  Created by kys－1 on 16/4/17.
//  Copyright © 2016年 Marcus Westin. All rights reserved.
//

#import "JsOrOC.h"

@implementation JsOrOC
@synthesize webView = _webView, bridge = _bridge;

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _webView = [[UIWebView alloc] init];
    _webView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width);
    _webView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_webView];
    
    //start log func
    [WebViewJavascriptBridge enableLogging];
    
    //实例化WebViewJavascriptBridge并定义native端的默认消息处理器
    /*
     * 默认必须写的，JS调用OC，返回一个参数 data
     * 如果不想返回参数 则将handler的参数制成null
     */
  
    /**
     *  @author XiaolinSun, 16-04-17 15:04:10
     *
     *  @brief init WebViewJavascriptBridge object，and define native as the default message handler
     *   
     *  By default,this is must implement,if not to,set handler as null
        JS invoke OC
     *
     *  @since 1.0
     */
    
    _bridge = [WebViewJavascriptBridge bridgeForWebView:_webView handler:^(id data, WVJBResponseCallback responseCallback) {
        //JS的回调，返回的参数在这里进行OC代码的编写
        NSLog(@"OBJC receive meeage from JS :%@", data);
        responseCallback(@"response for message From Objc");
        
    }];
    
    
    /*
     *JS调用OC时必须写的，注册一个JS调用OC的方法
     */
    //注册一个供UI端调用的名为testObjcCallback的处理器，并定义用于响应的处理逻辑
    [_bridge registerHandler:@"testObjcCallback" handler:^(id data, WVJBResponseCallback responseCallback) {
        //
        NSLog(@"testObjcCallback called: %@", data);
        responseCallback(@"Response from testObjcCallback");
    }];
    
    [self loadExamplePage:_webView];
    [self renderButtons:_webView];
    
}

- (void)renderButtons:(UIWebView*)webView {
    UIButton *messageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [messageButton setTitle:@"Send message" forState:UIControlStateNormal];
    [messageButton addTarget:self action:@selector(sendMessage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:messageButton aboveSubview:webView];
    messageButton.frame = CGRectMake(20, 414, 130, 45);
    
    UIButton *callbackButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [callbackButton setTitle:@"Call handler" forState:UIControlStateNormal];
    [callbackButton addTarget:self action:@selector(callHandler:) forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:callbackButton aboveSubview:webView];
    callbackButton.frame = CGRectMake(170, 414, 130, 45);//lazy loading
}

- (void)sendMessage:(id)sender {
    [_bridge send:@"A string sent from ObjC to JS" responseCallback:^(id response) {
        NSLog(@"send返回结果是: %@", response);
    }];
}

- (void)callHandler:(id)sender {
    NSDictionary* data = [NSDictionary dictionaryWithObject:@"Hi there, JS!" forKey:@"greetingFromObjC"];
    /*
     *
     */
    [_bridge callHandler:@"testJavascriptHandler" data:data responseCallback:^(id response) {
        NSLog(@"callHandler返回结果是: %@", response);
    }];
    
    //    NSDictionary* data = [NSDictionary dictionaryWithObject:@"Hi there, JS!" forKey:@"greetingFromObjC"];
    //    [_bridge callHandler:@"testJs" data:data responseCallback:^(id response) {
    //        NSLog(@"callHandler返回结果是: %@", response);
    //    }];
}

- (void)loadExamplePage:(UIWebView*)webView {
    NSString* htmlPath = [[NSBundle mainBundle] pathForResource:@"ExampleApp" ofType:@"html"];
    NSString* appHtml = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
    [webView loadHTMLString:appHtml baseURL:nil];
}

@end
