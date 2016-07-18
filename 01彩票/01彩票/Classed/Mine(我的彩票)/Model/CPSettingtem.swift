//
//  CPProductItem.swift
//  01彩票
//
//  Created by mac on 16/7/12.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit
//声明block
typealias optiblock = ()->()

class CPSettingtem: NSObject {
    /**
     *  图标
     */
    var icon:String?
    /**
     *  标题
     */
    var title:String?
    /**
     持有一个block变量
     */
    var blo:optiblock?
    
    /**
     设置子标题
     */
    var subtitle:String?
//    /**
//     *  目标控制器
//     */
//    var destVC:AnyClass?
//    
//    class func productItem(icon:String,title:String,destClass:AnyClass)->CPProductItem{
//        let item = CPProductItem();
//        item.icon = icon
//        item.title = title
//        item.destVC = destClass
//        return item
//    }
        class func productItem(icon:String,title:String)->CPSettingtem{
            let item = CPSettingtem();
            item.icon = icon
            item.title = title
            return item
        }

}
