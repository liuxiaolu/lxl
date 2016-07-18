import UIKit

class CPAboutViewController: CPBaseViewController {
    
    lazy var webView:UIWebView = {
        let webView = UIWebView();
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let 支持评分 = CPSettingArrowItem.productItem("", title: "评分支持")
        支持评分.blo = {
//            为了提高应用的用户体验，经常需要邀请用户对应用进行评分
//            
//            应用评分无非就是跳转到AppStore展示自己的应用，然后由用户自己撰写评论
//            
//            如何跳转到AppStore，并且展示自己的应用
            let appid = "717804289"
            let str = "itms-apps://itunes.apple.com/cn/app/id\(appid)?mt=8"
            UIApplication.sharedApplication().openURL(NSURL.init(string: str)!)
//            NSString *str = [NSString stringWithFormat,:
//            @"itms-apps://itunes.apple.com/cn/app/id%@?mt=8", appid];
//            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];

        }
        let 客服电话 = CPSettingArrowItem.productItem("", title: "客服电话")
        客服电话.blo = {
//            //1最简单最直接的方式：直接跳到拨号界面
//            //缺点
//            //电话打完后，不会自动回到原应用，直接停留在通话记录界面
//            let url = NSURL.fileURLWithPath("tel://10010")
//            UIApplication.sharedApplication().openURL(url)
            
//            //拨号之前会弹框询问用户是否拨号，拨完后能自动回到原应用
//            // 缺点
//            // 因为是私有API，所以可能不会被审核通过
//            let url = NSURL.fileURLWithPath("telprompt://10010")
//            UIApplication.sharedApplication().openURL(url)
            
          //  创建一个UIWebView来加载URL，拨完后能自动回到原应用
        //  需要注意的是：这个webView千万不要添加到界面上来，不然会挡住其他界面
//            if (self.webView == nil) {
//                self.webView = [[UIWebView alloc] initWithFrame:CGRectZero];
//            }
            self.webView.loadRequest(NSURLRequest.init(URL: NSURL.init(string: "tel://10010")!))
            
       


            
        }
        客服电话.subtitle = "13231126198"
        let twoGroup = CPSettingGroup();
        twoGroup.items = [支持评分,客服电话]
        self.datas.addObject(twoGroup)
        //设置头部
        self.tableView.tableHeaderView = CPAboutHeader.abouHeader()
    }
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25;
    }
    
}