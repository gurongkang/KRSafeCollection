//
//  NSMutableDictionary+KRSafe.m
//  KRSafeCollection
//
//  Created by RK on 2017/12/8.
//  Copyright © 2017年 RK. All rights reserved.
//

#import "NSMutableDictionary+KRSafe.h"

@implementation NSMutableDictionary (KRSafe)

- (void)kr_safeSetObject:(id)object forKey:(id)key {
    if (object == nil) {
#ifdef DEBUG
        NSAssert1(false, @"%@ 插入对象为空!", NSStringFromSelector(_cmd));
#else
        NSLog(@"%@ 插入对象为空", NSStringFromSelector(_cmd));
#endif
        return;
    }
    
    if (key == nil) {
#ifdef DEBUG
        NSAssert1(false, @"%@ 插入key为空!", NSStringFromSelector(_cmd));
#else
        NSLog(@"%@ 插入key为空!", NSStringFromSelector(_cmd));
#endif
        return;
    }
    
    [self setObject:object forKey:key];
}

- (void)kr_safeSetObject:(id)object forKey:(id)key defaultObject:(id)defaultObject {
    if (key == nil) {
#ifdef DEBUG
        NSAssert1(false, @"%@ 插入key为空!", NSStringFromSelector(_cmd));
#else
        NSLog(@"%@ 插入key为空!", NSStringFromSelector(_cmd));
#endif
        return;
    }
    id finalObject;
    if (object == nil) {
        NSLog(@"%@ 空对象, 使用默认值!", NSStringFromSelector(_cmd));
        finalObject = defaultObject;
    } else {
        finalObject = object;
    }
    if (finalObject == nil) {
#ifdef DEBUG
        NSAssert1(false, @"%@ 空默认值!", NSStringFromSelector(_cmd));
#else
        NSLog(@"%@ 空默认值!", NSStringFromSelector(_cmd));
#endif
        return;
    }
    [self setObject:finalObject forKey:key];
}

@end
