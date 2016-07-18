//
//  CPWheelButton.swift
//  01彩票
//
//  Created by mac on 16/7/17.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

class CPWheelButton: UIButton {
//重新设置按钮imageview的位置
    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        let lucky = CPLuckyView();
        let imageX =  (contentRect.size.width-lucky.imageWidth)*0.5
        let imageY:CGFloat = 18
        return CGRect(x: imageX,y: imageY,width:lucky.imageWidth,height:lucky.imageHeight)
    }
    //重写hight的set方法
    override var highlighted: Bool{
        didSet{
            super.highlighted = false
        }
    }

}
