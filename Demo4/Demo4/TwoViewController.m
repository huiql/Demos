//
//  TwoViewController.m
//  Demo4
//
//  Created by quanlinghui on 2025/7/12.
//

#import "TwoViewController.h"
#import "WeakProxy.h"

@interface TwoViewController ()
@property (nonatomic, strong) NSTimer *customTimer;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.yellowColor;
    
    self.customTimer = [NSTimer timerWithTimeInterval:1.0 target:[WeakProxy proxyWithTarget:self] selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.customTimer forMode:NSDefaultRunLoopMode];
//    self.customTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"%@", [NSDate date]);
//    }];
}

- (void)timerAction {
    NSLog(@"%@", [NSDate date]);
}

- (void)dealloc {
    [self.customTimer invalidate];
    self.customTimer = nil;
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
