//
//  CPScoreTimeViewController.swift
//  01彩票
//
//  Created by mac on 16/7/14.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

class CPScoreTimeViewController: CPBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.additems()
        self.addStartTime()
        self.addEndTime()
    }
    
    func additems(){
        let 提醒我关注的比赛 = CPSettingSwitchItem.productItem("", title: "提醒我关注的比赛")
        let group = CPSettingGroup()
        //设置头部标题
        group.footerTitle = "当我关注的比赛比分发生变化时，通过小弹窗或推送进行提醒。";
        group.items = [提醒我关注的比赛]
        
        self.datas .addObject(group)
    }
    func addStartTime(){
        let startTime = CPSettingLabeltem.productItem("", title: "开始时间")
        let group = CPSettingGroup()
        group.items = [startTime]
        self.datas.addObject(group)
    }
    
    func addEndTime(){
        let endTime = CPSettingLabeltem.productItem("", title: "结束时间")
        let group = CPSettingGroup()
        group.items = [endTime]
        self.datas.addObject(group)
    }

}
