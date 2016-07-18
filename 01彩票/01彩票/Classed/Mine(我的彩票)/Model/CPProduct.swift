//
//  CPProduct.swift
//  01彩票
//
//  Created by mac on 16/7/14.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit


class CPProduct: NSObject {
    
    var title:String?
    var icon:String?
    var url:String?
    var myId:String?
    var customerUrl:String?
    
//    init(dict:) {
//        
//    }
    func initWithDict(dict:NSDictionary)->CPProduct{
        self.icon = dict["icon"] as? String
        self.title = dict["title"] as? String
        self.url = dict["url"] as? String
        self.myId = dict["id"] as? String
        self.customerUrl = dict["customUrl"] as? String
        return self
    }

    class func productWithDict(dict:NSDictionary) ->CPProduct{
       // self.init().initWithDict(dict)
       
    return  CPProduct.init().initWithDict(dict)
    }

}
