//
//  CPHtmlViewController.swift
//  01彩票
//
//  Created by mac on 16/7/14.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

class CPHtmlViewController: UIViewController,UIWebViewDelegate {
    //接受传过来的对象
    var help:CPHelp?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = UIWebView()
        self.title = help?.title
        //添加一个关闭的行为
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "关闭", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(CPHtmlViewController.close))
        //自定义webview
        let webView:UIWebView = self.view as! UIWebView
        
        webView.delegate = self
        
        let path = NSBundle.mainBundle() .pathForResource(help?.html, ofType: nil)
        
        let url = NSURL.init(fileURLWithPath: path!)
        
        let reauest = NSURLRequest.init(URL: url)
        
        webView.loadRequest(reauest)
        
    }
    
    //webView的delegate方法
    func webViewDidFinishLoad(webView: UIWebView) {
        print((self.help?.myId)!)
        let js = "window.location.href = '#\((self.help?.myId)!)';"
        webView .stringByEvaluatingJavaScriptFromString(js)
    }
    func close(){
        self.dismissViewControllerAnimated(true) { 
            
        }
    }

}
