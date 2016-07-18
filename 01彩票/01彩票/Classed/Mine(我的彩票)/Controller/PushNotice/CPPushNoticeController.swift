//
//  CPPushNoticeController.swift
//  01彩票
//
//  Created by mac on 16/7/14.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

class CPPushNoticeController: CPBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        [self .addpushitem()]
    }
    //创建数据
    func addpushitem(){
        let push = CPSettingArrowItem .productItem("", title: "开奖号码推送", destClass:CPAwardViewController.classForCoder())
         let animation = CPSettingArrowItem .productItem("", title: "中将动画", destClass:CPAwardAnimationViewController.classForCoder())
         let notice = CPSettingArrowItem .productItem("", title: "比分直播提醒", destClass:CPScoreTimeViewController.classForCoder())
         let time = CPSettingArrowItem .productItem("", title: "购彩定时提醒", destClass:CPTestViewController.classForCoder())
        let goup1 = CPSettingGroup()
        goup1.items = [push,animation,notice,time]
        self.datas.addObject(goup1)
    }

}
