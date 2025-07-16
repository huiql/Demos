//
//  OneViewController.m
//  Demo4
//
//  Created by quanlinghui on 2025/5/9.
//

#import "OneViewController.h"
#import <WebKit/WebKit.h>


@interface OneViewController ()<WKNavigationDelegate>
//@property (nonatomic, strong) NSNumber jj;
@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.orangeColor;
    // 添加监听（需确保已导入WebKit框架）
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                          selector:@selector(webViewProcessDidTerminate:)
//                                              name:WKWebViewProcessDidTerminateNotification
//                                            object:nil];

}




// 处理回调
- (void)webViewProcessDidTerminate:(NSNotification *)notification {
    WKWebView *webView = notification.object; // 获取崩溃的webView实例
    NSLog(@"WebContent进程已终止，URL: %@", webView.URL);
//    [self reloadWebView]; // 建议重新加载页面
}


//- star


- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    error.localizedDescription;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc {
//    __weak OneViewController *weakself = self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
