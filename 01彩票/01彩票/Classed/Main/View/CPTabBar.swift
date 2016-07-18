//
//  CPTabBar.swift
//  01彩票
//
//  Created by mac on 16/7/11.
//  Copyright © 2016年 mac. All rights reserved.
//

import Foundation
import UIKit

protocol CPTabBarDelegate:NSObjectProtocol{
    /**
     - parameter from: 从哪个视图
     - parameter to:   到哪个视图
     */
    func tabBarDidSelectectBtnFrom(from:NSInteger,to:NSInteger);
}


class CPTabBar: UIView {
    var delegate:CPTabBarDelegate?
    var selectedbtn:CPTabBarButton?
    /**
     *  提供给外界创建按钮
     *
     *  @param norName 默认状态的图片
     *  @param disName 高亮状态的图片
     */

    func addTabBarButtonWithNormalImageName(norName:NSString,disName:NSString){
        //1.创建按钮
        
        let btn:CPTabBarButton = CPTabBarButton(type:.Custom);
        //2.设置按钮上显示图片
        btn.setBackgroundImage(UIImage(named:norName as String), forState: .Normal)
        btn.setBackgroundImage(UIImage(named:disName as String), forState: .Highlighted)
        btn.setBackgroundImage(UIImage(named:disName as String), forState: .Disabled)
        
        //3.添加按钮自定义tabBar
        self.addSubview(btn)
        //4.设置监听事件
        btn .addTarget(self, action: #selector(CPTabBar.btnonClick(_:)), forControlEvents: UIControlEvents.TouchDown)
        //5.设置默认选中第一个按钮
        if 1==self.subviews.count {
            self.btnonClick(btn)
        }
        //6设置按钮高亮状态下不调整图片
        btn.adjustsImageWhenHighlighted = false
       // btn.showsTouchWhenHighlighted = false
        //btn.highlighted = false
    }
    /**
     按钮的targat方法
     
     - parameter btn: 参数值
     */
    func btnonClick(btn:CPTabBarButton){
        //切换控制器
//        if self.delegateCp ?.respondsToSelector("tabBarDidSelectBtnFrom:to:") {
//            <#code#>
//        }
        //self.delegateCp ?.tabBarDidSelectectBtnFrom(self.selectedbtn?.tag, to:btn.tag)
        //取消上一次选中按钮
        self.selectedbtn?.enabled = true
        //设置当前按钮被选中
        btn.enabled = false
        
        self.selectedbtn = btn
        if((self.delegate?.respondsToSelector(Selector("tabBarDidSelectectBtnFrom(from:,to:)"))) != nil) {
           // self.delegate?.tabBarDidSelectectBtnFrom((self.selectedbtn?.tag)!, to: btn.tag)
            self.delegate?.tabBarDidSelectectBtnFrom((self.selectedbtn?.tag)!, to: btn.tag)
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        //设置按钮的位置和尺寸
        var i:intmax_t=0
        while i<self.subviews.count {
            let im:CGFloat = CGFloat(Float(i));
            
            let btn = self.subviews[i]
            //设置frame
            let btnY:CGFloat = 0
            /// 错误
            let btnW:CGFloat = self.frame.size.width/CGFloat(Float(self.subviews.count))
           // print("\(self.subviews.count)and\(CGFloat(Float(self.subviews.count))")
            print(self.subviews.count)
            print(CGFloat(Float(self.subviews.count)))
            print(self.subviews)
            let btnH:CGFloat = self.frame.size.height
            let btnX:CGFloat = im*btnW
            btn.frame = CGRect(x: btnX,y: btnY,width: btnW,height: btnH)
            //绑定
            btn.tag = i
            //i加1
            i = i+1
            
        }
    }
    
}