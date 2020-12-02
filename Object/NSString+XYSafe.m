//
//  NSString+XYSafe.m
//  XYSafeObject
//
//  Created by XYMac on 2020/12/2.
//

#import "NSString+XYSafe.h"
#import "NSObject+XYSwizzle.h"

@implementation NSString (XYSafe)

+ (void)xy_enableStringProtector {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class __NSCFConstantString = NSClassFromString(@"__NSCFConstantString");
        
        //substringFromIndex
        [self xy_instanceSwizzleMethodWithClass:__NSCFConstantString orginalMethod:@selector(substringFromIndex:) replaceMethod:@selector(xy_substringFromIndex:)];
        
        //substringToIndex
        [self xy_instanceSwizzleMethodWithClass:__NSCFConstantString orginalMethod:@selector(substringToIndex:) replaceMethod:@selector(xy_substringToIndex:)];
        
        //substringWithRange:
        [self xy_instanceSwizzleMethodWithClass:__NSCFConstantString orginalMethod:@selector(substringWithRange:) replaceMethod:@selector(xy_substringWithRange:)];
        
        //characterAtIndex
        [self xy_instanceSwizzleMethodWithClass:__NSCFConstantString orginalMethod:@selector(characterAtIndex:) replaceMethod:@selector(xy_characterAtIndex:)];
        
        /* 注意swizzling先后顺序 👇： */
        //stringByReplacingOccurrencesOfString:withString:options:range:
        [self xy_instanceSwizzleMethodWithClass:__NSCFConstantString orginalMethod:@selector(stringByReplacingOccurrencesOfString:withString:options:range:) replaceMethod:@selector(xy_stringByReplacingOccurrencesOfString:withString:options:range:)];

        //stringByReplacingCharactersInRange:withString:
        [self xy_instanceSwizzleMethodWithClass:__NSCFConstantString orginalMethod:@selector(stringByReplacingCharactersInRange:withString:) replaceMethod:@selector(xy_stringByReplacingCharactersInRange:withString:)];
    });
}

//=================================================================
//                           characterAtIndex:
//=================================================================
#pragma mark - characterAtIndex:

- (unichar)xy_characterAtIndex:(NSUInteger)index {
    
    unichar characteristic;
    @try {
        characteristic = [self xy_characterAtIndex:index];
    }
    @catch (NSException *exception) {
        
        NSString *defaultToDo = @"This framework default is to return a without assign unichar.";
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:defaultToDo];
    }
    @finally {
        return characteristic;
    }
}

#pragma mark - substringFromIndex:

- (NSString *)xy_substringFromIndex:(NSUInteger)from {
    
    NSString *subString = nil;
    
    @try {
        subString = [self xy_substringFromIndex:from];
    }
    @catch (NSException *exception) {
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:XYCrashDefaultReturnNil];
        subString = nil;
    }
    @finally {
        return subString;
    }
}

#pragma mark - substringToIndex
- (NSString *)xy_substringToIndex:(NSUInteger)index {
    
    NSString *subString = nil;
    
    @try {
        subString = [self xy_substringToIndex:index];
    }
    @catch (NSException *exception) {
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:XYCrashDefaultReturnNil];
        subString = nil;
    }
    @finally {
        return subString;
    }
}

#pragma mark - stringByReplacingCharactersInRange:withString:

- (NSString *)xy_stringByReplacingCharactersInRange:(NSRange)range withString:(NSString *)replacement {
    
    NSString *newStr = nil;
    
    @try {
        newStr = [self xy_stringByReplacingCharactersInRange:range withString:replacement];
    }
    @catch (NSException *exception) {
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:XYCrashDefaultReturnNil];
        newStr = nil;
    }
    @finally {
        return newStr;
    }
}

- (NSString *)xy_stringByReplacingOccurrencesOfString:(NSRange)range withString:(NSString *)replacement {
    
    NSString *newStr = nil;
    
    @try {
        newStr = [self xy_stringByReplacingOccurrencesOfString:range withString:replacement];
    }
    @catch (NSException *exception) {
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:XYCrashDefaultReturnNil];
        newStr = nil;
    }
    @finally {
        return newStr;
    }
}

#pragma mark - stringByReplacingOccurrencesOfString:withString:options:range:

- (NSString *)xy_stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange {
    
    NSString *newStr = nil;
    
    @try {
        newStr = [self xy_stringByReplacingOccurrencesOfString:target withString:replacement options:options range:searchRange];
    }
    @catch (NSException *exception) {
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:XYCrashDefaultReturnNil];
        newStr = nil;
    }
    @finally {
        return newStr;
    }
}

#pragma mark - substringWithRange:
- (NSString *)xy_substringWithRange:(NSRange)range {
    
    NSString *subString = nil;
    
    @try {
        subString = [self xy_substringWithRange:range];
    }
    @catch (NSException *exception) {
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:XYCrashDefaultReturnNil];
        subString = nil;
    }
    @finally {
        return subString;
    }
}

@end
