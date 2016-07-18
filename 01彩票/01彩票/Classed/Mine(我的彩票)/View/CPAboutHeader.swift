//
//  CPAboutHeader.swift
//  01彩票
//
//  Created by mac on 16/7/16.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

class CPAboutHeader: UIView {
   class func abouHeader()->CPAboutHeader!{
    let about = NSBundle.mainBundle().loadNibNamed("CPAboutHeader", owner: nil, options: nil)[0] as! CPAboutHeader
    
    about.frame = CGRect(x: 0 ,y: 0,width: UIScreen.mainScreen().bounds.size.width,height: 220)
        return about
    }
}
