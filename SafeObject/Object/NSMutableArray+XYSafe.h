//
//  NSMutableArray+XYSafe.h
//  XYSafeObject
//
//  Created by XYMac on 2020/12/2.
//


/**
 *  Can avoid crash method
 *
 *  1. - (id)objectAtIndex:(NSUInteger)index
 *  2. - (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx
 *  3. - (void)removeObjectAtIndex:(NSUInteger)index
 *  4. - (void)insertObject:(id)anObject atIndex:(NSUInteger)index
 *  5. - (void)getObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range
 */
#import <Foundation/Foundation.h>

@interface NSMutableArray (XYSafe)

+ (void)xy_enableMutableArrayProtector;

@end
