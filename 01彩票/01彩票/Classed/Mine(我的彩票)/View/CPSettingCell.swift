//
//  CPProductCell.swift
//  01彩票
//
//  Created by mac on 16/7/13.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

class CPSettingCell: UITableViewCell {
   // var imageView:UIImageView?
    //直接创建好（不用懒加载）
//    let img = UIImageView.init(image: UIImage(named: "CellArrow"))
//    let swit = UISwitch()
    
    lazy var imag: UIImageView = {
        print("imag111111")
        
        var image = UIImageView.init(image: UIImage(named: "CellArrow"))
        return image
    }()
    lazy var swit: UISwitch = {
        //print("imag111111")
        //创建switch
        var swi = UISwitch()
        swi.addTarget(self, action: #selector(CPSettingCell.switchChange), forControlEvents: UIControlEvents.ValueChanged)
        return swi
    }()
    func switchChange(){
       //值改变的时候存储
        print(self.swit.on)
        print((self.item?.title)!)
        let defaults =  NSUserDefaults.standardUserDefaults()
        defaults.setBool(self.swit.on, forKey:(self.item?.title)!)
        defaults.synchronize()
    }
    lazy var lab:UILabel = {
        let with:CGFloat = 100;
        let height:CGFloat = 40
        let x:CGFloat = self.frame.width-with-5
        let y:CGFloat = 2
        var label = UILabel(frame:CGRect(x:x,y:y,width:with,height:height));
        label.backgroundColor = UIColor.redColor()
        return label
    }()

    //创建一个快速创建方法
    class func cellWithForRow(tableView:UITableView)->CPSettingCell{
        let ID = "cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(ID) as? CPSettingCell
        if cell == nil {
            cell = CPSettingCell.init(style:.Value1, reuseIdentifier: ID)
        }
        return cell!
    }
    //相当于oc中的set方法
     var item: CPSettingtem? {
        didSet {
           // self.item = item;
            //UIImage()
           self.textLabel?.text = item?.title
            self.imageView?.image = UIImage(named:(item?.icon)!)
            if ((item?.subtitle) != nil) {
                self.detailTextLabel?.text = item?.subtitle
            }
            if ((item?.isKindOfClass(CPSettingArrowItem.classForCoder())) != false) {
                //self.accessoryView = UIImageView.init(image: UIImage(named: "CellArrow"))
                self.accessoryView = imag
                print("setup")
            }else if ((item?.isKindOfClass(CPSettingSwitchItem.classForCoder())) != false){
            
               // self.swit.setOn(defauts .objectForKey((self.item?.title)!) as! Bool, animated: true)
                self.accessoryView = self.swit
                //从沙河中取出显示状态
                let defauts = NSUserDefaults.standardUserDefaults()
                self.swit.on = defauts.boolForKey((self.item?.title)!)
                //不能被选中
                self.selectionStyle = UITableViewCellSelectionStyle.None
                //UITableViewCellSelectionStyleNone
            }else if((item?.isKindOfClass(CPSettingLabeltem.classForCoder())) != false){
               self.lab.backgroundColor = UIColor.redColor()
                
                self.accessoryView = self.lab
                
            }else{
                self.accessoryView = nil
            }
            
        }
    }

}
