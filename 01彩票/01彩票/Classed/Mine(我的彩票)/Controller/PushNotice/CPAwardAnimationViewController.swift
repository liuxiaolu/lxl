//
//  CPAwardAnimationViewController.swift
//  01彩票
//
//  Created by mac on 16/7/14.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

class CPAwardAnimationViewController: CPBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        [self .additems()]
        
    }
    func additems(){
        let 中将动画 = CPSettingSwitchItem.productItem("", title: "中将动画")
        let group = CPSettingGroup()
        //设置头部标题
        group.headerTitle = "当你有新中奖订单，启动程序时通过动画提醒您。为避免过于频繁，高频彩不会提醒。";
        group.items = [中将动画]
        
        self.datas .addObject(group)
    }
}
