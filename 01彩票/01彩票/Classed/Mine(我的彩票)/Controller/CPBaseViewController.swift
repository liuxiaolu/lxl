//
//  CPBaseViewController.swift
//  01彩票
//
//  Created by mac on 16/7/14.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

class CPBaseViewController: UITableViewController {

//获取所有数据(懒加载)
    lazy var datas:NSMutableArray = {
        var datas = NSMutableArray()
        return datas
    }()
    //初始化方法
    init(){
      super.init(style: UITableViewStyle.Grouped)
    }
    override init(style: UITableViewStyle) {
        super.init(style: UITableViewStyle.Grouped)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    //设置数据源和代理方法
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return (self.datas.count)
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let group:CPSettingGroup = self.datas[section] as! CPSettingGroup;
        return (group.items?.count)!
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:CPSettingCell = CPSettingCell.cellWithForRow(tableView)
        //设置数据
        let group:CPSettingGroup = self.datas[indexPath.section] as! CPSettingGroup;
        let item = group.items![indexPath.row];
        cell.item = item as? CPSettingtem;
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //点击之后马上取消点击效果
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let group:CPSettingGroup = self.datas[indexPath.section] as! CPSettingGroup;
        let item:CPSettingtem = group.items![indexPath.row] as!CPSettingtem;
        if (item.blo != nil) {
            item.blo!()
        }else if ((item.isKindOfClass(CPSettingArrowItem.classForCoder())) != false) {
            let it:CPSettingArrowItem = item as! CPSettingArrowItem
            //类
            let vcName = it.destVC! as! UIViewController.Type
            let vc = vcName.init()
            vc.title = it.title
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //先取出对应组的模型
        let g:CPSettingGroup = self.datas[section] as! CPSettingGroup
        return g.headerTitle
    }
    
    override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        //先去出模型
        let g:CPSettingGroup = self.datas[section] as! CPSettingGroup
        return g.footerTitle
    }
}
