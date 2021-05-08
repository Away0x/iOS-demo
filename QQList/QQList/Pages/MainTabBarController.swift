//
//  MainTabBarController.swift
//  QQList
//
//  Created by 吴彤 on 2021/5/8.
//

import UIKit

class MainTabBarController: BaseTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }

}

extension MainTabBarController : UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // 点击时给 item 里面的图片添加动画
        let anim = CABasicAnimation(keyPath: "transform.scale")
        anim.duration = 0
        anim.repeatCount = 1
        anim.fromValue = 0.6
        anim.toValue = 1
        if let v = viewController.tabBarItem.value(forKey: "view") as? UIControl {
            if let iv = v.value(forKey: "imageView") as? UIImageView {
                iv.layer.add(anim, forKey: "scale-layer")
            }
        }
    }
}
