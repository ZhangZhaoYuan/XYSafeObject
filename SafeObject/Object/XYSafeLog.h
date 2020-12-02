//
//  XYSafeLog.h
//  XYSafeObject
//
//  Created by XYMac on 2020/12/2.
//

#import <Foundation/Foundation.h>

//user can ignore below define
static NSString * _Nullable XYCrashDefaultReturnNil = @"This framework default is to return nil to avoid crash.";
static NSString * _Nullable XYCrashDefaultReturnIgnore  = @"This framework default is to ignore this operation to avoid crash.";

@interface XYSafeLog : NSObject

@property (nonatomic,copy) NSString * _Nullable crashMsg;

- (void)getCrashMsg;

+ (void)printCrashMsg:(NSString *_Nullable)crashMsg;

+ (void)xy_noteErrorWithException:(NSException *_Nonnull)exception attachedTODO:(NSString *_Nullable)todo;

@end
