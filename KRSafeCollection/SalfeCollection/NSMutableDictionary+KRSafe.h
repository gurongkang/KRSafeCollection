//
//  NSMutableDictionary+KRSafe.h
//  KRSafeCollection
//
//  Created by RK on 2017/12/8.
//  Copyright © 2017年 RK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (KRSafe)

/**
 向字典中添加key value，如果value为空啥也不做
 
 @param object 插入值
 @param key 插入对象
 */
- (void)kr_safeSetObject:(id)object forKey:(id)key;


/**
 插入key  value
 如果key为空则什么也不做, 如果object为空则使用默认值，如果默认值也为空，则什么也不做

 @param object 插入值
 @param key 插入key
 @param defaultObject 默认值
 */
- (void)kr_safeSetObject:(id)object forKey:(id)key defaultObject:(id)defaultObject;

@end
