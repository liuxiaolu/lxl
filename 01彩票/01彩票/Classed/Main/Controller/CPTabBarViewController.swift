//
//  CPTabBarViewController.swift
//  01彩票
//
//  Created by mac on 16/7/11.
//  Copyright © 2016年 mac. All rights reserved.
//

import Foundation
import UIKit


class CPTabBarViewController: UITabBarController,CPTabBarDelegate{
    override func viewDidLoad() {
        super.viewDidLoad()
        //创建自定义tabbar
        //let myTabBar = CPTabBar(frame:self.tabBar.frame)
        let myTabBar = CPTabBar(frame:self.tabBar.bounds)
        myTabBar.delegate = self
        
      //  self.view.addSubview(myTabBar)
        //为了隐藏方便，所以直接添加到到tabBar
        self.tabBar.addSubview(myTabBar)
        //根据系统自控制器地个数来创建自定义taBBar上的按钮个数
        var i:intmax_t = 0
        while i<self.viewControllers?.count {
            //通知自定义tarbar创建按钮
            let norImage = "TabBar\(i+1)";
            let disImage = "TabBar\(i+1)Sel"
            //只要调用自定义tabBar的该方法就会创建一个按钮
            myTabBar.addTabBarButtonWithNormalImageName(norImage, disName: disImage)
            i = i+1
        }
        //删除系统自带的tarbar
        //self.tabBar .removeFromSuperview()
        
        //设置导航栏（修改全局的导航栏）
//        let nav = UINavigationBar.appearance()
//        //设置导航栏的背景图片
//        nav.setBackgroundImage(UIImage(named: "NavBar64"), forBarMetrics: UIBarMetrics.Default)
////        //设置所有导航栏的标题颜色
////        var  md:NSMutableDictionary = NSMutableDictionary()
////        md[NSForegroundColorAttributeName] = UIColor.whiteColor()
////        md[NSFontAttributeName] = UIFont.systemFontOfSize(16)
//        nav.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor(),NSFontAttributeName:UIFont.systemFontOfSize(16)];
//
//        nav
//        nav
//        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor(),UIFont.systemFontOfSize(16)];
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "NavBar64"), forBarMetrics: UIBarMetrics.Default)
//        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()];
        
    }
    /**
     实现代理方法
     
     - parameter from: <#from description#>
     - parameter to:   <#to description#>
     */
    func tabBarDidSelectectBtnFrom(from: NSInteger, to: NSInteger) {
        self.selectedIndex = to
    }
    
}
