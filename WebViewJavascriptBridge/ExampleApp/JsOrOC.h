//
//  JsOrOC.h
//  ExampleApp
//
//  Created by kys－1 on 16/4/17.
//  Copyright © 2016年 Marcus Westin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewJavascriptBridge.h"

@interface JsOrOC : UIViewController

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) WebViewJavascriptBridge *bridge;

@end
