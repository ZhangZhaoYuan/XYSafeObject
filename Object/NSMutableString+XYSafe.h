//
//  NSMutableString+XYSafe.h
//  XYSafeObject
//
//  Created by XYMac on 2020/12/2.
//

/**
 *  Can avoid crash method
 *
 *  1. 由于NSMutableString是继承于NSString,所以这里和NSString有些同样的方法就不重复写了
 *  2. - (void)replaceCharactersInRange:(NSRange)range withString:(NSString *)aString
 *  3. - (void)insertString:(NSString *)aString atIndex:(NSUInteger)loc
 *  4. - (void)deleteCharactersInRange:(NSRange)range
 *
 */
#import <Foundation/Foundation.h>

@interface NSMutableString (XYSafe)

+ (void)xy_enableMutableStringProtector;

@end
