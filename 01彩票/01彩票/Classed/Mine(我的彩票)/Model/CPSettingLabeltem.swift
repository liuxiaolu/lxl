//
//  CPSettingLabeltem.swift
//  01彩票
//
//  Created by mac on 16/7/14.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

class CPSettingLabeltem: CPSettingtem {
    
    override class func productItem(icon:String,title:String)->CPSettingLabeltem{
        let item = CPSettingLabeltem();
        item.icon = icon
        item.title = title
        return item
    }
}
