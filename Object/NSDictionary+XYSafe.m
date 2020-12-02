//
//  NSDictionary+XYSafe.m
//  XYSafeObject
//
//  Created by XYMac on 2020/12/2.
//

#import "NSDictionary+XYSafe.h"
#import "NSObject+XYSwizzle.h"

@implementation NSDictionary (XYSafe)

+ (void)xy_enableDictionaryProtector {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // __NSPlaceholderDictionary
        [self xy_classSwizzleMethodWithClass:self orginalMethod:@selector(dictionaryWithObjects:forKeys:count:) replaceMethod:@selector(xy_dictionaryWithObjects:forKeys:count:)];
    });
}

+ (instancetype)xy_dictionaryWithObjects:(const id  _Nonnull __unsafe_unretained *)objects forKeys:(const id<NSCopying>  _Nonnull __unsafe_unretained *)keys count:(NSUInteger)cnt {
    
    id instance = nil;
    @try {
        instance = [self xy_dictionaryWithObjects:objects forKeys:keys count:cnt];
    }
    @catch (NSException *exception) {
        
        NSString *defaultToDo = @"This framework default is to remove nil key-values and instance a dictionary.";
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:defaultToDo];
        
        //处理错误的数据，然后重新初始化一个字典
        NSUInteger index = 0;
        id  _Nonnull __unsafe_unretained newObjects[cnt];
        id  _Nonnull __unsafe_unretained newkeys[cnt];
        
        for (int i = 0; i < cnt; i++) {
            if (objects[i] && keys[i]) {
                newObjects[index] = objects[i];
                newkeys[index] = keys[i];
                index++;
            }
        }
        instance = [self xy_dictionaryWithObjects:newObjects forKeys:newkeys count:index];
    }
    @finally {
        return instance;
    }
}

@end
