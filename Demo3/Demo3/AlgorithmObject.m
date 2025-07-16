//
//  AlgorithmObject.m
//  Demo3
//
//  Created by quanlinghui on 2025/4/8.
//

#import "AlgorithmObject.h"

#import "ListNode.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#import <UIKit/UIKit.h>


@implementation AlgorithmObject


/**
 《哈希表》、《动态规划》、《栈》、《双指针》、《递归等》
 面试中的算法题大多数都能通过经典的算法技巧解决，包括【哈希表、动态规划、栈、双指针、递归】等。为了应对这些问题，建议你在面试前进行充足
 的练习，掌握常见的题型和解法，并在面试中展示你的算法思维和代码实现能力。此外，要注意优化算法的时间和空间复杂度，尤其是在大数据量的情况下。
 */

//经典面试算法题： https://baijiahao.baidu.com/s?id=1818099810146187810&wfr=spider&for=pc


#pragma mark ---- 数组中，两个值等于目标值 ---- 哈希表 --  ✅✅✅✅✅✅
//  -- 哈希表实现
// 给定一个整数数组 nums 和一个目标值 target，请你在数组中找出两个数，使得它们的和等于目标值，返回它们的数组下标。
/**
 思路：
 1、便利数组，获取每个索引下的值
 2、 计算当前值的补缺值
 3、声明一个字典a，存储key为数组元素的值，value为索引
 4、 判断当前字典a的key是否包含补缺值，如果包含，则当前索引和字典里的索引就是要找的下表，否则就存储当前的值和索引
 
 */


+ (NSArray *)cacuNumber:(NSArray *)numArray target:(NSInteger)target {
    // 用于存储坐标和对应的值，key 是值，value 是坐标元素
    NSMutableDictionary * paramDict = [NSMutableDictionary dictionary];
    for (int i = 0; i < numArray.count; i++) {
        NSInteger number = [numArray[i] integerValue];
        // 找到补缺值
        NSInteger completionKey = target - number;
        // 判断补缺值是否被记录
        if (paramDict[@(completionKey)]) {
            return @[paramDict[@(completionKey)], @(i)];
        }
        paramDict[@(number)] = @(i);
    }
    return @[];
}

+ (NSArray *)jjjjj:(NSArray *)array target:(NSInteger)target {
    NSInteger matchValue = 0;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    for (int i = 0; i<array.count; i++) {
        matchValue = target - [array[i] integerValue];
        if (![[dict allKeys] containsObject:@(matchValue)]) {
            return @[@(i), dict[@(matchValue)]];
        } else {
            dict[@(matchValue)] = @(i);
        }
    }
}

// 手动实现
+ (NSArray *)nnnn:(NSArray *)array target:(NSInteger)target {
    NSMutableDictionary * param = [NSMutableDictionary dictionary];
    for (int i = 0; i<array.count; i++) {
        NSInteger tempValue = target - [array[i] integerValue];
        if (param[@(tempValue)]) {
            return @[param[@(tempValue)], @(i)];
        } else {
            param[array[i]] = @(i);
        }
    }
    return nil;
}

#pragma mark ---- 反转链表 ---- ✅✅✅✅✅✅

/// 翻转链表
+ (void)reverseListNode:(ListNode *)head {
    ListNode *pre = nil; // 前一个节点
    ListNode *current = head; // 设置当前节点指向头节点
    while (current != nil) {
        id tempNext = current.next; // 保存当前临时节点
        current.next = pre;  // 翻转指针
        pre = current;      // 后移上个节点至当前节点
        current = tempNext; // 后移当前节点至下一个节点
    }
}

typedef struct {
    id pre;
    id next;
}myListNode;


- (void)reverseList:(id)head {
    id pre = nil;
    id current = head;
    while (current!= nil) {
        temp = current.next;
        current.next = pre;
        pre = current;
        current = temp;
        
    }
}


/*
+ (void)reverseList:(myListNode *)headListNode {
    myListNode *pre = nil;
    myListNode *temp = nil;
    myListNode *current = headListNode;
    while (current != nil) {
        temp = listNode.next;
        listNode.next = pre;
        pre = current;
        current = temp;
    }
}

*/

#pragma mark ---- 数组把0移动到最右侧，不改变非0顺序 ---- 双指针  ✅✅✅✅✅✅

