#import "ExampleAppDelegate.h"
#import "JsOrOC.h"

@implementation ExampleAppDelegate

//@synthesize window = _window;
//@synthesize javascriptBridge = _bridge;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //UIWebView* webView = [[UIWebView alloc] initWithFrame:self.window.bounds];
    //[self.window addSubview:webView];
    self.window.rootViewController = [[JsOrOC alloc] init];
    
    [self.window makeKeyAndVisible];
    return YES;
    
    //启用日志记录
   // [WebViewJavascriptBridge enableLogging];
    
    //实例化WebViewJavascriptBridge并定义native端的默认消息处理器
    /*
     * 默认必须写的，JS调用OC，返回一个参数 data
     * 如果不想返回参数 则将handler的参数制成null
     */
//    _bridge = [WebViewJavascriptBridge bridgeForWebView:webView handler:^(id data, WVJBResponseCallback responseCallback) {
//        //返回的参数在这里进行OC的代码编写
//        NSLog(@"ObjC received message from JS: %@", data);
//        responseCallback(@"Response for message from ObjC");
//    }];
    
    /*
     *JS调用OC时必须写的，注册一个JS调用OC的方法
     */
    //注册一个供UI端调用的名为testObjcCallback的处理器，并定义用于响应的处理逻辑
//    [_bridge registerHandler:@"testObjcCallback" handler:^(id data, WVJBResponseCallback responseCallback) {
//        //
//        NSLog(@"testObjcCallback called: %@", data);
//        responseCallback(@"Response from testObjcCallback");
//    }];
    
    //发送一条消息给UI端并定义回调处理逻辑
//    [_bridge send:@"A string sent from ObjC before Webview has loaded." responseCallback:^(id responseData) {
//        NSLog(@"objc got response! %@", responseData);
//    }];

    //调用一个在UI端定义的名为testJavascriptHandler的处理器，没有定义回调
//    [_bridge callHandler:@"testJavascriptHandler" data:[NSDictionary dictionaryWithObject:@"before ready" forKey:@"foo"]];
    
//    [self renderButtons:webView];
//    [self loadExamplePage:webView];
    
    //单纯发送一条消息给UI端
//    [_bridge send:@"A string sent from ObjC after Webview has loaded."];
    
    
}

//- (void)renderButtons:(UIWebView*)webView {
//    UIButton *messageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//	[messageButton setTitle:@"Send message" forState:UIControlStateNormal];
//	[messageButton addTarget:self action:@selector(sendMessage:) forControlEvents:UIControlEventTouchUpInside];
//	[webView insertSubview:messageButton aboveSubview:webView];
//	messageButton.frame = CGRectMake(20, 414, 130, 45);
//    
//    UIButton *callbackButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [callbackButton setTitle:@"Call handler" forState:UIControlStateNormal];
//    [callbackButton addTarget:self action:@selector(callHandler:) forControlEvents:UIControlEventTouchUpInside];
//    [webView insertSubview:callbackButton aboveSubview:webView];
//	callbackButton.frame = CGRectMake(170, 414, 130, 45);
//}
//
//- (void)sendMessage:(id)sender {
//    [_bridge send:@"A string sent from ObjC to JS" responseCallback:^(id response) {
//        NSLog(@"send返回结果是: %@", response);
//    }];
//}
//
//- (void)callHandler:(id)sender {
//    NSDictionary* data = [NSDictionary dictionaryWithObject:@"Hi there, JS!" forKey:@"greetingFromObjC"];
//    /*
//     *
//     */
//    [_bridge callHandler:@"testJavascriptHandler" data:data responseCallback:^(id response) {
//        NSLog(@"callHandler返回结果是: %@", response);
//    }];
//    
////    NSDictionary* data = [NSDictionary dictionaryWithObject:@"Hi there, JS!" forKey:@"greetingFromObjC"];
////    [_bridge callHandler:@"testJs" data:data responseCallback:^(id response) {
////        NSLog(@"callHandler返回结果是: %@", response);
////    }];
//}
//
//- (void)loadExamplePage:(UIWebView*)webView {
//    NSString* htmlPath = [[NSBundle mainBundle] pathForResource:@"ExampleApp" ofType:@"html"];
//    NSString* appHtml = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
//    [webView loadHTMLString:appHtml baseURL:nil];
//}

@end
