//
//  CPLuckyViewController.swift
//  01彩票
//
//  Created by mac on 16/7/17.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

// 6.是否为4英寸


class CPLuckyViewController: UIViewController {
    var lucky:CPLuckyView?
    
   // let is4Inch = ([UIScreen mainScreen].bounds.size.height == 568.0)
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置背景
        self.addBg()
        //添加三个按钮
        self.addThreeButton()
        //添加转盘
        self.addCircle()
        
    }
    /**
     *  设置背景
     */
    func addBg(){
        let bgView = UIImageView();
        bgView.frame = self.view.bounds
        bgView.frame.size.height = self.view.bounds.size.height-64
        bgView.frame.origin.y = 64;
//        let mask = UIViewAutoresizing.FlexibleWidth
//        let mask2 = UIViewAutoresizing.FlexibleHeight
        bgView.autoresizingMask = UIViewAutoresizing.FlexibleHeight
        //判断是否为四英寸
        let  is4Inch =  UIScreen.mainScreen().bounds.size.height
        if is4Inch == 568 {
            bgView.image = UIImage.init(named:"LuckyBackground-568h.jpg")
        }else{
            bgView.image = UIImage.init(named:"LuckyBackground.jpg")
        }
        self.view.addSubview(bgView)
        
    }
    /**
     *  添加三个按钮
     */
    func addThreeButton() {
       let tb =  CPThreebutton.threeButton();
        let tbCenterX = self.view.frame.size.width * 0.5
        let tbCenterY = tb.frame.size.height * 0.5 + 74
        tb.center = CGPoint(x:tbCenterX,y: tbCenterY)
        self.view .addSubview(tb)
    }
    //添加转盘
    func addCircle(){
        let lucky = CPLuckyView.wheels();
        lucky.center = CGPoint(x: self.view.frame.size.width*0.5,y:self.view.frame.size.height*0.5)
        self.view.addSubview(lucky)
        self.lucky = lucky
    }
    //控制旋转
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.lucky?.startRotating()
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidAppear(animated)
        self.lucky?.stopRotating()
    }
}
