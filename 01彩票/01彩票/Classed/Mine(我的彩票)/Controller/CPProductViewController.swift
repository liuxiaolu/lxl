//
//  CPProductViewController.swift
//  01彩票
//
//  Created by mac on 16/7/13.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

class CPProductViewController: UICollectionViewController {
    //定义保存所有json数据
//    lazy var imag: UIImageView = {
//        print("imag111111")
//        
//        var image = UIImageView.init(image: UIImage(named: "CellArrow"))
//        return image
//    }()
    lazy var  products:NSMutableArray = {
        //1.加载json数据
        //2.将json数据转化为模型
        //2.1获取json文件的全路径
        let path = NSBundle.mainBundle().pathForResource("more_project.json", ofType: nil)
        //2.2根据全路径加载json文件到nsdata
        let data:NSData = NSData.dataWithContentsOfMappedFile(path!) as! NSData
        //2.3将加载进来的nsdata数据转化为对象
        let dictArry:NSArray = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! NSArray
        //将转换后的数据传递给product
       var models = NSMutableArray()
        for dict in dictArry{
            let product = CPProduct.productWithDict(dict as! NSDictionary)
            models .addObject(product)
        }
        print(models)
        return models
        
       }()
    
    let ID = "cell"
    init(){
        //创建流布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80,height: 80)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        
        //设置距离上边的距离
        layout.sectionInset = UIEdgeInsets(top: layout.minimumLineSpacing, left: 0, bottom: 0, right: 0)
        super.init(collectionViewLayout:layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    //----------------------------
    //加载view
    //-------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "其他产品推荐"
        //注册cell
//       self.collectionView!.registerClass(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: ID)
        let nib = UINib.init(nibName: "CPProductCell", bundle: nil)
        self.collectionView?.registerNib(nib, forCellWithReuseIdentifier: ID)
        self.collectionView?.backgroundColor = UIColor.whiteColor()
        
    }
//数据原方法
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.products.count
    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell :CPProductCell = collectionView.dequeueReusableCellWithReuseIdentifier(ID, forIndexPath: indexPath) as! CPProductCell
      //  cell.backgroundColor = UIColor.grayColor()
        //cell.backgroundView = UIImageView(image: UIImage(named: "apper"))
        cell.product = self.products[indexPath.item] as? CPProduct
        return cell
    }
    //代理方法
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let product:CPProduct = self.products[indexPath.item] as! CPProduct
        print((product.customerUrl)!)
        let path = "\((product.customerUrl)!)://\((product.myId)!)"
        let url = NSURL.init(string: path)
        //let url = NSURL.init(string: "lxl://www.apple.com")
        UIApplication.sharedApplication().openURL(url!)
        //2.判断应用能否打开
        let app = UIApplication.sharedApplication();
        if app.canOpenURL(url!) {
            app.openURL(url!)
        }else{
            UIApplication.sharedApplication().openURL(NSURL.init(string: product.url!)!)
        }
//        NSURL *url = [NSURL URLWithString:@"mj://ios.itcast.cn"];
//        [[UIApplication sharedApplication] openURL:url];

        print((product.title)!)
    }
}
