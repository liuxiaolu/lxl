//
//  CPHelpViewController.swift
//  01彩票
//
//  Created by mac on 16/7/14.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

class CPHelpViewController: CPBaseViewController {
    
    lazy var  helps:NSMutableArray = {
        //1.加载json数据
        //2.将json数据转化为模型
        //2.1获取json文件的全路径
        let path = NSBundle.mainBundle().pathForResource("help.json", ofType: nil)
        //2.2根据全路径加载json文件到nsdata
        let data:NSData = NSData.dataWithContentsOfMappedFile(path!) as! NSData
        //2.3将加载进来的nsdata数据转化为对象
        let dictArry:NSArray = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! NSArray
        //将转换后的数据传递给product
        var models = NSMutableArray()
        for dict in dictArry{
            let help = CPHelp.helpWithDict(dict as! NSDictionary)
            models .addObject(help)
        }
        //self.datas = models
        return models
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addpushitem()
    }
    //创建数据
    func addpushitem(){
       var i = 0
        let arr = NSMutableArray()
        while i<self.helps.count {
            let help:CPHelp = self.helps[i] as! CPHelp
            let item = CPSettingArrowItem.productItem("", title: help.title!, destClass: CPTestViewController.classForCoder())
            arr.addObject(item)
            i = i+1
        }
        let group = CPSettingGroup()
        group.items = arr
        self.datas .addObject(group)
    }
    
    //重写didselected方法
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc:CPHtmlViewController = CPHtmlViewController();
        vc.help = self.helps[indexPath.row] as? CPHelp
        let nav = UINavigationController(rootViewController:vc)
        self.presentViewController(nav, animated: true) { 
            
        }
    }
    
}
