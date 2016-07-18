//
//  CPProductCell.swift
//  01彩票
//
//  Created by mac on 16/7/13.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

class CPProductCell: UICollectionViewCell {
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var mytitle: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //设置myImageView的圆角
       // myImageView.layer.cornerRadius = 8
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        //设置图片主图层的圆角
        self.myImageView.layer.cornerRadius = 8
        //设置超出朱图层的部分剪切(此方法默认调用self.myImageView.layer.masksToBounds = true)
        self.myImageView.clipsToBounds = true
        
    }
    //模型数据
    //相当于oc中的set方法
    var product: CPProduct? {
        didSet {
          //设置图片和文字
            self.mytitle.text = (product?.title)!
            
            self.myImageView.image = UIImage(named:(product?.icon)!)
            
            
        }
    }
    class func productCell(){
        
    }
}
