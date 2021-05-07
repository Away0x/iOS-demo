//
//  ChildViewController.swift
//  TopTabLayout
//
//  Created by 吴彤 on 2021/5/7.
//

import UIKit
import XLPagerTabStrip

class ChildViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var labelTitle = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = labelTitle
    }

}

extension ChildViewController : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        IndicatorInfo(title: labelTitle)
    }
}
