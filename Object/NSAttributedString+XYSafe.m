//
//  NSAttributedString+XYSafe.m
//  XYSafeObject
//
//  Created by XYMac on 2020/12/2.
//

#import "NSAttributedString+XYSafe.h"
#import "NSObject+XYSwizzle.h"

@implementation NSAttributedString (XYSafe)

+ (void)xy_enableAttributedStringProtector {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class NSConcreteAttributedString = NSClassFromString(@"NSConcreteAttributedString");
        
        //initWithString:
        [self xy_instanceSwizzleMethodWithClass:NSConcreteAttributedString orginalMethod:@selector(initWithString:) replaceMethod:@selector(xy_initWithString:)];
        //initWithAttributedString
        [self xy_instanceSwizzleMethodWithClass:NSConcreteAttributedString orginalMethod:@selector(initWithAttributedString:) replaceMethod:@selector(xy_initWithAttributedString:)];

        //initWithString:attributes:
        [self xy_instanceSwizzleMethodWithClass:NSConcreteAttributedString orginalMethod:@selector(initWithString:attributes:) replaceMethod:@selector(xy_initWithString:attributes:)];
    });
}

- (instancetype)xy_initWithString:(NSString *)str {
    id object = nil;
    
    @try {
        object = [self xy_initWithString:str];
    }
    @catch (NSException *exception) {
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:XYCrashDefaultReturnNil];
    }
    @finally {
        return object;
    }
}

#pragma mark - initWithAttributedString
- (instancetype)xy_initWithAttributedString:(NSAttributedString *)attrStr {
    id object = nil;
    
    @try {
        object = [self xy_initWithAttributedString:attrStr];
    }
    @catch (NSException *exception) {
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:XYCrashDefaultReturnNil];
    }
    @finally {
        return object;
    }
}

#pragma mark - initWithString:attributes:

- (instancetype)xy_initWithString:(NSString *)str attributes:(NSDictionary<NSString *,id> *)attrs {
    id object = nil;
    
    @try {
        object = [self xy_initWithString:str attributes:attrs];
    }
    @catch (NSException *exception) {
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:XYCrashDefaultReturnNil];
    }
    @finally {
        return object;
    }
}

@end
