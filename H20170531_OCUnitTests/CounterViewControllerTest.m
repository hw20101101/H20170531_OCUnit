//
//  CounterViewControllerTest.m
//  H20170531_OCUnit
//
//  Created by hw on 2017/5/31.
//  Copyright © 2017年 GaiaMagic. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCHamcrest/OCHamcrest.h>
#import <OCMockito/OCMockito.h>
#import "CounterViewController.h"
#import "Counter.h"

@interface CounterViewControllerTest : XCTestCase
{
    CounterViewController *sut;
    Counter *mockCounter;
}

@end

@implementation CounterViewControllerTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    mockCounter = mock([Counter class]);
//    sut = [[CounterViewController alloc] initWithCounter: mockCounter];
//    [sut view];
    
//    sut = [[NSBundle mainBundle] loadNibNamed:@"CounterViewController" owner:nil options:nil].lastObject;
    
    sut = [UIStoryboard storyboardWithName:@"CounterViewController" bundle:[NSBundle mainBundle]].instantiateInitialViewController;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
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

- (void)testPlusButtonShouldBeConnected{
    
    UIButton *button = [sut plusButton];
    assertThat(button, is(notNilValue()));
}

- (void)testPlusButtonAction{
    
    UIButton *button = [sut plusButton2];
    assertThat([button actionsForTarget:sut forControlEvent:UIControlEventTouchUpInside], contains(@"incrementCount", nil));
}

- (void)testIncrementCountShouldAdkCounterToIncrement{
    
    [sut incrementCount];
    [verify(mockCounter) increment];
}

- (void)testModelChangedNotificationShouldUpdateCountLabel{
    
    [given(mockCounter.count) willReturnInt:2];
    [[NSNotificationCenter defaultCenter] postNotificationName:CounterModelChanged object:mockCounter];
    assertThat([sut counterLabel2].text, is(@"2"));
}

@end
