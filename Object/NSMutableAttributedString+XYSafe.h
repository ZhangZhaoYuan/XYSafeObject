//
//  NSMutableAttributedString+XYSafe.h
//  XYSafeObject
//
//  Created by XYMac on 2020/12/2.
//

/**
 *  Can avoid crash method
 *
 *  1.- (instancetype)initWithString:(NSString *)str
 *  2.- (instancetype)initWithString:(NSString *)str attributes:(NSDictionary<NSString *,id> *)attrs
 */
#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (XYSafe)

+ (void)xy_enableMutableAttributedStringProtector;

@end
