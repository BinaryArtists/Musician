//
//  DBPlayView.swift
//  SwiftProject
//
//  Created by 王云鹏 on 16/3/4.
//  Copyright © 2016年 王涛. All rights reserved.
//

import UIKit
let NavigationBarHeight:CGFloat = 64
private let ImageMiniHeight:CGFloat = 40
private let ViewMiniHeight:CGFloat  = 60
private let ImageMiniLeftMargin:CGFloat = 12
private let ImageMaxLeftMargin:CGFloat = DBWidth/4
private let ViewMaxHeight:CGFloat = DBHeight - NavigationBarHeight
private let ImageMaxHeight:CGFloat = DBWidth/2


class DBPlayView: UIView {
    ///下方view高度 最低为60
    var viewHeightConstant:CGFloat = 60
    /// 下方图片视图宽高 最低为40
    var imageHeight:CGFloat = ImageMiniHeight
    /// 下方图片视图左侧间距，最小为12
    var imageLeftMargin:CGFloat = ImageMiniLeftMargin
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
        DLog("height:\(NavigationBarHeight)");
        backgroundColor = UIColor.whiteColor()
        layer.shadowOffset = CGSizeMake(3,2);
        layer.shadowOpacity = 0.6;
        layer.shadowColor = UIColor.blackColor().CGColor
        let pan = UIPanGestureRecognizer(target: self, action: "pan:")
        addGestureRecognizer(pan)
        setSubviews()
        self.addAction { () -> () in
            guard self.showing == DBFalse else{
                return
            }
            self.showing = DBTrue
            self.viewHeightConstant = DBHeight - NavigationBarHeight
            self.imageHeight = DBWidth/2
            self.imageLeftMargin = DBWidth/4
            self.configSubviewWhenEnded()
        }
    }
    
    func setSubviews(){
        //imageView
        self.addSubview(self.playImageView)
        self.playImageView.snp_makeConstraints { (make) -> Void in
            make.height.width.equalTo(imageHeight)
            make.left.equalTo(self).offset(imageLeftMargin)
            make.top.equalTo(self).offset(10)
        }
        playImageView.image = UIImage(named: "headerImage")
        
        //bottomLabels
        let serialLabel = factoryLabel()
        serialLabel.text = "轻音乐 系 MHz"
        serialLabel.font = leve1004Font
        serialLabel.textColor = gray004Color
        insertSubview(serialLabel, belowSubview: playImageView)
        serialLabel.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(self.snp_bottom).offset(-10)
            make.left.equalTo(self).offset(60)
        }
        
        let musicNameLabel = factoryLabel()
        musicNameLabel.text = "Music name"
        musicNameLabel.font = leve1002Font
        musicNameLabel.textColor = gray002Color
        insertSubview(musicNameLabel, belowSubview: playImageView)
        musicNameLabel.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(serialLabel.snp_top).offset(-6)
            make.left.equalTo(serialLabel)
        }
        
        //bottomButtons
        
    }
    
    func factoryLabel() -> UILabel{
        let label = UILabel()
        label.textAlignment = .Center
        label.backgroundColor = UIColor.whiteColor()
        return label
    }
    
//MARK:GestureRecognizer
    func pan(pan:UIPanGestureRecognizer){
       if(pan.state == .Changed){
            let translation = pan.translationInView(self)
            if showing{
                viewHeightConstant = DBHeight - NavigationBarHeight - translation.y
            }else{
                viewHeightConstant = 60 - translation.y
            }
            let normalValue = viewHeightConstant / ViewMaxHeight;//正比
            let backValue   = 1 - normalValue; //反比  运用反比来弥补刚开始位移时候 图片的大小差值
            imageHeight = (DBWidth/2) * normalValue + ImageMiniHeight/2 * backValue
            imageLeftMargin = (DBWidth/4) * normalValue
            if viewHeightConstant > DBHeight - NavigationBarHeight || viewHeightConstant < ViewMiniHeight{
                return
            }
            self.setNeedsUpdateConstraints()
            self.updateConstraintsIfNeeded()
        }else if(pan.state == .Ended){
            let halfHeight = (DBHeight - CGFloat(NavigationBarHeight))/2
            if viewHeightConstant < halfHeight{ //最小
                viewHeightConstant = ViewMiniHeight
                imageHeight = ImageMiniHeight
                imageLeftMargin = ImageMiniLeftMargin
                showing = DBFalse
            }else{ //最大
                viewHeightConstant = DBHeight - NavigationBarHeight
                imageHeight = ImageMaxHeight
                imageLeftMargin = ImageMaxLeftMargin
                showing = DBTrue
            }
                configSubviewWhenEnded()
        }
    }
    
    /**
     1.在pan结束的时候调用 2.在下方点击playView时候调用
     */
    func configSubviewWhenEnded(){
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
