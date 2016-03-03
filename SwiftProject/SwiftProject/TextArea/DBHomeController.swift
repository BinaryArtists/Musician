//
//  DBHomeController.swift
//  SwiftProject
//
//  Created by 王云鹏 on 16/3/3.
//  Copyright © 2016年 王涛. All rights reserved.
//

import UIKit
var barHeight = UINavigationController().navigationBar.height

class DBHomeController: DBBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configBar()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func configBar(){
        navigationController!.navigationBar.backgroundColor = UIColor.whiteColor()
        let containerView = MenuView(frame:DBFrame(0,y: 0,width: DBWidth,height: barHeight))
        navigationItem.titleView = containerView
    }
}




class MenuView: UIView {
    var selectedIndex = 0
    var line:UILabel!
    let itemWidth = DBWidth / 5
    var oldMenuItem:UIButton!
    var itemWidths = [CGFloat]()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setMenu()
    }
    
    func setUI(){
        backgroundColor = UIColor.whiteColor()
    }
    
    func setMenu(){
        let menus = ["兆赫","歌单","红心","我的","搜索"]
        for index in 0...4{
            let btn = UIButton(type: .System)
            btn.frame = DBFrame(CGFloat(index) * itemWidth, y: 0, width: itemWidth, height:barHeight - 1)
            btn.setTitle(menus[index], forState: .Normal)
            btn.setTitleColor(gray001Color, forState:.Normal)
            btn.setTitleColor(themeColor, forState: .Selected)
            btn.tintColor = UIColor.whiteColor()
            btn.titleLabel?.font = UIFont.systemScaleFontSize(17)
            btn.tag = 1000 + index
            if index == 0 {
                btn.selected = DBTrue
                oldMenuItem = btn
            }
            btn.addTarget(self, action: "itemClick:", forControlEvents: .TouchUpInside)
            let width = menus[index].textSizeForOneLineWith(17).width
            itemWidths.append(width)
            addSubview(btn)
        }
        line = UILabel(frame:DBFrame(CGFloat(selectedIndex) * itemWidth,y: barHeight - 2,width:itemWidths.first!,height: 2))
        line.centerX = oldMenuItem.centerX
        line.backgroundColor = themeColor
        addSubview(line)
    }
    
    func itemClick(btn:UIButton){
        guard oldMenuItem.tag != btn.tag else{
            return
        }
        
        oldMenuItem.selected = DBFalse
        btn.selected = DBTrue
        selectedIndex = btn.tag - 1000
        UIView.animateWithDuration(0.3) { () -> Void in
            self.line.centerX = btn.centerX
            self.line.width = self.itemWidths[self.selectedIndex]DBHomeController
            
        }
        oldMenuItem = btn
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
