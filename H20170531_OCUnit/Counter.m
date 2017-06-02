//
//  Counter.m
//  H20170531_OCUnit
//
//  Created by hw on 2017/5/31.
//  Copyright © 2017年 GaiaMagic. All rights reserved.
//

#import "Counter.h"

@implementation Counter

- (id)initWithUserDefault:(NSUserDefaults *)defaults{

    self = [super init];
    if (self) {
        _defaults = defaults;
        _count = [self getCountInDefaults];
    }
    return self;
}

- (void)increment{

    _count = [self getCountInDefaults] + 1;
    [_defaults setObject:[NSNumber numberWithInt:_count] forKey:CountInDefaultID];
    [[NSNotificationCenter defaultCenter] postNotificationName:CounterModelChanged object:self];
}

- (void)decrement{

    _count = [self getCountInDefaults] - 1;
    [_defaults setObject:[NSNumber numberWithInt:_count] forKey:CountInDefaultID];
    [[NSNotificationCenter defaultCenter] postNotificationName:CounterModelChanged object:self];
}

- (int)getCountInDefaults{
    
    NSNumber *reminderId = [_defaults objectForKey:CountInDefaultID];
    if (reminderId) {
        reminderId = reminderId;
    } else {
        reminderId = @0;
    }
    return reminderId.intValue;
}

@end
