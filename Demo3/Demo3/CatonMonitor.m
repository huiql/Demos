//
//  CatonMonitor.m
//  Demo3
//
//  Created by quanlinghui on 2025/4/16.
//

#import "CatonMonitor.h"
#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
#import <QuartzCore/QuartzCore.h>

@implementation CatonMonitor

// 1. 定义卡顿阈值（单位：秒）
static const CFTimeInterval kStutterThreshold = 0.01667; // 16.67ms

// 2. 静态变量记录时间
static CFTimeInterval sStartTime = 0;

// 3. RunLoop 观察者回调函数
void runLoopObserverCallback(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    switch (activity) {
        case kCFRunLoopEntry:
        case kCFRunLoopBeforeTimers:
        case kCFRunLoopBeforeSources:
        case kCFRunLoopBeforeWaiting:
        case kCFRunLoopAfterWaiting:
        case kCFRunLoopExit:
            // 记录唤醒后的开始时间
            if (activity == kCFRunLoopAfterWaiting) {
                sStartTime = CACurrentMediaTime();
            }
            // 计算休眠前的耗时
            else if (activity == kCFRunLoopBeforeWaiting) {
                CFTimeInterval duration = CACurrentMediaTime() - sStartTime;
                if (duration > kStutterThreshold) {
                    NSLog(@"❌主线程卡顿：%.2fms", duration * 1000);
                } else {
                    NSLog(@"✅主线程无卡顿：%.2fms", duration * 1000);
                }
            }
            break;
        default:
            break;
    }
    dispatch_queue_t serialQueue = dispatch_queue_create("com.example.serial", DISPATCH_QUEUE_SERIAL);

}

// 4. 注册 RunLoop 观察者
+ (void)registerRunLoopObserver {
    CFRunLoopObserverContext context = {0, NULL, NULL, NULL, NULL};
    CFRunLoopObserverRef observer = CFRunLoopObserverCreate(
        kCFAllocatorDefault,
        kCFRunLoopAllActivities, // 监听所有阶段
        YES,                     // 重复监听
        0,                       // 优先级
        &runLoopObserverCallback,
        &context
    );
    
    // 将观察者添加到主线程的 RunLoop 的 CommonModes
    CFRunLoopAddObserver(CFRunLoopGetMain(), observer, kCFRunLoopCommonModes);
    CFRelease(observer);
}

// 5. 在 App 启动时调用（如 AppDelegate 中）

@end
