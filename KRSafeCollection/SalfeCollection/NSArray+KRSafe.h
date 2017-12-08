//
//  NSArray+KRSafe.h
//  KRSafeCollection
//
//  Created by RK on 2017/12/8.
//  Copyright © 2017年 RK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (KRSafe)


/**
 获取index位置的 object

 @param index 位置
 @return index位置的object
 */
- (id)kr_safeObjectAtIndex:(NSUInteger)index;

@end

@interface NSMutableArray (KRSafe)

/**
 末尾添加object，如果object为nil，操作忽略

 @param object 添加的对象
 */
- (void)kr_safeAddObject:(id)object;


/**
末尾批量插增加对象

 @param array 插入对象数组
 */
- (void)kr_safeAddObjectFromArray:(NSArray *)array;

/**
 删除指定index的object

 @param index 删除的位置
 */
- (void)kr_safeRemoveObjectAtIndex:(NSUInteger)index;


/**
 删指定objct，如果objct为nil，操作忽略

 @param object 删除对象
 */
- (void)kr_safeRemoveOBject:(id)object;


/**
 批量删除数组，如果数组对象为nil，操作忽略

 @param array 删除数组
 */
- (void)kr_safeRemoveObjectsInArray:(NSArray *)array;


/**
 在index位置插入object对象

 @param object 插入对象
 @param index 位置
 */
- (void)kr_safeInsertObject:(id)object atIndex:(NSUInteger)index;


/**
 替换index位置的object对象

 @param index 位置
 @param object 新对象
 */
- (void)kr_safeReplaceObjectAtIdnex:(NSUInteger)index withObject:(id)object;

@end
