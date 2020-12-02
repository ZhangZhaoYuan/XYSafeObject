//
//  NSMutableDictionary+XYSafe.h
//  XYSafeObject
//
//  Created by XYMac on 2020/12/2.
//

/**
 * setValue forKey 的值可设置nil，不会crash
 *
 *  Can avoid crash method
 *
 *  1. - (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey
 *  2. - (void)removeObjectForKey:(id)aKey
 *
 */

@interface NSMutableDictionary (XYSafe)

+ (void)xy_enableMutableDictionaryProtector;

@end
