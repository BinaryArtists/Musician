//
//  SwiftTests.swift
//  SwiftProject
//
//  Created by qingqing on 16/2/16.
//  Copyright © 2016年 王涛. All rights reserved.
//

import XCTest

//
class TestTeacher: Teacher {

}

//

class SwiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        /**
         * 1. 继承
         */
        let aTestTeacher = TestTeacher.init(name: "夏老师")
        
        print(""+aTestTeacher.introduceSelf())
        
        /**
        *   2. 引用oc的类
        */
        let aTeacher    = Teacher.init(name: "大汉老师")
        print(""+aTeacher.introduceSelf())
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
