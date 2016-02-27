//
//  MyView.swift
//  SwiftProject
//
//  Created by qingqing on 16/2/26.
//  Copyright © 2016年 王涛. All rights reserved.
//

import UIKit

@IBDesignable

class MyView: UIView {

    @IBOutlet weak var label: UILabel!
    @IBInspectable var textColor: UIColor {
        didSet {
//            self.label.textColor = textColor // Does not work
            
            self.layer.backgroundColor  = textColor.CGColor // work fine
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.textColor          = UIColor.blackColor()
        
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        self.textColor          = UIColor.blackColor()
        
        super.init(frame: frame)
    }
}
