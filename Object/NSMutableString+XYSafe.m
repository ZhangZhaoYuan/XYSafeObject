//
//  NSMutableString+XYSafe.m
//  XYSafeObject
//
//  Created by XYMac on 2020/12/2.
//

#import "NSMutableString+XYSafe.h"
#import "NSObject+XYSwizzle.h"

@implementation NSMutableString (XYSafe)

+ (void)xy_enableMutableStringProtector {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class __NSCFString = NSClassFromString(@"__NSCFString");
        
        //replaceCharactersInRange
        [self xy_instanceSwizzleMethodWithClass:__NSCFString orginalMethod:@selector(replaceCharactersInRange:withString:) replaceMethod:@selector(xy_replaceCharactersInRange:withString:)];
        
        //insertString:atIndex:
        [self xy_instanceSwizzleMethodWithClass:__NSCFString orginalMethod:@selector(insertString:atIndex:) replaceMethod:@selector(xy_insertString:atIndex:)];

        //deleteCharactersInRange
        [self xy_instanceSwizzleMethodWithClass:__NSCFString orginalMethod:@selector(deleteCharactersInRange:) replaceMethod:@selector(xy_deleteCharactersInRange:)];
    });
}

#pragma mark - replaceCharactersInRange
- (void)xy_replaceCharactersInRange:(NSRange)range withString:(NSString *)aString {
    @try {
        [self xy_replaceCharactersInRange:range withString:aString];
    }
    @catch (NSException *exception) {
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:XYCrashDefaultReturnIgnore];
    }
    @finally {
    }
}

#pragma mark - insertString:atIndex:
- (void)xy_insertString:(NSString *)aString atIndex:(NSUInteger)loc {
    
    @try {
        [self xy_insertString:aString atIndex:loc];
    }
    @catch (NSException *exception) {
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:XYCrashDefaultReturnIgnore];
    }
    @finally {
    }
}

#pragma mark - deleteCharactersInRange

- (void)xy_deleteCharactersInRange:(NSRange)range {
    
    @try {
        [self xy_deleteCharactersInRange:range];
    }
    @catch (NSException *exception) {
        [XYSafeLog xy_noteErrorWithException:exception attachedTODO:XYCrashDefaultReturnIgnore];
    }
    @finally {
    }
}

@end
