//
//  H20170531_OCUnitTests.m
//  H20170531_OCUnitTests
//
//  Created by hw on 2017/5/31.
//  Copyright © 2017年 GaiaMagic. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCHamcrest/OCHamcrest.h>
#import <OCMockito/OCMockito.h>
#import "Counter.h"

@interface H20170531_OCUnitTests : XCTestCase

@end

@implementation H20170531_OCUnitTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
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

- (void)testInitShouldNotReturnNil{
    
    Counter *counter = [[Counter alloc] initWithUserDefault:[NSUserDefaults standardUserDefaults]];
    //使用OCHamcrest断言工具
    assertThat(counter, instanceOf([Counter class]));
}

@end
