# KRSafeCollection

> 在开发中需要经常使用`NSArray`、  `NSDictionary`, 在使用的过程中经常经常因为不注意会导致数组的越界和插入的对象为nil导致App闪退
 
  为解决上述问题封装了两个分类

## NSArray+KRSafe

安全的数组操作分类，提供了对数组安全性保护，防止数组越界、插入对象的安全。

以获取indx位置的值方法为例说明实现原理:

```objc
/**
 获取index位置的 object

 @param index 位置
 @return index位置的object
 */
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
```
通过分类对`objectAtIndex`进行包装一层。在方法里面判断index是否越界，在开发环境中如果越界，会直接闪退，并提示错误。在发布的环境中默默的处理掉。

这样在真实发布的App中防止闪退，但在开发环境中并不会保护，便于发现问题。

