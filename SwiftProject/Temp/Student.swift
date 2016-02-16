//
//  Student.swift
//  SwiftProject
//
//  Created by qingqing on 16/2/16.
//  Copyright © 2016年 王涛. All rights reserved.
//

import UIKit

class Student: NSObject {
    
    let name: String
    
    init(fromName name:String) {
        self.name   = name
    }
    
    func introduceSelf() -> String {
        let theName = self.dynamicType
        return self.name+String(theName)
    }

}