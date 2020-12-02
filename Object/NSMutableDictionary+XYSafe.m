//
//  NSMutableDictionary+XYSafe.m
//  XYSafeObject
//
//  Created by XYMac on 2020/12/2.
//

#import "NSMutableDictionary+XYSafe.h"
#import "NSObject+XYSwizzle.h"

@implementation NSMutableDictionary (XYSafe)

+ (void)xy_enableMutableDictionaryProtector {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class dictionaryM = NSClassFromString(@"__NSDictionaryM");
        
        //setObject:forKey:
        [self xy_instanceSwizzleMethodWithClass:dictionaryM orginalMethod:@selector(setObject:forKey:) replaceMethod:@selector(xy_setObject:forKey:)];
        
        // iOS11
        [self xy_instanceSwizzleMethodWithClass:dictionaryM orginalMethod:@selector(setObject:forKeyedSubscript:) replaceMethod:@selector(xy_setObject:forKeyedSubscript:)];

        
        //removeObjectForKey:
        [self xy_instanceSwizzleMethodWithClass:dictionaryM orginalMethod:@selector(removeObjectForKey:) replaceMethod:@selector(xy_removeObjectForKey:)];

    });
}

- (void)xy_setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    
    @try {
        [self xy_setObject:anObject forKey:aKey];
    }
    @catch (NSException *exception) {
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
    }
}

- (void)xy_setObject:(id)anObject forKeyedSubscript:(id<NSCopying>)aKey {
    
    @try {
        [self xy_setObject:anObject forKeyedSubscript:aKey];
    }
    @catch (NSException *exception) {
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
    }
}

- (void)xy_removeObjectForKey:(id)aKey {
    
    @try {
        [self xy_removeObjectForKey:aKey];
    }
    @catch (NSException *exception) {
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
    }
}

@end
