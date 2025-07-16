//
//  ViewController.m
//  Demo3
//
//  Created by quanlinghui on 2025/3/13.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "CustomViewController.h"
#import "CustomView.h"
#import "AlgorithmObject.h"
#import "CustomViewController.h"
#import "TextViewController.h"
#import "ListModel.h"
#import "Demo3-Swift.h" // 替换 Demo3 为你的实际模块名

@interface ViewController ()
@property (nonatomic, strong) NSThread *thread;
@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) CustomView *cv1;
@property (nonatomic, strong) CustomView *cv2;

@property (nonatomic, strong) UIButton *button;

//@property (nonatomic, strong) int  value2;
@property (nonatomic, strong) MyUser *user;


@end

@implementation ViewController

//@dynamic cusName;
@synthesize cusName = _quanling;

+ (void)load {
    Method originMethod = class_getInstanceMethod([ViewController class], @selector(viewDidLoad));
    Method currentMethod = class_getInstanceMethod([ViewController class], @selector(viewDidLoad_current));
    method_exchangeImplementations(originMethod, currentMethod);
    
}

- (void)viewDidLoad_current {
    NSLog(@"我好");
    [self viewDidLoad_current];
    
}

- (CustomView *)customv {
    return [[CustomView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.orangeColor;
    _count = 0;

    
    SEL sec = _cmd;
    NSLog(@"你好, %@", NSStringFromSelector(sec));
    
//    [self performSelector:@selector(jjj:) onThread:[NSThread currentThread] withObject:nil waitUntilDone:YES];
    
//    [self performSelector:nil onThread:nil withObject:nil waitUntilDone:YES];
    // Do any additional setup after loading the view.
//    self.name = @"你好";
    // Do any additional setup after loading the view.
//    [self messageTransfor];
    
//    NSLog(@"栈回调 = %@", [NSThread callStackSymbols]);
//    CustomViewController *cust = [[CustomViewController alloc] init];
//    [cust setValue:@"ql" forKey:@"name"];
//    NSLog(@"name = %@", [cust valueForKey:@"name"]);

//
//    self.cv1 = [self customv];
//    self.cv2 = [self customv];
    
    
//    [self.cv1 addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:@"cv1"];
//    [self.cv2 addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:@"cv2"];
//    pthread_rwlock_t jj;
//
//    NSArray *haha;
//    NSString *nihao;
//    [nihao mutableCopy];
//    NSArray *array = @[@44, @9, @2, @3, @4, @5, @78, @90, @66];
//    //
//    NSArray * result = [AlgorithmObject cacuNumber:array target:49];
//
//    [self test2];
//
//
//
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        // 主线程执行耗时计算
//            for (int i = 0; i < 100000000; i++) {
//                // 模拟复杂计算（如大量浮点运算）
//                float a = sqrt((double)i);
//            }
//    });
//
//    [self sssss];
//
////    [self performSelector:@selector(jjjjj) withObject:nil afterDelay:0 inModes:@[NSDefaultRunLoopMode]];
//
//    [self test111];
    
    
//    self.view.backgroundColor = UIColor.orangeColor;
//
//    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
//    self.button.frame = CGRectMake(100, 100, 100, 50);
//    self.button.backgroundColor = UIColor.redColor;
//    [self.view addSubview:self.button];
//    [self.button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];

    
//
//    NSThread *thread = [[NSThread alloc] initWithBlock:^{
//        NSLog(@"123");
//        [[NSRunLoop currentRunLoop] run];
////        [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSRunLoopCommonModes];
//    }];
//    [thread start];
//    [self performSelector:@selector(handleTask) onThread:thread withObject:nil waitUntilDone:NO];
    self.cv1 = [[CustomView alloc] init];
    
    MyUser * user = [[MyUser alloc] initWithName:@"小慧" age:34];
    self.user = user;
    [user putInfoWithAddress:@"山东省"];
    
    UIButton *button = [user createButtonWithRect:CGRectMake(100, 100, 60, 30) name:@"点我"];
    [self.view addSubview:button];
    
    

}

- (void)handleTask {
    NSLog(@"test123");
}


- (void)buttonAction {
//    TextViewController * vc = [[TextViewController alloc] init];
//    [self presentViewController:vc animated:YES completion:nil];
}

- (void)test111 {
    
    dispatch_queue_t serQueue = dispatch_queue_create("", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(serQueue, ^{
        NSLog(@"1");
        [NSThread sleepForTimeInterval:1];;
    });
    
    dispatch_async(serQueue, ^{
        NSLog(@"2");
        [NSThread sleepForTimeInterval:2];;
    });
    
    dispatch_async(serQueue, ^{
        NSLog(@"3");
        [NSThread sleepForTimeInterval:3];
    });
}



- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {

}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
////    self.cv1.name = @"小苗";
////
////    [NSThread sleepForTimeInterval:2.0];
//
//
////      NSArray *array  = @[@(1), @(2), @(0), @(0), @(3), @(0),];
////    [AlgorithmObject moveZeroToLeft:array];
//
////    NSLog(@"计算平方根是=%f", [AlgorithmObject cacuValueNumber:168]);
//
//
////    NSArray *reverArray = [AlgorithmObject reverseStr:@"leetcode"];
////    NSLog(@"reverArray = %@", reverArray);
////
//
////    TextViewController * vc = [[TextViewController alloc] init];
////    [self presentViewController:vc animated:YES completion:nil];
//
//
//    NSOperation *operation = [[NSOperation alloc] init];
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    [queue setSuspended:YES];
//    [queue setSuspended:NO];
//    [operation start];
//    [operation cancel];
//
//}


- (void)asyKeepAlive {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSRunLoopCommonModes];
        [[NSRunLoop currentRunLoop] run];
    });
}


