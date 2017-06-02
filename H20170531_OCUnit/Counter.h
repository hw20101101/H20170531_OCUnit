//
//  Counter.h
//  H20170531_OCUnit
//
//  Created by hw on 2017/5/31.
//  Copyright © 2017年 GaiaMagic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Counter : NSObject

@property (assign, nonatomic) int count;
@property (strong, nonatomic) NSUserDefaults *defaults;

- (id)initWithUserDefault:(NSUserDefaults *)defaults;
- (void)increment;
- (void)decrement;
- (int)getCountInDefaults;

@end
