//
//  CPMineViewController.swift
//  01彩票
//
//  Created by mac on 16/7/12.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

class CPMineViewController: UIViewController {
    //点击设置按钮跳转到目标控制器
    @IBAction func setting(sender: AnyObject) {
        let setting = CPSettingViewController(style:.Grouped)
        
        self.navigationController?.pushViewController(setting, animated: true)
    }

}
