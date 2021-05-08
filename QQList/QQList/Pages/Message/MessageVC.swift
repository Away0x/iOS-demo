//
//  MessageVC.swift
//  QQList
//
//  Created by 吴彤 on 2021/5/8.
//

import UIKit

class MessageVC: UITableViewController {
    
    private var listData: [MessageItem] = []
    
    private lazy var faceImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "avatar")
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...10 {
            listData.append([
                MessageItem(img: UIImage(named: "qq_face")!, name: "独立开发者", desc: "有温度的Coder", time: "下午8:00"),
                MessageItem(img: UIImage(named: "qq_face2")!, name: "0&1设计开发一款App", desc: "双十一剁手吗？", time: "下午8:00"),
                MessageItem(img: UIImage(named: "qq_face3")!, name: "UI设计", desc: "情感化设计", time: "下午8:00"),
            ][i % 3])
        }

        // 设置 navigation bar 左侧 view
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: faceImageView)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kMessageCellID, for: indexPath) as! MessageCell
        cell.info = listData[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard!.instantiateViewController(identifier: kMessageDetailVCID) as! MessageDetailVC
        vc.labelText = "\(indexPath.row). \(listData[indexPath.row].name)"
        navigationController?.pushViewController(vc, animated: true)
    }

}
