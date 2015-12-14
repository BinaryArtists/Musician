//
//  NSString+Size.swift
//  SwiftProject
//
//  Created by 王涛 on 15/12/14.
//  Copyright © 2015年 王涛. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func textSizeWith(fontSize:CGFloat,width:CGFloat)->CGSize{
        let font = UIFont.systemFontOfSize(fontSize)
        let size = CGSizeMake(width, CGFloat.max)
        let text = self as NSString
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .ByWordWrapping;
        let attributes = [NSFontAttributeName:font,NSParagraphStyleAttributeName:paragraphStyle.copy()]
        let rect = text.boundingRectWithSize(size, options: .UsesLineFragmentOrigin, attributes: attributes, context: nil)
        return rect.size
        
    }
    
    func textSizeForOneLineWith(fontSize:CGFloat)->CGSize {
        return self.textSizeWith(fontSize, width: CGFloat.max)
    }

}