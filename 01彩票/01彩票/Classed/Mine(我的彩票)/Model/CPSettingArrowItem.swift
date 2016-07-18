//
//  CPProductArrowItem.swift
//  01彩票
//
//  Created by mac on 16/7/13.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

class CPSettingArrowItem: CPSettingtem {
    /**
     *  目标控制器
     */
    var destVC:AnyClass?
    
    class func productItem(icon:String,title:String,destClass:AnyClass)->CPSettingArrowItem{
        let item = CPSettingArrowItem();
        item.icon = icon
        item.title = title
        item.destVC = destClass
        return item
    }
    override class func productItem(icon:String,title:String)->CPSettingArrowItem{
        let item = CPSettingArrowItem();
        item.icon = icon
        item.title = title
        return item
    }

}
