//
//  NSDictionary+XYSafe.h
//  XYSafeObject
//
//  Created by XYMac on 2020/12/2.
//


/**
 *  Can avoid crash method
 *
 *  1. NSDictionary的快速创建方式 NSDictionary *dict = @{@"frameWork" : @"AvoidCrash"}; //这种创建方式其实调用的是2中的方法
 *  2. +(instancetype)dictionaryWithObjects:(const id  _Nonnull __unsafe_unretained *)objects forKeys:(const id<NSCopying>  _Nonnull __unsafe_unretained *)keys count:(NSUInteger)cnt
 *
 */

@interface NSDictionary (XYSafe)

+ (void)xy_enableDictionaryProtector;

@end
