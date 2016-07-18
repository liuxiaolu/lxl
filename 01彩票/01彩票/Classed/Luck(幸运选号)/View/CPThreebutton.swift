//
//  CPThreebutton.swift
//  01彩票
//
//  Created by mac on 16/7/17.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

class CPThreebutton: UIView {

    class func threeButton()->CPThreebutton{
        
        return (NSBundle.mainBundle().loadNibNamed("CPThreeButton", owner: nil, options: nil)[0] as? CPThreebutton)!
    }

}
