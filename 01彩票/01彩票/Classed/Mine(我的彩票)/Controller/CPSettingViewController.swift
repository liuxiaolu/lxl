//
//  CPSettingViewController.swift
//  01彩票
//
//  Created by mac on 16/7/12.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

class CPSettingViewController: CPBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //添加数据
        self.add1SenctionItems()
        self.add2SenctionItems()
    }
    //添加第一组模型数据
    func add1SenctionItems(){
        let message = CPSettingArrowItem.productItem("MorePush", title: "推送和提醒", destClass: CPPushNoticeController.classForCoder())
        let yao = CPSettingSwitchItem.productItem("handShake", title: "摇一摇机选")
        let voice = CPSettingSwitchItem.productItem("sound_Effect", title: "声音效果")
        let oneGroup = CPSettingGroup();
        oneGroup.items = [message,yao,voice]
        self.datas.addObject(oneGroup)
    }
    func add2SenctionItems(){
        let version = CPSettingtem.productItem("MoreUpdate", title: "检测新版本")
        version.blo = {
            MBProgressHUD.showMessage("拼命检测版本...")
            let time: NSTimeInterval = 2.0
            let delay = dispatch_time(DISPATCH_TIME_NOW,
                                      Int64(time * Double(NSEC_PER_SEC)))
            dispatch_after(delay, dispatch_get_main_queue(), {
                MBProgressHUD.hideHUD()
                MBProgressHUD.showMsg("亲~没有新版本")
            })
            
        }
        let help = CPSettingArrowItem.productItem("MoreHelp", title: "帮助", destClass: CPHelpViewController.classForCoder())
        let share = CPSettingArrowItem.productItem("MoreShare", title: "分享", destClass: CPShareViewController.classForCoder())
        let search = CPSettingArrowItem.productItem("MoreMessage", title: "查看消息", destClass: CPTestViewController.classForCoder())
        let 推荐 = CPSettingArrowItem.productItem("MoreNetease", title: "推荐", destClass: CPProductViewController.classForCoder())
        let 关于 = CPSettingArrowItem.productItem("MoreAbout", title: "关于", destClass: CPAboutViewController.classForCoder())
        let twoGroup = CPSettingGroup();
        twoGroup.items = [version,help,share,search,推荐,关于]
        self.datas.addObject(twoGroup)
    }
}
