//
//  NSObject+NSNotificationCrash.h
//  XYSafeObject
//
//  Created by XYMac on 2020/12/2.
//

#import <Foundation/Foundation.h>

/**
 当一个对象添加了notification之后，如果dealloc的时候，仍然持有notification，就会出现NSNotification类型的crash。
 
 iOS9之后专门针对于这种情况做了处理，所以在iOS9之后，即使开发者没有移除observer，Notification crash也不会再产生了
 */

@interface NSObject (NSNotificationCrash)

+ (void)xy_enableNotificationProtector;

@end
