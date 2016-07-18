//
//  CPTitleBtn.swift
//  01彩票
//
//  Created by mac on 16/7/12.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

class CPTitleBtn: UIButton {
    var myFont:UIFont?
    //通过代码
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    //通过xib
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }

    func setup(){
    //记录按钮标题的字体
        self.myFont = UIFont.systemFontOfSize(15)
    //设置标题的字体
        self.titleLabel?.font = self.myFont
    //设置按钮的图片显示内容默认为居中（为不拉伸）
        self.imageView?.contentMode = UIViewContentMode.Center
    }
    //设置btn文字的位置和尺寸,传入按钮的rect
    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        let btnX:CGFloat = 0
        let btnY:CGFloat = 0
        let btnH:CGFloat = contentRect.size.height;
        var btnW:CGFloat = 0
        //计算文字的宽度
        //获取当前文字
        let titleText:NSString = self.currentTitle!
        let maxSize = CGSize(width:CGFloat(MAXFLOAT),height:CGFloat(MAXFLOAT));
         // 死循环的原因是self.titleLabel需要访问titleLabel, 而self.titleLabel又需要调用当前方法获取title的范围, 所有死循环[NSFontAttributeName:(self.titleLabel?.text)!]
//       let titleRect = titleText.boundingRectWithSize(maxSize, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:(self.titleLabel?.text)!], context: nil);
        let titleRect = titleText.boundingRectWithSize(maxSize, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:self.myFont!], context: nil);
        btnW = titleRect.size.width
        
       // let btnW =
        return CGRect(x: btnX,y: btnY,width: btnW,height:btnH)
    }
    //设置图片的位置
    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        let btnY:CGFloat = 0
        let btnW:CGFloat = 16
        let btnH = contentRect.size.height
        let btnX = contentRect.size.width-btnW
        
        return CGRect(x: btnX,y: btnY,width: btnW,height:btnH)
    }

}
