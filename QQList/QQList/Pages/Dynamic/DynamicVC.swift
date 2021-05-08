//
//  DynamicVC.swift
//  QQList
//
//  Created by 吴彤 on 2021/5/8.
//

import UIKit

class DynamicVC: UITableViewController {
    
    var listData: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0...10 {
            listData.append(["游戏", "日记", "阅读"][i % 3])
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kDynamicCellID, for: indexPath)
        cell.textLabel?.text = listData[indexPath.row]
        let lineTag = 11111111
        
        // 判断一下避免 reuse 时重复添加
        if !cell.subviews.contains(where: { (v) -> Bool in v.tag == lineTag }) {
            // bottom line
            let line = UIView(frame: CGRect(x: 0, y: cell.frame.height-1, width: cell.frame.width, height: 1))
            line.tag = lineTag
            line.backgroundColor = .quaternaryLabel
            cell.addSubview(line)
        }
        
        return cell
    }

}
