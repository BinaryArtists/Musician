//
//  OCTests.m
//  SwiftProject
//
//  Created by qingqing on 16/2/16.
//  Copyright © 2016年 王涛. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "SwiftProjectTests-swift.h"

/**
 *  1. 继承
 
 *  不允许
 */

//@interface TestStudent : Student
//
//@end

@interface OCTests : XCTestCase <StudentDelegate>

@end

@implementation OCTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    /**
     * 1. 继承
     */
    // failed
    
    /**
     *   2. 类引用
     */
    Student *aStudent    = [[Student alloc] initFromName:@"安老师"];
    NSLog(@"%@", [aStudent introduceSelf]);
    
    /**
     * 3.
     */
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

#pragma mark - StudentDelegate

- (void)testFunc {
    
}

@end