+ (BOOL)accessInstanceVariablesDirectly {
    
    return NO;
}



/// 消息转发
- (void)messageTransfor {
    ViewController *vc = [[ViewController alloc] init];
    [vc performSelector:@selector(hhhh)];
}


// 如果没有实现方法，第① 允许动态添加方法，如果没有添加则走第②部
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
//    if (sel == @selector(hhhh)) {
//        class_addMethod(self, @selector(hhhh), (IMP)dynamicIMP, "v@:");
//        return YES;
//    }
    return [super resolveInstanceMethod:sel];
}

void dynamicIMP (id self, SEL sec) {
    
}

// 第②步，转发给其他对象
- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(hhhh)) {
//        Class class = NSClassFromString(@"CustomViewController");
//        return [[class alloc] init];
    }
    return [super forwardingTargetForSelector:aSelector];
}

// 第③部 返回方法签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(hhhh)) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [NSMethodSignature methodSignatureForSelector:aSelector];
}

// 处理消息转发，可修改参数
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    if (anInvocation.selector == @selector(hhhh)) {
        NSLog(@"完整消息转发：修改参数或转发给多个对象");
        // 示例：修改参数并转发
//        NSString *arg = @"新参数";
//        [anInvocation setArgument:&arg atIndex:1];
        
        // 转发给其他对象
        Class class = NSClassFromString(@"CustomViewController");
        [anInvocation invokeWithTarget:[[class alloc] init]];
    } else {
        [super forwardInvocation:anInvocation];
    }
}


//- (void)test111 {
//    static int value = 10;
//    self.value2 = 30;
//    void (^myTestBlock)(void) = ^{
//        value = 20;
//        NSLog(@"123");
//        self.value2 = 40;
//    };
//
//}


// 线程保活
- (void)keepThreadAlive {
    self.thread = [[NSThread alloc] initWithTarget:self selector:@selector(runThread) object:nil];
    [self.thread start];
}

    
- (void)runThread {
    @autoreleasepool {
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        [runloop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
        
        // 添加一个 Timer 作为事件源
        NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
            self->_count ++;
            NSLog(@"count = %ld", self->_count);
        }];
        [runloop addTimer:timer forMode:NSDefaultRunLoopMode];
        
        [runloop run];
        
        
        // 如果 RunLoop 退出，会执行到这里
        NSLog(@"RunLoop 已退出");
    };
}




- (void)test1 {
    NSArray *array1 = @[@(1), @(3), @(5)];
    NSMutableArray *array2 = [NSMutableArray arrayWithArray:@[@(2), @(4), @(8), @(9)]];
    
    
    [array1 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSInteger value = [obj integerValue];
        [array2 enumerateObjectsUsingBlock:^(id  _Nonnull obj2, NSUInteger idx2, BOOL * _Nonnull stop2) {
            NSInteger value2 = [obj2 integerValue];
            if (value > value2) {
                // 执行插入
                [array2 insertObject:@(value) atIndex:idx];
                *stop2 = YES;
            }
        }];
    }];

}

- (void)test2 {
    [CustomViewController test];
}

