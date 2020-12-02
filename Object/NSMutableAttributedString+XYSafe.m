//
//  NSMutableAttributedString+XYSafe.m
//  XYSafeObject
//
//  Created by XYMac on 2020/12/2.
//

#import "NSMutableAttributedString+XYSafe.h"
#import "NSObject+XYSwizzle.h"

@implementation NSMutableAttributedString (XYSafe)

+ (void)xy_enableMutableAttributedStringProtector {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class NSConcreteMutableAttributedString = NSClassFromString(@"NSConcreteMutableAttributedString");
        
        //initWithString:
        [self xy_instanceSwizzleMethodWithClass:NSConcreteMutableAttributedString orginalMethod:@selector(initWithString:) replaceMethod:@selector(xy_initWithString:)];

        //initWithString:attributes:
        [self xy_instanceSwizzleMethodWithClass:NSConcreteMutableAttributedString orginalMethod:@selector(initWithString:attributes:) replaceMethod:@selector(xy_initWithString:attributes:)];
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
