//
//  DBSongView.swift
//  SwiftProject
//
//  Created by 王云鹏 on 16/3/17.
//  Copyright © 2016年 王涛. All rights reserved.
//

import UIKit

class DBSongView: UIView {
    var songNameLabel:UILabel!
    var singerNameLabel:UILabel!
    var menuView:UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
    }
    
    init(){
       super.init(frame: CGRectZero)
        setSubviews()
    }
    
    func setSubviews(){
        songNameLabel = factoryLabel()
        songNameLabel.text = "music name ~~"
        singerNameLabel = factoryLabel()
        singerNameLabel.text = "小黑~~"
        singerNameLabel.textColor = gray004Color
        menuView = factoryView()
        self.addSubview(songNameLabel)
        self.addSubview(singerNameLabel)
        self.addSubview(menuView)
    }

    
    override func willMoveToSuperview(newSuperview: UIView?) {
        songNameLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.snp_top).offset(8)
            make.left.right.equalTo(self).offset(0)
        }
        singerNameLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(songNameLabel.snp_bottom).offset(5)
            make.left.right.equalTo(songNameLabel).offset(0)
        }
        menuView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(singerNameLabel.snp_bottom).offset(15)
            make.left.right.equalTo(singerNameLabel)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
