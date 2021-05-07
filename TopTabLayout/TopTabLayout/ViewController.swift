//
//  ViewController.swift
//  TopTabLayout
//
//  Created by 吴彤 on 2021/5/7.
//

import UIKit
import XLPagerTabStrip

class ViewController: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        // MARK: 设置上方的 bar 按钮条的 UI
        settings.style.selectedBarBackgroundColor = .blue
        settings.style.selectedBarHeight = 2
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarItemFont = .systemFont(ofSize: 15)
        
        super.viewDidLoad()
        
        containerView.bounces = false
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .secondaryLabel
            newCell?.label.textColor = .label
        }
    }

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        var vcs: [ChildViewController] = []
        
        for i in 1...10 {
            let vc = storyboard!.instantiateViewController(identifier: "ChildViewControllerID") as! ChildViewController
            vc.labelTitle = "page \(i)"
            vcs.append(vc)
        }
        
        return vcs
    }
}

