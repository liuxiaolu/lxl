//
//  CPAwardViewController.swift
//  01彩票
//
//  Created by mac on 16/7/14.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

class CPAwardViewController: CPBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //添加数据
        self.additems();
    }
    func additems(){
        let 双色球 = CPSettingSwitchItem.productItem("", title: "双色球")
        let 大乐透 = CPSettingSwitchItem.productItem("", title: "大乐透")
        
        let group = CPSettingGroup()
        //设置头部标题
        group.headerTitle = "打开设置即可在开奖后立即收到推送消息，获知开奖号码";
        group.items = [双色球,大乐透]
        
        self.datas .addObject(group)
    }
}
