//
//  NSArray+XYSafe.m
//  XYSafeObject
//
//  Created by XYMac on 2020/12/2.
//

/**
 
 iOS 8:下都是__NSArrayI
 iOS11: 之后分 __NSArrayI、  __NSArray0、__NSSingleObjectArrayI
 
 iOS11之前：arr@[]  调用的是[__NSArrayI objectAtIndexed]
 iOS11之后：arr@[]  调用的是[__NSArrayI objectAtIndexedSubscript]
 
 arr为空数组
 *** -[__NSArray0 objectAtIndex:]: index 12 beyond bounds for empty NSArray
 
 arr只有一个元素
 *** -[__NSSingleObjectArrayI objectAtIndex:]: index 12 beyond bounds [0 .. 0]
 
 */

#import "NSArray+XYSafe.h"
#import "NSObject+XYSwizzle.h"

@implementation NSArray (XYSafe)

+ (void)xy_enableArrayProtector {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //====================
        //   instance method
        //====================
        Class __NSArray = objc_getClass("NSArray");
        Class __NSArrayI = objc_getClass("__NSArrayI");
        Class __NSSingleObjectArrayI = objc_getClass("__NSSingleObjectArrayI");
        Class __NSArray0 = objc_getClass("__NSArray0");
        
        [self xy_classSwizzleMethodWithClass:__NSArray orginalMethod:@selector(arrayWithObjects:count:) replaceMethod:@selector(xy_arrayWithObjects:count:)];
        
        // objectAtIndex:
        /* 数组count >= 2 */
        [self xy_instanceSwizzleMethodWithClass:__NSArrayI orginalMethod:@selector(objectAtIndex:) replaceMethod:@selector(xy_objectAtIndex:)];//[arr objectAtIndex:];
        
        [self xy_instanceSwizzleMethodWithClass:__NSArrayI orginalMethod:@selector(objectAtIndexedSubscript:) replaceMethod:@selector(xy_objectAtIndexedSubscript:)];//arr[];
        
        /* 数组为空 */
        [self xy_instanceSwizzleMethodWithClass:__NSArray0 orginalMethod:@selector(objectAtIndex:) replaceMethod:@selector(xy_objectAtIndexedNullarray:)];
        
        /* 数组count == 1 */
        [self xy_instanceSwizzleMethodWithClass:__NSSingleObjectArrayI orginalMethod:@selector(objectAtIndex:) replaceMethod:@selector(xy_objectAtIndexedArrayCountOnlyOne:)];
        
        // objectsAtIndexes:
        [self xy_instanceSwizzleMethodWithClass:__NSArray orginalMethod:@selector(objectsAtIndexes:) replaceMethod:@selector(xy_objectsAtIndexes:)];
        
        // 以下方法调用频繁，替换可能会影响性能
        // getObjects:range:
        [self xy_instanceSwizzleMethodWithClass:__NSArray orginalMethod:@selector(getObjects:range:) replaceMethod:@selector(xy_getObjectsNSArray:range:)];
        [self xy_instanceSwizzleMethodWithClass:__NSSingleObjectArrayI orginalMethod:@selector(getObjects:range:) replaceMethod:@selector(xy_getObjectsNSSingleObjectArrayI:range:)];
        [self xy_instanceSwizzleMethodWithClass:__NSArrayI orginalMethod:@selector(getObjects:range:) replaceMethod:@selector(xy_getObjectsNSArrayI:range:)];
        
    });
}

#pragma mark - instance array
+ (instancetype)xy_arrayWithObjects:(const id  _Nonnull __unsafe_unretained *)objects count:(NSUInteger)cnt {
    
    id instance = nil;
    
    @try {
        instance = [self xy_arrayWithObjects:objects count:cnt];
    }
    @catch (NSException *exception) {
        
        NSString *defaultToDo = @"This framework default is to remove nil object and instance a array.";
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:defaultToDo];

        //以下是对错误数据的处理，把为nil的数据去掉,然后初始化数组
        NSInteger newObjsIndex = 0;
        id  _Nonnull __unsafe_unretained newObjects[cnt];
        
        for (int i = 0; i < cnt; i++) {
            if (objects[i] != nil) {
                newObjects[newObjsIndex] = objects[i];
                newObjsIndex++;
            }
        }
        instance = [self xy_arrayWithObjects:newObjects count:newObjsIndex];
    }
    @finally {
        return instance;
    }
}


- (id)xy_objectAtIndex:(NSUInteger)index {
//    if (index >= self.count) {
//        [XYCrashLog printCrashMsg:[NSString stringWithFormat:@"-%s: index %ld beyond bounds [0 .. %lu]",__func__,index,(unsigned long)self.count]];
//        return nil;
//    }
//    return [self xy_objectAtIndex:index];
    
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
        object = [self xy_objectAtIndexedSubscript:index];
    }
    @catch (NSException *exception) {
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
        return object;
    }
}

- (id)xy_objectAtIndexedNullarray:(NSUInteger)index {
    id object = nil;
    @try {
        object = [self xy_objectAtIndexedNullarray:index];
    }
    @catch (NSException *exception) {
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
        return object;
    }
}

- (id)xy_objectAtIndexedArrayCountOnlyOne:(NSUInteger)index {
    id object = nil;
    @try {
        object = [self xy_objectAtIndexedArrayCountOnlyOne:index];
    }
    @catch (NSException *exception) {
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:@""];
    }
    @finally {
        return object;
    }
}

- (NSArray *)xy_objectsAtIndexes:(NSIndexSet *)indexes {
    NSArray *returnArray = nil;
    @try {
        returnArray = [self xy_objectsAtIndexes:indexes];
    } @catch (NSException *exception) {
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:XYCrashDefaultReturnNil];
        
    } @finally {
        return returnArray;
    }
}

#pragma mark getObjects:range:
- (void)xy_getObjectsNSArray:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    @try {
        [self xy_getObjectsNSArray:objects range:range];
    } @catch (NSException *exception) {
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:XYCrashDefaultReturnIgnore];
    } @finally {
    }
}

- (void)xy_getObjectsNSSingleObjectArrayI:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    @try {
        [self xy_getObjectsNSSingleObjectArrayI:objects range:range];
    } @catch (NSException *exception) {
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:XYCrashDefaultReturnIgnore];
    } @finally {
    }
}

- (void)xy_getObjectsNSArrayI:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    @try {
        [self xy_getObjectsNSArrayI:objects range:range];
    } @catch (NSException *exception) {
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:XYCrashDefaultReturnIgnore];
    } @finally {
    }
}

@end
