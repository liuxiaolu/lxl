//
//  CPLuckyView.swift
//  01彩票
//
//  Created by mac on 16/7/17.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

class CPLuckyView: UIView {
    
    @IBAction func startBtnOnclick(sender: UIButton) {
        //禁止用户交互
        self.centerImage.userInteractionEnabled = false
        //核心动画实际上没有动位置，只是肉眼看到动了
        let anima = CABasicAnimation()
        anima.keyPath = "transform.rotation"
        anima.toValue = (2*M_PI*3)
        anima.duration = 5
        anima.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        anima.delegate = self
        self.centerImage.layer.addAnimation(anima, forKey: nil)
    }
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        self.centerImage.userInteractionEnabled = true
    }
    @IBOutlet weak var centerImage: UIImageView!
    //切割图片的宽高
    let imageHeight:CGFloat = 47
    let imageWidth:CGFloat = 40
    //设置被选中的按钮
    var selBtn:CPWheelButton?
    //创建定时器
    var link:CADisplayLink?
    override func awakeFromNib() {
        //0.让父控件可以交互
        self.centerImage.userInteractionEnabled = true
        //加载图片
        let norImage = UIImage(named: "LuckyAstrology")
        let selImage = UIImage(named: "LuckyAstrologyPressed")
        //设置装盘
        var i = 0;
        while i<12 {
            let button = CPWheelButton(type:.Custom)
            //button.backgroundColor = UIColor.redColor()
            //设置按钮的bounds
            
            button.bounds = CGRect(x:0,y: 0,width: 68,height: 143)
            //设置按钮的锚点
            button.layer.anchorPoint = CGPoint(x: 0.5,y: 1)
            //设置按钮的posistion
            button.layer.position = CGPoint(x: self.centerImage.frame.size.width*0.5,y:self.centerImage.frame.size.height*0.5)
            //然后按钮围绕锚点旋转
           // let angel:CGFloat = ((30 * i) as! Double/180.0 * M_PI as? CGFloat)!
            let m = CGFloat(i);
            let pai = CGFloat(M_PI)
            let angle = 30 * m / 180.0 * pai
            button.transform = CGAffineTransformMakeRotation(angle)
            
            // 8.切割图片,将切割好的图片设置到按钮上
            // 8.1根据rect切割图片
            let imageW = imageWidth * UIScreen.mainScreen().scale
            let imageH = imageHeight * UIScreen.mainScreen().scale
            let imageY:CGFloat = 0
            let imageX:CGFloat = CGFloat(i)*imageW;
            // CGImage中rect是当做像素来使用
            // UIKit 中是点坐标系
            // 坐标系的特点:如果在非retain屏上 1个点等于1个像素
            //   在retain屏上1个点等于2个像素
            // 剪切默认状态的图片
            let norCGImage = CGImageCreateWithImageInRect(norImage?.CGImage, CGRect(x: imageX,y: imageY,width: imageW,height: imageH))
            let selCGImage =  CGImageCreateWithImageInRect(selImage?.CGImage, CGRect(x: imageX,y: imageY,width: imageW,height: imageH))
            // 将切割好的图片转换为uiimage设置为按钮的背景
            button.setImage(UIImage.init(CGImage: norCGImage!), forState: .Normal)
            button.setImage(UIImage.init(CGImage: selCGImage!), forState: .Selected)
            button.setBackgroundImage(UIImage.init(named: "LuckyRototeSelected"), forState: .Selected)
            //监听按钮事件
            button.addTarget(self, action: #selector(CPLuckyView.update(_:)), forControlEvents: .TouchUpInside)
            self.centerImage.addSubview(button)
            if i==0 {
                self.update(button)
            }
            i = i+1
        
        }
    }
    //加载xib
    class func wheels()->CPLuckyView{
        
        return NSBundle.mainBundle().loadNibNamed("CPLuckyView", owner: nil, options: nil)[0] as! CPLuckyView
    }
    
    //btn的addtargert方法
    func update(btn:CPWheelButton){
        self.selBtn?.selected = false
        btn.selected = true
        self.selBtn = btn
        //print("update");
    }
    //提供开始动画和结束动画
    func startRotating(){
        if self.link != nil {
            return;
        }
        let link = CADisplayLink.init(target: self, selector: #selector(CPLuckyView.centerImageRotation))
        link.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSDefaultRunLoopMode)
        self.link = link
    }
    func stopRotating(){
    //关闭定时器
        self.link?.invalidate()
        self.link = nil
    }
    
    func centerImageRotation(){
        self.centerImage.transform = CGAffineTransformRotate(self.centerImage.transform, CGFloat(M_PI)/250)
    }

}
