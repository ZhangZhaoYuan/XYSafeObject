//
//  XYSafeObjectManager.h
//  XYSafeObject
//
//  Created by XYMac on 2020/12/2.
//

/**
 ** 建议实际开发的时候关闭该组件，以便及时发现crash bug，需要上架或者演示的时候开启crash防护组件。 **
 *  该组件会占用一定内存，不过正常情况下不影响性能
 */

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, XYCrashProtectorStyle) {
    XYCrashProtectorNone = 0,
    XYCrashProtectorAll ,
    XYCrashProtectorUnrecognizedSelector,
    XYCrashProtectorKVO ,
    XYCrashProtectorNotification ,
    XYCrashProtectorTimer ,
    XYCrashProtectorContainer ,
    XYCrashProtectorString ,
};

@interface XYSafeObjectManager : NSObject

@property(nonatomic,assign) XYCrashProtectorStyle style;


/**
 启动所有组件
 */
+ (void)makeAllEffective;


/**
 单独启动组件

 @param protectorType 启动的组件类型
 */
+ (void)configCrashProtectorService:(XYCrashProtectorStyle)protectorType;



/**
 启动一组组件

 @param protectorTypes 启动的组件类型数组
 */
//+ (void)configCrashProtectorServices:(NSArray *)protectorTypes;

@end
