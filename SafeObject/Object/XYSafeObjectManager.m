//
//  XYSafeObjectManager.m
//  XYSafeObject
//
//  Created by XYMac on 2020/12/2.
//

#import "XYSafeObjectManager.h"
#import "NSObject+SelectorCrash.h"
#import "NSObject+KVOCrash.h"
#import "NSObject+NSNotificationCrash.h"
#import "NSTimer+Crash.h"
#import "NSArray+XYSafe.h"
#import "NSMutableArray+XYSafe.h"
#import "NSDictionary+XYSafe.h"
#import "NSMutableDictionary+XYSafe.h"
#import "NSString+XYSafe.h"
#import "NSMutableString+XYSafe.h"
#import "NSAttributedString+XYSafe.h"
#import "NSMutableAttributedString+XYSafe.h"

@implementation XYSafeObjectManager

+ (void)makeAllEffective {
    [self _startAllComponents];
}

+ (void)configCrashProtectorService:(XYCrashProtectorStyle)protectorType {
   
    switch (protectorType) {
        case     XYCrashProtectorNone:
            
            break;
        case     XYCrashProtectorAll:
        {
            [self _startAllComponents];
        }
            break;
        case XYCrashProtectorUnrecognizedSelector:
            [NSObject xy_enableSelectorProtector];
            break;
        case XYCrashProtectorKVO:
            [NSObject xy_enableKVOProtector];
            break;
        case XYCrashProtectorNotification:
            [NSObject xy_enableNotificationProtector];
            break;
        case XYCrashProtectorTimer:
            [NSTimer xy_enableTimerProtector];
            break;
        case XYCrashProtectorContainer: {
            [NSArray xy_enableArrayProtector];
            [NSMutableArray xy_enableMutableArrayProtector];
            
            [NSDictionary xy_enableDictionaryProtector];
            [NSMutableDictionary xy_enableMutableDictionaryProtector];
        }
            break;
        case XYCrashProtectorString: {
            [NSString xy_enableStringProtector];
            [NSMutableString xy_enableMutableStringProtector];
            
            [NSAttributedString xy_enableAttributedStringProtector];
            [NSMutableAttributedString xy_enableMutableAttributedStringProtector];
        }
            break;
            
        default:
            break;
    }
}

//+ (void)configCrashProtectorServices:(NSArray *)protectorTypes {
//    
//    for (NSNumber *numb in protectorTypes) {
//        
//        [self configCrashProtectorService:[numb integerValue]];
//    }
//}

+ (void)_startAllComponents {
    [NSObject xy_enableSelectorProtector];
    [NSObject xy_enableKVOProtector];
    [NSObject xy_enableNotificationProtector]; // 可能会有性能问题，dealloc里面加了判断，系统的每个对象dealloc时都会调用
    
    [NSTimer xy_enableTimerProtector];
    [NSArray xy_enableArrayProtector];
    [NSMutableArray xy_enableMutableArrayProtector];
    
    [NSDictionary xy_enableDictionaryProtector];
    [NSMutableDictionary xy_enableMutableDictionaryProtector];
    
    [NSString xy_enableStringProtector];
    [NSMutableString xy_enableMutableStringProtector];
    
    [NSAttributedString xy_enableAttributedStringProtector];
    [NSMutableAttributedString xy_enableMutableAttributedStringProtector];
}

@end
