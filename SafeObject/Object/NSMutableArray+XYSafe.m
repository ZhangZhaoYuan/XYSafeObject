//
//  NSMutableArray+XYSafe.m
//  XYSafeObject
//
//  Created by XYMac on 2020/12/2.
//

#import "NSMutableArray+XYSafe.h"
#import "NSObject+XYSwizzle.h"

@implementation NSMutableArray (XYSafe)

+ (void)xy_enableMutableArrayProtector {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //====================
        //   instance method
        //====================
        Class __NSArrayM = NSClassFromString(@"__NSArrayM");

        
        // objectAtIndex:
        [self xy_instanceSwizzleMethodWithClass:__NSArrayM orginalMethod:@selector(objectAtIndex:) replaceMethod:@selector(xy_objectAtIndex:)]; 
        
        [self xy_instanceSwizzleMethodWithClass:__NSArrayM orginalMethod:@selector(objectAtIndexedSubscript:) replaceMethod:@selector(xy_objectAtIndexedSubscript:)];

        //insertObject:atIndex:
        [self xy_instanceSwizzleMethodWithClass:__NSArrayM orginalMethod:@selector(insertObject:atIndex:) replaceMethod:@selector(xy_insertObject:atIndex:)];

        //removeObjectAtIndex:
        [self xy_instanceSwizzleMethodWithClass:__NSArrayM orginalMethod:@selector(removeObjectAtIndex:) replaceMethod:@selector(xy_removeObjectAtIndex:)];

        //setObject:atIndexedSubscript:
        [self xy_instanceSwizzleMethodWithClass:__NSArrayM orginalMethod:@selector(setObject:atIndexedSubscript:) replaceMethod:@selector(xy_setObject:atIndexedSubscript:)];

        [self xy_instanceSwizzleMethodWithClass:__NSArrayM orginalMethod:@selector(getObjects:range:) replaceMethod:@selector(xy_getObjects:range:)];

    });
}

- (id)xy_objectAtIndex:(NSUInteger)index {
    id object = nil;
    @try {
        object = [self xy_objectAtIndex:index];
    }
    @catch (NSException *exception) {
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
        return object;
    }
}

- (id)xy_objectAtIndexedSubscript:(NSUInteger)index {
    id object = nil;
    @try {
        object = [self xy_objectAtIndex:index];
    }
    @catch (NSException *exception) {
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
        return object;
    }
}

- (void)xy_insertObject:(id)anObject atIndex:(NSUInteger)index {
    @try {
        [self xy_insertObject:anObject atIndex:index];
    }
    @catch (NSException *exception) {
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
    }
}

- (void)xy_removeObjectAtIndex:(NSUInteger)index {
    @try {
        [self xy_removeObjectAtIndex:index];
    }
    @catch (NSException *exception) {
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
    }
}

- (void)xy_setObject:(id)obj atIndexedSubscript:(NSUInteger)idx {
    @try {
        [self xy_setObject:obj atIndexedSubscript:idx];
    }
    @catch (NSException *exception) {
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
    }
}

- (void)xy_getObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    @try {
        [self xy_getObjects:objects range:range];
    } @catch (NSException *exception) {
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:@""];
    } @finally {
    }
}

@end
