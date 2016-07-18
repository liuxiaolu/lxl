//
//  CPHelp.swift
//  01彩票
//
//  Created by mac on 16/7/14.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

class CPHelp: NSObject {
    var title:String?
    var html:String?
    var myId:String?
    
    //    init(dict:) {
    //
    //    }
    func initWithDict(dict:NSDictionary)->CPHelp{
        
        self.html = dict["html"] as? String
        self.title = dict["title"] as? String
        self.myId = dict["id"] as? String
        return self
    }
    
    class func helpWithDict(dict:NSDictionary) ->CPHelp{
        // self.init().initWithDict(dict)
        return  CPHelp.init().initWithDict(dict)
    }

}
