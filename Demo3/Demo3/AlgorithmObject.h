//
//  AlgorithmObject.h
//  Demo3
//
//  Created by quanlinghui on 2025/4/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/// 算法
@interface AlgorithmObject : NSObject

/// <#Description#>
/// @param numArray <#numArray description#>
/// @param target <#target description#>
+ (NSArray *)cacuNumber:(NSArray *)numArray target:(NSInteger)target;


+ (void)moveZeroToRight:(NSMutableArray *)nums;


+ (void)moveZeroToLeft:(NSMutableArray *)nums;


+ (float)cacuValueNumber:(NSUInteger)number;


+ (void)mergeNums1:(NSMutableArray *)nums1 m:(NSInteger)m nums2:(NSArray *)nums2 n:(NSInteger)n;

+ (NSArray *)reverseStr:(NSString *)oriStr;


struct ListNode* removeNthFromEnd(struct ListNode* head, int n);

+ (void)cacuMaxLength:(NSArray *)numbers finish:(void(^)(NSInteger maxLength, NSArray *array))finishBlock;

+ (void)bubbleOrder:(NSArray *)oriArray2;



@end

NS_ASSUME_NONNULL_END
