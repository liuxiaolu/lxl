//
//  CPBuyViewController.swift
//  01彩票
//
//  Created by mac on 16/7/12.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

class CPBuyViewController: UIViewController {
    //记录按钮当前的状态
    var open:Bool?
    //记录遮盖
    var contentView:UIView?
    override func viewDidLoad() {
        //添加将来需要显示的view
        let contenView = UIView()
        contenView.backgroundColor = UIColor.redColor()
        contenView.frame = CGRect(x:0,y:64,width: UIScreen.mainScreen().bounds.size.width,height: 150)
        self.view.addSubview(contenView)
        self.contentView = contenView
        //隐藏该view
        contenView.hidden = true
    }
   
    @IBAction func btnOnclick(sender: UIButton) {
//        print("btnOnclick");
        print("\(self.open)")
        if (self.open == true) {
            UIView.animateWithDuration(1.0, animations: {
                sender.imageView?.transform = CGAffineTransformIdentity
                
            })
            //改变按钮状态
            self.open = false
            //显示内容
            self.contentView?.hidden = true
        }else{
            UIView.animateWithDuration(1.0, animations: {
                sender.imageView?.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
                
            })
            //改变按钮状态
            self.open = true
            //显示内容
            self.contentView?.hidden = false

        
        }
        print("\(self.open)")
        
    }
}
