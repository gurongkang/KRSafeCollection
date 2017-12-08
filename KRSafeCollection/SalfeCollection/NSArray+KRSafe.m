//
//  NSArray+KRSafe.m
//  KRSafeCollection
//
//  Created by RK on 2017/12/8.
//  Copyright © 2017年 RK. All rights reserved.
//

#import "NSArray+KRSafe.h"

@implementation NSArray (KRSafe)

- (id)kr_safeObjectAtIndex:(NSUInteger)index {
    if (self.count == 0 || index > self.count - 1) {
#ifndef DEBUG
        NSAssert3(false, @"%@ 数组大小:%tu, 游标%tu越界!", NSStringFromSelector(_cmd), self.count, index);
#else
    NSLog(@"%@ 数组大小:%tu, 游标%tu越界!", NSStringFromSelector(_cmd), self.count, index);
#endif
        return nil;
    }
    return [self objectAtIndex:index];
}

@end

@implementation NSMutableArray(KRSafe)

- (void)kr_safeAddObject:(id)object {
    if (object == nil) {
#ifndef DEBUG
        NSAssert1(false, @"%@ 添加对象为nil!", NSStringFromSelector(_cmd));
#else
        NSLog(@"%@ 添加对象为nil!", NSStringFromSelector(_cmd));
#endif
    } else {
        [self addObject:object];
    }
}

- (void)kr_safeAddObjectFromArray:(NSArray *)array {
    if (array == nil) {
#ifndef DEBUG
        NSAssert1(false, @"%@ 增加数组为空数组!", NSStringFromSelector(_cmd));
#else
        NSLog(@"%@ 增加数组为空数组!", NSStringFromSelector(_cmd));
#endif
    } else {
        [self removeObjectsInArray:array];
    }
}

- (void)kr_safeRemoveObjectAtIndex:(NSUInteger)index {
    if (self.count == 0 || self.count > index - 1) {
#ifndef DEBUG
        NSAssert3(false, @"%@ 数组大小:%tu, 游标%tu越界！", NSStringFromSelector(_cmd), self.count, index);
#else
        NSLog(@"%@ 数组大小:%tu, 游标%tu越界!", NSStringFromSelector(_cmd), self.count, index);
#endif
    }
    [self removeObjectAtIndex:index];
}

- (void)kr_safeRemoveOBject:(id)object {
    if(object == nil) {
#ifndef DEBUG
        NSAssert1(false, @"%@ 删除目标对象为空！", NSStringFromSelector(_cmd));
#else
        NSLog(@"%@ 删除目标对象为空！", NSStringFromSelector(_cmd));
#endif
    } else {
        [self removeObject:object];
    }
}

- (void)kr_safeRemoveObjectsInArray:(NSArray *)array {
    if (array == nil) {
#ifndef DEBUG
        NSAssert1(false, @"%@ 删除数组为空！", NSStringFromSelector(_cmd));
#else
        NSLog(@"%@ 删除数组为空！", NSStringFromSelector(_cmd));
#endif
    } else {
        [self removeObjectsInArray:array];
    }
}


- (void)kr_safeInsertObject:(id)object atIndex:(NSUInteger)index {
    if (object == nil) {
#ifndef DEBUG
        NSAssert1(false, @"%@ 插入对象为空！",  NSStringFromSelector(_cmd));
#else
        NSLog(@"%@ 插入对象为空！",  NSStringFromSelector(_cmd));
#endif
    } else {
        if (self.count == 0 || index > self.count -1) {
#ifndef DEBUG
            NSAssert3(false,  @"%@ 数组大小:%tu, 插入游标%tu越界!",  NSStringFromSelector(_cmd), self.count, index);
#else
            NSLog(@"%@ 数组大小:%tu, 插入游标%tu越界!", NSStringFromSelector(_cmd), self.count, index);
#endif
            
        } else {
            [self insertObject:object atIndex:index];
        }
    }
}

- (void)kr_safeReplaceObjectAtIdnex:(NSUInteger)index withObject:(id)object {
    if (object == nil) {
#ifndef DEBUG
        NSAssert1(false, @"%@要替代对象为空！",  NSStringFromSelector(_cmd));
#else
        NSLog( @"%@要替代对象为空！",  NSStringFromSelector(_cmd));
#endif
    } else {
        if (self.count == 0 || index > self.count -1) {
#ifndef DEBUG
            NSAssert3(false, @"%@ 数组大小:%tu, 替换目标游标%tu越界!", NSStringFromSelector(_cmd), self.count, index);
#else
            NSLog(@"%@ 数组大小:%tu, 替换目标游标%tu越界!", NSStringFromSelector(_cmd), self.count, index);
#endif
        } else {
            [self replaceObjectAtIndex:index withObject:object];
        }
    }
}

@end
