//
//  ViewController.m
//  Demo4
//
//  Created by quanlinghui on 2025/4/28.
//

#import "ViewController.h"
#import "OneViewController.h"
#import "Caculator.h"
#import "CaculatorAddObject.h"
#import <ImageIO/ImageIO.h>
#import "TwoViewController.h"
#import "TestView1.h"


@interface ViewController ()
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UINavigationController *nav;
@property (nonatomic, assign) int number1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = UIColor.greenColor;
//    [self class];
    
    
//    UITextField *textView = [[UITextField alloc] initWithFrame:CGRectMake(10, 100, 100, 40)];
//    textView.backgroundColor = UIColor.orangeColor;
//    self.textField = textView;
//    [self.view addSubview:textView];
//
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(10, 160, 60, 30);
//    [button setTitle:@"点击" forState:UIControlStateNormal];
//    button.backgroundColor = UIColor.blueColor;
//    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];;
//    [self.view addSubview:button];
////    CGFloat jjj;
////    NSInteger jjj;
//    [self setupUI];
//    [self gcdTest];
    
    __block NSInteger count = 0;
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        count ++;
//        NSLog(@"count = %ld", count);
//
//    }];
    
    [self jjjjj];
    
}

- (void)jjjjj {
    while (self.number1 < 5) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            self.number1 ++;
        });
    }
    NSLog(@"jjjjjj=%d", self.number1);
}

- (void)gcdTest {
    NSLog(@"----------- 1");
    
    dispatch_queue_t queue = dispatch_queue_create(0, DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"----------- 2");
    });
    NSLog(@"----------- 3");
}


- (void)setupUI {
    TestView1 * view1 = [[TestView1 alloc] initWithFrame:CGRectMake(100, 400, 100, 60)];
    view1.backgroundColor = UIColor.redColor;
    [self.view addSubview:view1];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [view1 setNeedsLayout];
//    });
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [UIApplication sharedApplication].keyWindow.rootViewController = nil;;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self];
    [nav setTitle:@"标题"];
    self.nav = nav;
    [UIApplication sharedApplication].keyWindow.rootViewController = nav;
    
    
}


- (void)buttonAction {
    NSString *text = self.textField.text;
    
    NSString *left;
    NSString *right;
    Caculator *caculator = [[Caculator alloc] init];
    caculator.service = [[CaculatorAddObject alloc] init];
    [caculator.service caculate:left right:right];
    
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    OneViewController *one = [[OneViewController alloc] init];
//    [self presentViewController:one animated:YES completion:nil];
    
//   __block int count = 0;
//    void(^myblock)(void) = ^{
//        count = 2;
//    };
//    NSLog(@"count = %d", count);
//    myblock();
    
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    [dict setObject:nil forKey:@"jjj"];
    
    TwoViewController *secVC = [[TwoViewController alloc] init];
//    [self presentViewController:secVC animated:YES completion:nil];
    [self.navigationController pushViewController:secVC animated:YES];
}

+(void)initialize {
    
}

- (void)dealloc {

}


@end
