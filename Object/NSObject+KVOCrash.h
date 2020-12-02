//
//  NSObject+KVOCrash.h
//  XYSafeObject
//
//  Created by XYMac on 2020/12/2.
//

#import <Foundation/Foundation.h>

@class XYCPKVOInfo;

typedef void (^XYCPKVONotificationBlock)(id _Nullable observer, id _Nullable object, NSDictionary<NSKeyValueChangeKey, id> * _Nullable change);
/**
 KVO的管理者
 KVO Crash fix
 */
@interface KVOProxy :NSObject

- (BOOL)xy_addObserver:(id _Nullable )object KVOinfo:(XYCPKVOInfo *_Nullable)KVOInfo;

- (void)xy_removeObserver:(id _Nullable )object keyPath:(NSString *_Nullable)keyPath block:(void(^_Nullable)(void)) block;

- (void)xy_removeAllObserver;

@end


/**
 KVO配置层
 */
@interface XYCPKVOInfo : NSObject

- (instancetype _Nullable )initWithKeyPath:(NSString *_Nullable)keyPath options:(NSKeyValueObservingOptions)options context:(void *_Nullable)context;

@end

@interface NSObject (KVOCrash)

@property (nonatomic, strong) KVOProxy * _Nullable KVOProxy;

+ (void)xy_enableKVOProtector;

@end
