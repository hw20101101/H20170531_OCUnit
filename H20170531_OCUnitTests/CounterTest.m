//
//  CounterTest.m
//  H20170531_OCUnit
//
//  Created by hw on 2017/5/31.
//  Copyright © 2017年 GaiaMagic. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCHamcrest/OCHamcrest.h>
#import <OCMockito/OCMockito.h>
#import "Counter.h"

@interface CounterTest : XCTestCase
{
    Counter *sut;
    NSUserDefaults *mockDefaults;
    int modelChangedCount;
    int modelChangedValue;
}
@end

@implementation CounterTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    mockDefaults = mock([NSUserDefaults class]);
    sut = [[Counter alloc] initWithUserDefault: mockDefaults];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(counterModelChanged:) name:CounterModelChanged object:sut];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    sut = nil;
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testGetCountInDefaultsWithNilShouldReturnZero{
    
    [given([mockDefaults objectForKey:CountInDefaultID]) willReturn:nil];
    assertThatInt([sut getCountInDefaults], equalToInt(0));
}

- (void)testGetCountInDefaultsWithNumberThreeShouldReturnIntThree{

    [given([mockDefaults objectForKey:CountInDefaultID]) willReturn:@3];
    assertThatInt([sut getCountInDefaults], equalToInt(3));
}

- (void)counterModelChanged:(NSNotification *)noti{
    
    ++modelChangedCount;
    Counter *counter = (Counter *)[noti object];
    modelChangedValue = counter.count;
}

- (void)testIncrementShouldInvokeSetObject{
    
    [given([mockDefaults objectForKey:CountInDefaultID]) willReturn:@3];
    [sut increment];
    [verify(mockDefaults) setObject:@4 forKey:CountInDefaultID];
}

- (void)testIncrementShouldPostNotificaton{
    
    [given([mockDefaults objectForKey:CountInDefaultID]) willReturn:@3];
    [sut increment];
    assertThatInt(modelChangedCount, is(equalToInt(1)));
    assertThatInt(modelChangedValue, is(equalToInt(4)));
}

@end
