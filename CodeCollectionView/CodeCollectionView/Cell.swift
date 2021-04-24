//
//  Cell.swift
//  CodeCollectionView
//
//  Created by 吴彤 on 2021/4/24.
//

import UIKit

class Cell: UICollectionViewCell {
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false // false: 设置 autolayout 约束才会生效
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    // 代码创建 view 时需要该构造函数
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        setUI()
    }
    
    // xib 创建时才会用到
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 设置 autolayout
    private func setUI() {
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
}