- (void)reorderArray:(NSMutableArray *)nums {
    nums = [NSMutableArray arrayWithArray:nums];
    /*
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj integerValue] == 0) {
            dict[@(idx)] = @(0);
        }
    }];
    [[dict allKeys] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [array removeObjectAtIndex:[obj integerValue]];
    }];
    
    for (int i = 0; i< dict.allKeys.count; i++) {
        [array insertObject:@(0) atIndex:0];
    }
    */
    
    if (nums.count == 0) return;
    
    NSInteger j = 0; // 记录非零元素的位置
    for (NSInteger i = 0; i < nums.count; i++) {
        if (![nums[i] isEqualToValue:@0]) {
            nums[j] = nums[i];
            j++;
        }
    }
    
    // 将剩余位置填充为 0
    while (j < nums.count) {
        nums[j] = @0;
        j++;
    }
    
    NSLog(@"排序后的数组是：%@", nums);
}

- (void)moveZeroToRight:(NSMutableArray *)nums {
    nums = [NSMutableArray arrayWithArray:nums];
    int j = 0; // j 记录非零元素的位置
    for (int i = 0; i < nums.count; i++) {
        if (![nums[i] isEqualToValue:@(0)]) {
            nums[j] = nums[i];
            j ++;
        }
    }
    
    while (j < nums.count) {
        nums[j] = @(0);
        j++;
    }
    NSLog(@"排序后的数组是：%@ 【函数名%s】", nums, __func__);
}


- (void)moveZeroToLeft:(NSMutableArray *)nums {
    nums = [NSMutableArray arrayWithArray:nums];
    NSInteger j = nums.count - 1; // j 记录非零元素的位置
    for (NSInteger i = nums.count - 1; i < nums.count; i--) {
        if (![nums[i] isEqualToValue:@(0)]) {
            nums[j] = nums[i];
            j --;
        }
    }
    
    while (j < nums.count) {
        nums[j] = @(0);
        j--;
    }
    NSLog(@"排序后的数组是：%@ 【函数名%s】", nums, __func__);
}




- (void)jjjjj {
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"task = 1111");
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        [NSThread sleepForTimeInterval:4];
        NSLog(@"task = 2222");
    });
    
    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
        NSLog(@"task = finish");
    });
}

- (void)sssss  {
    dispatch_queue_t queue = dispatch_queue_create("123", DISPATCH_QUEUE_CONCURRENT);

    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"task = 1111");
    });
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:4];
        NSLog(@"task = 2222");
    });
    dispatch_barrier_async(queue, ^{
        NSLog(@"task = finish");
    });
    
}


#pragma mark  生命周期

- (void)loadView {
    [super loadView];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}



- (void)reverseList:(ListModel *)head {
    id pre = nil;
    ListModel *current = head;
    id temp;
    while (current.next != nil) {
        temp = current.next;
        current.next = pre;
        pre = current;
        current.next = temp;
    }
    
}

- (IBAction)customButtonAction:(id)sender {
//    self.cusName  = @"哈哈哈哈";
//    
//    NSArray *name = @[@"123"];
//    NSArray *jj = [name copy];
//    NSMutableArray *array = [name mutableCopy];
//    [array addObject:@"捡垃圾酸辣粉觉得"];
//    NSLog(@"array = %@", array);
//    
//    
//    TextViewController * vc = [[TextViewController alloc] init];
//    [self presentViewController:vc animated:YES completion:nil];

}



- (void)printAllViews:(UIView *)view {
    if (!view) {
        return;
    }
    NSLog(@"%@",view);
    if (!view.subviews.count) {
        return;
    }
    
    
    [[view subviews] enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self printAllViews:obj];
    }];
}


- (void)printAllViewsOther:(UIView *)view {
    if (!view) {
        return;
    }
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:view];
    while (array.count > 0) {
        UIView *currentView = array.lastObject;
        NSLog(@"%@",view);
        [array removeObject:currentView];
        [currentView.subviews enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [array addObject:obj];
            
            NSCache *cache = [[NSCache alloc] init];
        }];
    }
    
    
    
//    NSException *jj;
//    objc_registerClassPair(<#Class  _Nonnull __unsafe_unretained cls#>)
//    class_addIvar(<#Class  _Nullable __unsafe_unretained cls#>, <#const char * _Nonnull name#>, <#size_t size#>, <#uint8_t alignment#>, <#const char * _Nullable types#>)
//    objc_allocateClassPair(<#Class  _Nullable __unsafe_unretained superclass#>, <#const char * _Nonnull name#>, <#size_t extraBytes#>)
}

@end
