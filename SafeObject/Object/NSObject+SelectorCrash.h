//
//  NSObject+SelectorCrash.h
//  XYSafeObject
//
//  Created by XYMac on 2020/12/2.
//

#import <Foundation/Foundation.h>

@interface XYUnrecognizedSelectorSolveObject : NSObject

@property (nonatomic, weak) NSObject *objc;

@end

@interface NSObject (SelectorCrash)

+ (void)xy_enableSelectorProtector;

@end
