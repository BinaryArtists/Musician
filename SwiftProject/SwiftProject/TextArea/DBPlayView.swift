//
//  DBPlayView.swift
//  SwiftProject
//
//  Created by 王云鹏 on 16/3/4.
//  Copyright © 2016年 王涛. All rights reserved.
//

import UIKit

class DBPlayView: UIView {
    var heightConstant:CGFloat = 60
    var originalFrame:CGRect?
    var showing:Bool = DBFalse
    let topBarHeight:CGFloat = 64
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    init(){
        super.init(frame:CGRectZero)
        setUI()
    }


    func setUI(){
        backgroundColor = UIColor.whiteColor()
        layer.shadowOffset = CGSizeMake(3,2);
        layer.shadowOpacity = 0.6;
        layer.shadowColor = UIColor.blackColor().CGColor
        let pan = UIPanGestureRecognizer(target: self, action: "pan:")
        addGestureRecognizer(pan)
    }
    
    func pan(pan:UIPanGestureRecognizer){
        
        if pan.state == .Began{
            originalFrame = self.frame
        }else if(pan.state == .Changed){
            let translation = pan.translationInView(self)
            if showing{
                heightConstant = DBHeight - topBarHeight - translation.y
            }else{
                heightConstant = 60 - translation.y
            }
            DLog(heightConstant)
            if heightConstant > DBHeight - topBarHeight || heightConstant < 60{
                return
            }
            self.setNeedsUpdateConstraints()
            self.updateConstraintsIfNeeded()
        }else if(pan.state == .Ended){
            let halfHeight = (DBHeight - CGFloat(topBarHeight))/2
            if heightConstant < halfHeight{
                 heightConstant = 60
                 showing = DBFalse
            }else{
                heightConstant = DBHeight - topBarHeight
                showing = DBTrue
            }
            self.snp_updateConstraints(closure: { (make) -> Void in
                make.height.equalTo(heightConstant)
            })
            UIView.animateWithDuration(0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.8, options:UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                    self.layoutIfNeeded()
                }, completion: nil)
            
        }
    }
    
    override func updateConstraints() {
        self.snp_updateConstraints { (make) -> Void in
            make.height.equalTo(heightConstant)
        }
        super.updateConstraints()
    }
    
    override func layoutSubviews() {
        DLog("subViews")
    }
    
    
   required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
}
