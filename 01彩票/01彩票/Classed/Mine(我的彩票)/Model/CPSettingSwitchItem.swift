//
//  CPProductSwitchItem.swift
//  01彩票
//
//  Created by mac on 16/7/13.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

class CPSettingSwitchItem: CPSettingtem {
    
    override class func productItem(icon:String,title:String)->CPSettingSwitchItem{
        let item = CPSettingSwitchItem();
        item.icon = icon
        item.title = title
        return item
    }
}
