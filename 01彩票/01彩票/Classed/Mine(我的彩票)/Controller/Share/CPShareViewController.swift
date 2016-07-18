//
//  CPShareViewController.swift
//  01彩票
//
//  Created by mac on 16/7/17.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit
import MessageUI

class CPShareViewController: CPBaseViewController,MFMessageComposeViewControllerDelegate,MFMailComposeViewControllerDelegate {
    /**
     Swift中 deinit 可以实现 “dealloc” 的功能
     */
    deinit{
        print("deinit")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let Weibo = CPSettingArrowItem.productItem("WeiboSina", title: "新浪微博")
        Weibo.blo = {
            //其他分享
            let url = NSURL.init(string: "http://www.baidu.com")
            UIApplication.sharedApplication().openURL(url!)
        }
         let sms  = CPSettingArrowItem.productItem("SmsShare", title: "短信分享")
        //__unsafe_unretained CPShareViewController *unsafeSelf = self;
        
        //    __weak NJShareViewController *unsafeSelf = self;
        //    __weak 当对象释放之后会自动设置为nil, 而__unsafe_unretained不会
        weak var weakSelf = self
        sms.blo = {
//           //1. 直接跳到发短信界面，但是不能指定短信内容，而且不能自动回到原应用
//            let url = NSURL.init(string: "sms://10010")
//            UIApplication.sharedApplication().openURL(url!)
            
          //  在调用发短信代码之前，最好先判断用户的设备能否发短信
            // 不能发短信
            if MFMessageComposeViewController.canSendText() == false{
                return
            }
//            if (![MFMessageComposeViewController canSendText]) return;

           // 显示发短信的控制器
            let vc =  MFMessageComposeViewController()
            // 设置短信内容
            vc.body = "吃饭了没？"
            // 设置收件人列表
            vc.recipients = ["10010"];
            // 设置代理
            vc.messageComposeDelegate = weakSelf;
            
            // 显示控制器
            weakSelf!.presentViewController(vc, animated: true, completion: nil)
//            [self presentViewController:vc animated:YES completion:nil];

        }
         let email = CPSettingArrowItem.productItem("MailShare", title: "邮件分享")
        email.blo = {
//            //用自带的邮件客户端，发完邮件后不会自动回到原应用
//            let url = NSURL.init(string: "mailto://10010@qq.com")
//            UIApplication.sharedApplication().openURL(url!)
            
            // 不能发邮件
            if MFMailComposeViewController.canSendMail() == false {
                return
            }
            let vc = MFMailComposeViewController();
        
            // 设置邮件主题
            vc.setSubject("论马冉")
            // 设置邮件内容
            vc.setMessageBody("马冉王八蛋", isHTML: false)
            // 设置收件人列表
            vc.setToRecipients(["1185327278@qq.com","824041393@qq.com"])
            // 设置抄送人列表
            vc.setCcRecipients(["1234qq.com"])
            // 设置密送人列表
            vc.setBccRecipients(["56789@qq.com"])
       
            // 添加附件（一张图片）
//            let image = UIImage(named: "lufy.jpeg")
//            let data = UIImageJPEGRepresentation(image!, 0.5)
//            vc.addAttachmentData(data!, mimeType: "image/jpeg", fileName: "lufy.jpeg")
            // 设置代理
            vc.mailComposeDelegate = weakSelf;
            // 显示控制器
            weakSelf!.presentViewController(vc, animated: true, completion: nil)
            //[self presentViewController:vc animated:YES completion:nil];


        }
        let group = CPSettingGroup()
        group.items = [Weibo,sms,email]
        
        self.datas .addObject(group)

    }
    //delegate方法
    func messageComposeViewController(controller: MFMessageComposeViewController, didFinishWithResult result: MessageComposeResult) {
        // 关闭短信界面
        controller.dismissViewControllerAnimated(true, completion: nil)
       // [controller dismissViewControllerAnimated:YES completion:nil];
        
        if (result == MessageComposeResultCancelled) {
            print("取消发送")
           // NSLog(@"取消发送");
        } else if (result == MessageComposeResultSent) {
            print("已经发出")
           // NSLog(@"已经发出");
        } else {
            print("发送失败")
            //NSLog(@"发送失败");
        }

    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
        if (result == MFMailComposeResultCancelled) {
            print("取消发送")
        } else if (result == MFMailComposeResultSent) {
            print("已经发出")
        } else {
          print("发送失败")
        }

    }
    
    

}
