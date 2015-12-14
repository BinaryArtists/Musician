//
//  UIView+Frame.swift
//  SwiftProject
//
//  Created by 王涛 on 15/12/14.
//  Copyright © 2015年 王涛. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    var x:CGFloat {
        get {
            return self.frame.origin.x
        }
        
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
        
    }
    var y:CGFloat {
        get {
            return self.frame.origin.y
        }
        
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    var bottom:CGFloat {
        return CGRectGetMaxY(self.frame)
    }
    
    var right:CGFloat {
        return CGRectGetMaxX(self.frame)
    }
    
    var width:CGFloat {
        get {
            return CGRectGetWidth(self.frame)
        }
        
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    var height:CGFloat {
        get {
            return CGRectGetHeight(self.frame)
        }
        
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    var origin:CGPoint {
        get {
            return self.frame.origin
        }
        
        set {
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
    }
    
    var size:CGSize {
        get {
            return self.frame.size
        }
        
        set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }
    
    var centeX:CGFloat {
        get {
            return self.center.x;
        }
        
        set {
            self.center.x = newValue
        }
    }

    var centerY:CGFloat {
        get {
            return self.center.y;
        }
        
        set {
            self.center.y = newValue
        }
    }

    
}