/*  --- 双指针实现
实现数组，不新建数组，把0移到最右侧，不改变非0元素的顺序？（百度）
方法一：双指针法（最优解）
思路：
使用两个指针 i 和 j，i 用于遍历数组，j 用于记录非零元素的位置。
遍历数组，当遇到非零元素时，将其移动到 j 的位置，并递增 j。
最后，将 j 之后的所有位置填充为 0。
时间复杂度：O(n)
空间复杂度：O(1)
*/

+ (void)moveZeroToRight:(NSMutableArray *)nums {
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

+ (void)kkkkkkjjj:(NSMutableArray *)array {
    int i = 0; // 用于记录
    int j = 0;  // 用于记录非零的位置
    for (int i = 0; i<array.count; i++) {
        if (![array[i]isEqualToNumber:@(0)]) {
            array[j] = array[i];
            j++
        }
    }
    while (j < array.count) {
        array[j] = @(0);
        j++
    }
}

+ (void)moveZeroToLeft:(NSMutableArray *)nums {
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

#pragma mark ---- 取x的平方根 ---- 二分法

/// 计算并返回 x 的平方根，其中 x 是非负整数。（快手） ----- 二分法  ✅✅✅✅✅✅

+ (float)cacuValueNumber:(NSUInteger)number {
    
    // 二分法
    float left = 0;
    float right = number;
    float middle;
    double precision = 1e-3; // ✅ 完全合法
    while (right - left > precision) {
        middle = left + (right - left)/2;
        // ​面试技巧： "这是为了避免 (left + right) 可能导致的整数溢出问题，属于二分查找的标准安全写法
       
        float squaValue = middle * middle; // 平方值
        
         if (squaValue> number) {
            right = middle;
        } else {
            left = middle;
        }
    }
    
    return middle;
//    ceilf(middle) // 向下取整
}

// 手写二分法
+ (float)cacuValueTestNumber:(NSUInteger)number {
    float acuValue = 0.0001;
    NSInteger left = 0;
    CGFloat right = number;
    CGFloat middleValue;
    while (right - left > acuValue) {
        middleValue = left + (right - left)/2.0;
        if (middleValue * middleValue < number) {
            left = middleValue;
        } else {
            right = middleValue;
        }
    }
}


#pragma mark ---- 查找两个字符串公共部分的长度  ----动态规划  ✅✅✅✅✅✅
// 算法题：查找两个字符串公共部分的长度 --  动态规划实现
/*
 
 动态规划表是一个二维数组，其中dp[i][j]表示以str1的第i-1个字符和str2的第j-1个字符结尾的最长公共子串长度。当字符相等时，dp[i][j] = dp[i-1][j-1] + 1，否则为0。同时记录最大值。
 */


int cacuCommonMaxLemgth(const char *str1, const char *str2) {
    int m = strlen(str1);
    int n = strlen(str2);
    
    // 创建动态规划表
      int ​**dp = (int ​**)malloc((m + 1) * sizeof(int *));
      for (int i = 0; i <= m; i++) {
          dp[i] = (int *)calloc(n + 1, sizeof(int));
      }
    
    int maxLength = 0;
    for (int i = 1; i<m; i++) {
        for (int j = 1; j<n; j++) {
            if (dp[i] == dp[j]) {
                dp[i][j] = dp[i-1][j-1] + 1;
                if (dp[i][j] > maxLength) {
                    maxLength = dp[i][j];
                }
                
            } else {
                dp[i][j] = 0;
            }
        }
    }
    
    return maxLength;
}
*/

// 手动实现动态规划
+ (CGFloat)lookforCommonStr:(NSString *)str1 str:(NSString *)str2 {
    NSMutableArray *array1 = [NSMutableArray array];
    NSMutableArray *array2 = [NSMutableArray array];
    NSInteger maxLength;
    
    // 声明二维数组
    int cArray[0][0] = {};

    for (int i = 0; i<array1.count; i++) {
        for (int j = 0; j<array2.count; j++) {
            if (array1[i]  == array2[i]) {
                cArray[i][j] = cArray[i-1][j- 1] + 1;
                if (cArray[i][j] > maxLength) {}
                maxLength = cArray[i][j];
            } else {
                cArray[i][j] = 0;
            }
        }
    }
}


//- (void)dddd {
//    for (int i = 1; i<m; i++) {
//        for (int j = 1; j<n; j++) {
//            if(arr[i] == arr[j]) {
//                arr[i][j]= arr[i-1][j-1] + 1;
//                if (arr[i][j] > maxLength) {
//                    maxLength = arr[i][j];
//                }
//            } else {
//                arr[i][j] = 0;
//            }
//        }
//    }
//}
// 约瑟夫环问题  --- 方案：数组模拟法  ❌❌❌❌❌❌❌
// 人报数，1 2 3  3号去除，然后接着4开始报  然后4 5  6,6  去除  然后7 8 9 ,9去除， 10  11  12  12 去除，最后算有几个人

+ (NSUInteger)remainingPeopleWithTotal:(NSUInteger)n {
    if (n == 0) return 0;
    
    NSMutableArray *people = [NSMutableArray array];
    for (NSUInteger i = 1; i <= n; i++) {
        [people addObject:@(i)]; // 初始化人员编号
    }
    
    NSUInteger currentStart = 0; // 当前轮起始位置
    while (people.count >= 3) {
        // 计算要删除的位置：currentStart 后移2步（0-based）
        NSUInteger removeIndex = (currentStart + 2) % people.count;
        [people removeObjectAtIndex:removeIndex];
        // 更新下一轮起始位置为被删元素的下一个位置
        currentStart = removeIndex % people.count;
    }
    
    return people.count;
}

#pragma mark   ---- 合并有序数组 ---- 双指针  ✅✅✅✅✅✅
// 给定两个有序整数数组 nums1 和 nums2，将 nums2 合并到 nums1 中，使得 nums1 成为一个有序数组。
// 双指针法
/*
 思路--------
 
 代码的大致步骤应该是这样的：
 1、初始化三个指针：i指向nums1的最后一个有效元素（m-1），j指向nums2的最后一个元素（n-1），k指向合并后的最后一个位置（m+n-1）。
 2、当i和j都大于等于0时，循环比较nums1[i]和nums2[j]，将较大的值放到nums1[k]，并移动相应的指针和k。
 3、如果循环结束后，j还大于等于0，说明nums2还有剩余元素，需要将这些元素复制到nums1的前面位置。
 4、完成合并。


 
 比如，假设nums1的有效元素是[1,3,5]，nums2是[2,4,6]，合并后的数组应该是[1,2,3,4,5,6]。按照逆向合并的方法，指针i初始指向nums1的最后一个有效元素（索引2，元素5），指针j指向nums2的最后一个元素（索引2，元素6），指针k指向合并后的最后一个位置（索引5）。比较5和6，6更大，所以nums1[5] = 6，j减到1，k减到4。接着比较5和4，5更大，所以nums1[4] =5，i减到1，k减到3。然后是3和4比较，4更大，放到位置3，j减到0，k减到2。接着是3和2比较，3更大，放到位置2，i减到0，k减到1。然后是1和2比较，2更大，放到位置1，j减到-1，k减到0。最后把剩下的nums1的元素直接放到前面，此时nums1已经是正确的顺序了。
 
 */

+ (void)mergeNums1:(NSMutableArray *)nums1 m:(NSInteger)m nums2:(NSArray *)nums2 n:(NSInteger)n {
    NSInteger i = m - 1;    // nums1 的最后一个有效元素索引
    NSInteger j = n - 1;    // nums2 的最后一个元素索引
    NSInteger k = m + n - 1; // nums1 的最后一个位置索引
    
    // 逆向比较并合并
    while (i >= 0 && j >= 0) {
        if ([nums1[i] integerValue] > [nums2[j] integerValue]) {
            nums1[k] = nums1[i];
            i--;
        } else {
            nums1[k] = nums2[j];
            j--;
        }
        k--;
    }
    
    // 如果 nums2 还有剩余元素，直接复制到 nums1 前面
    while (j >= 0) {
        nums1[k] = nums2[j];
        j--;
        k--;
    }
}

// 手写双指针有序数组合并

+ (void)mergeArray:(NSArray *)array array2:(NSArray *)array2 {
    // array 数组更长
    NSUInteger i = array.count - 1;
    NSUInteger j = array2.count - 1;
    NSUInteger k = i + j - 1;
    
    NSMutableArray *finalArray = [NSMutableArray array];
    while (i > 0 && j >0) {
        if ([array[i] intValue] > [array2[j] intValue]) {
            finalArray[k] = array[i];
            i--;
        } else {
            finalArray[k] = array[j];
            j--;
        }
    }
    
        while (i>0) {
            finalArray[k] = array[i];
            i--;
            k--;
        }
        while (j>0) {
            finalArray[k] = array[j];
            j--;
            k--;
        }
}


//自己手写
+ (void)merge:(NSMutableArray *)nums1 array:(NSMutableArray *)nums2 {
    nums1 = [NSMutableArray arrayWithArray:nums1];
    nums2 = [NSMutableArray arrayWithArray:nums2];

    NSMutableArray *mergeArray = [NSMutableArray arrayWithArray:nums1];
    for (int i = 0; i < nums2.count; i++) {
        [mergeArray addObject:nums2[i]];
    }
    
    NSUInteger i = nums1.count - 1;
    NSUInteger j = nums2.count - 1;
    NSUInteger k = i + j - 1;
    
    while (i > 0 && j > 0) {
        if ([nums1[i] integerValue] < [nums2[j] integerValue]) {
            nums1[k] = nums2[j];
            j --;
        } else {
            nums1[k] = nums1[i];
            i --;
        }
        k --;
    }
    
    while (j > 0) {
        nums1[k] = nums2[j];
        k--;
        j--;
    }
    
}



#pragma mark ---- 旋转数组 ----❌❌❌❌❌❌

/**
 步骤解析
 ​处理k的取值：当k大于数组长度时，实际有效移动次数为 k % nums.length。
 ​整体反转：将整个数组反转。
 ​前k部分反转：反转前k个元素。
 ​剩余部分反转：反转剩下的 n - k 个元素。

 **/


// 给定一个整数数组 nums，将数组中的元素向右轮转 k 个位置，其中 k 是非负数。

+ (NSArray *)rotateArray:(NSArray *)array byK:(NSInteger)k {
    if (array.count == 0 || k %array.count == 0) {
        return array;
    }
    
    [self reveseArray:array start:0 end:array.count - 1];
    [self reveseArray:array start:0 end:k - 1];
    [self reveseArray:array start:k end:array.count - 1];
    
    return array;
}

// 翻转
+ (NSArray *)reveseArray:(NSArray *)oriArray start:(NSInteger)start end:(NSInteger)end {
    NSMutableArray *array = [NSMutableArray arrayWithArray:oriArray];
    while (start < end) {
        [array exchangeObjectAtIndex:start withObjectAtIndex:end];
        start ++;
        end --;
    }
    return array;
}


/*
 
 给你一个字符串 s ，仅反转字符串中的所有元音字母，并返回结果字符串。❌❌❌❌❌❌

 元音字母包括 'a'、'e'、'i'、'o'、'u'，且可能以大小写两种形式出现不止一次。


 */

+ (NSArray *)reverseStr:(NSString *)oriStr {
    NSArray *yuanArray = @[@"a", @"e", @"i", @"o", @"u"];
    NSMutableArray *oriArray = [NSMutableArray array];
    for (int i = 0 ; i < oriStr.length; i++) {
        [oriArray addObject:[oriStr substringWithRange:NSMakeRange(i, 1)]];
    }
    
    return [self reverseYuan:oriArray start:0 end:oriArray.count - 1];
    
}

+ (NSArray *)reverseYuan:(NSArray *)oriArray start:(NSInteger)start end:(NSInteger)end {
    NSArray *yuanArray = @[@"a", @"e", @"i", @"o", @"u"];
    NSMutableArray *array = [NSMutableArray arrayWithArray:oriArray];
    NSInteger left = -1;
    NSInteger right = -1;
    while (start < end) {
        if ([yuanArray containsObject:[array[start] lowercaseString]] && left == -1) {
            left = start;
            start ++;
        }
        
        if ([yuanArray containsObject:[array[end] lowercaseString]] && right == -1) {
            right = end;
            end --;
        }
        
        if (left > 0 && right > 0) {
            [array exchangeObjectAtIndex:left withObjectAtIndex:right];
            left = -1;
            right = -1;
        }
    }
    return array;
}


@end
