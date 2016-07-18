//
//  CPNavigationController.swift
//  01彩票
//
//  Created by mac on 16/7/12.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

class CPNavigationController: UINavigationController {
    
    //初始化基本设置
//    override init(navigationBarClass: AnyClass?, toolbarClass: AnyClass?) {
//        print("init----------------")
//            super.init(navigationBarClass: navigationBarClass, toolbarClass: toolbarClass)
//        //设置导航栏（修改全局的导航栏）
//    let nav = UINavigationBar.appearance()
//        //设置导航栏的背景图片
//    nav.setBackgroundImage(UIImage(named: "NavBar64"), forBarMetrics: UIBarMetrics.Default)
//    nav.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor(),NSFontAttributeName:UIFont.systemFontOfSize(16)];
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
    /**
     替代+ (void)initialize方法
     */
    override func viewDidLoad() {
        super.viewDidLoad()
       // print("viewDidLoad1111")
        //设置导航栏（修改全局的导航栏）
        let nav = UINavigationBar.appearance()
        //设置导航栏的背景图片
        nav.setBackgroundImage(UIImage(named: "NavBar64"), forBarMetrics: UIBarMetrics.Default)
        nav.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor(),NSFontAttributeName:UIFont.systemFontOfSize(16)];
        
        //设置uibarbuttonItem的属性
        let barButtonItem = UIBarButtonItem.appearance()
        barButtonItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.whiteColor(),NSFontAttributeName:UIFont.systemFontOfSize(16)], forState: UIControlState.Normal)
        
        //设置uibarbuttonItem的图标和返回按钮(归navgationbar管)
        nav.tintColor = UIColor.whiteColor()
        
    }
    
    //以为要用到push所以在子类中重写
    override func pushViewController(viewController: UIViewController, animated: Bool) {
      //  print("pushViewController")
        // 拿到目标控制器(即将要入栈的控制器), 设置它的自动隐藏tabbar
        viewController.hidesBottomBarWhenPushed = true
        super.pushViewController(viewController, animated: animated)
        
    }

}
