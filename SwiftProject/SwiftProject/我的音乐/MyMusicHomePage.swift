//
//  MyMusicHomePage.swift
//  SwiftProject
//
//  Created by 王涛 on 15/12/14.
//  Copyright © 2015年 王涛. All rights reserved.
//

import Foundation
import UIKit

class MyMusicHomePage: UIViewController {
    override func viewDidLoad() {
        self.title = "我的音乐"
        self.view.backgroundColor = UIColor.themePinkColor()
        
        // test
        let testString = "fff";
        testString.textSizeWith(0.1, width: 0.2);
    }
}