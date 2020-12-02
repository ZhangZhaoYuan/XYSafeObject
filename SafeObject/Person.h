//
//  ViewController.h
//  XYSafeObject
//

//  Created by XYMac on 2020/12/2.
//


#import <Foundation/Foundation.h>

//==================================================
//   本类的作用是用来测试unrecoganized selector的处理情况
//==================================================
@interface Person : NSObject

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age height:(float)height weight:(float)weight;

@end
