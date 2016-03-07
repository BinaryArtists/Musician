//
//  DBPlayView.swift
//  SwiftProject
//
//  Created by 王云鹏 on 16/3/4.
//  Copyright © 2016年 王涛. All rights reserved.
//

import UIKit
let topBarHeight:CGFloat = 64

class DBPlayView: UIView {
    var viewHeightConstant:CGFloat = 60
    var imageHeight:CGFloat = 40
    var imageLeftMargin:CGFloat = 12
    var imageTopMargin:CGFloat = 10
    var showing:Bool = DBFalse
    
//MARK:Lazy
    lazy var playImageView:RoundImageView = {
        var imageView = RoundImageView()
        imageView.layer.masksToBounds = DBTrue
        return imageView
    }()
    
//MARK:Life Cycle
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
        setSubviews()
    }
    
    func setSubviews(){
        self.addSubview(self.playImageView)
        self.playImageView.snp_makeConstraints { (make) -> Void in
            make.height.width.equalTo(imageHeight)
            make.left.equalTo(self).offset(imageLeftMargin)
            make.top.equalTo(self).offset(imageTopMargin)
        }
        playImageView.image = UIImage(named: "headerImage")
    }
    
//MARK:GestureRecognizer
    func pan(pan:UIPanGestureRecognizer){
       if(pan.state == .Changed){
            let translation = pan.translationInView(self)
            if showing{
                viewHeightConstant = DBHeight - topBarHeight - translation.y
                imageHeight = DBWidth/2 - translation.y/3.65
                imageLeftMargin = DBWidth/4 - translation.y/7
            }else{
                viewHeightConstant = 60 - translation.y
                imageHeight = 40 - translation.y/3.65
                imageLeftMargin = 12 - translation.y/7
            }
            if viewHeightConstant > DBHeight - topBarHeight || viewHeightConstant < 60{
                return
            }
            self.setNeedsUpdateConstraints()
            self.updateConstraintsIfNeeded()
        }else if(pan.state == .Ended){
            let halfHeight = (DBHeight - CGFloat(topBarHeight))/2
            if viewHeightConstant < halfHeight{
                viewHeightConstant = 60
                imageHeight = 40
                imageLeftMargin = 12
                showing = DBFalse
            }else{
                viewHeightConstant = DBHeight - topBarHeight
                imageHeight = DBWidth/2
                imageLeftMargin = DBWidth/4
                showing = DBTrue
            }
            self.playImageView.snp_updateConstraints { (make) -> Void in
                make.width.height.equalTo(imageHeight)
                make.left.equalTo(imageLeftMargin)
                make.top.equalTo(imageLeftMargin)
            }
            self.snp_updateConstraints(closure: { (make) -> Void in
                make.height.equalTo(viewHeightConstant)
            })
            UIView.animateWithDuration(0.7, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                self.layoutIfNeeded()
            }, completion:nil);
        
        }
    }
    
    override func updateConstraints() {
        self.snp_updateConstraints { (make) -> Void in
            make.height.equalTo(viewHeightConstant)
        }
        self.playImageView.snp_updateConstraints { (make) -> Void in
            make.width.height.equalTo(imageHeight)
            make.left.equalTo(imageLeftMargin)
            make.top.equalTo(imageLeftMargin)
        }
        super.updateConstraints()
    }
    
    override func layoutSubviews() {
        
    
    }
    
    
   required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
}
