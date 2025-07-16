//
//  main.m
//  Demo3
//
//  Created by quanlinghui on 2025/3/13.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "AlgorithmObject.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
//        NSLog(@"平方根 = %f", [AlgorithmObject cacuValueNumber:80]);
        
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
