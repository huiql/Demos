//
//  CustomViewController.m
//  Demo3
//
//  Created by quanlinghui on 2025/3/14.
//

#import "CustomViewController.h"
@interface CustomViewController ()

{
    NSString *_name;
}

@end

@implementation CustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//+ (BOOL)accessInstanceVariablesDirectly {
//    return NO;
//}

- (void)hhhh {
    
}

- (void)hhhh:(NSString *)str {
    
}


- (void)requestTask {
    
    dispatch_queue_t queue = dispatch_queue_create("", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        // 请求任务1
    });
    
    dispatch_async(queue, ^{
        // 请求任务2
    });
    
    dispatch_barrier_async(queue, ^{
        // 请求任务3
    });
    
}

+ (void)test {
    NSArray *array = @[@(2), @(3), @(4), @(5), @(6), @(12), @(13), @(7), @(2), @(3), @(4), @(5), @(6), @(7)];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if (dict[obj]) {
            NSInteger count = [dict[obj] integerValue] + 1;
            dict[obj] = @(count);
//        } else {
//            dict[obj] = @(1);
//        }
    }];

    NSMutableArray *resultArray = [NSMutableArray array];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj integerValue] == 1) {
            [resultArray addObject:key];
        }
    }];
    
}




@end
