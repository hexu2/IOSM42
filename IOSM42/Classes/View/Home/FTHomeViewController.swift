//
//  FTHomeViewContoller.swift
//  MOBL42
//
//  Created by 何旭 on 2019/5/3.
//  Copyright © 2019 何旭. All rights reserved.
//

import UIKit

//全局常量，最好设置成private
private let cellId = "cellId"

class FTHomeViewController: FTBaseViewController {
    //首页消息数组
    private lazy var statuslist = [String]()
    
    
    //加载数据
    override func loadData() {
        for i in 0..<10 {
            statuslist.insert(i.description, at: 0)
        }
    }
    
    
    //显示好友
    @objc func showFriends(){
        print("show friends...")
        let vc = FTDemoViewController()
//        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - 实现表格数据源方法
extension FTHomeViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statuslist.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.textLabel?.text = statuslist[indexPath.row]
        
        return cell
        
    }
    
    
}

//MARK: --  设置界面
extension FTHomeViewController {
    
    //重写父类
    override func setupUI() {
        super.setupUI()
        
        // 设置导航栏按钮
        let btn = UIButton.ex_textButton(title: "好友", fontSize: UIFont.systemFontSize, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
        btn.addTarget(self, action: #selector(showFriends), for: UIControl.Event.touchUpInside)
        naviItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        
        //注册原型cell
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
}
