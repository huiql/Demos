//
//  MyUser.swift
//  Demo3
//
//  Created by quanlinghui on 2025/7/3.
//

import UIKit

//class MyUser: NSObject {
//
//}


// User.swift（Swift 语法）
//import Foundation // 如果不需要 UIKit，用 Foundation 更轻量

 @objc class MyUser: NSObject {
    @objc var name: String
    @objc var age: Int
//     @objc let button: UIButton
    
    @objc init(name: String, age: Int) {
        self.name = name
        self.age = age
        super.init()
    }
    
    @objc func putInfo(address: String) {
        print("名字是\(name), \(age)岁, 地址: \(address)")
    }
     
     
     @objc func createButton(rect: CGRect, name: String)->(UIButton) {
         let button = UIButton(type: .system)
         button.backgroundColor = .red;
         button.frame = rect
         button.setTitle(name, for: .normal)
//         button.titleColor(for: .normal)
         button .setTitleColor(.white, for: .normal)
         button.layer.cornerRadius = 9;
         
         button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
         return button
     }
     
     @objc func buttonAction(_ button: UIButton) {
         button .setTitleColor(.green, for: .normal)
         print("按钮点击了")
     }
 
}
