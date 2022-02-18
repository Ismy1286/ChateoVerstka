//
//  StoriesCell.swift
//  ChateoUIKit
//
//  Created by user on 18.02.2022.
//

import Foundation
import UIKit
import SnapKit


class StoriesCell: UICollectionViewCell {
    
    lazy var cellStories: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    lazy var nameStories: UILabel = {
        let view = UILabel()
        return view
    }()
    
    override func layoutSubviews() {
        addSubview(cellStories)
        cellStories.snp.makeConstraints { make in
            make.top.right.left.equalToSuperview()
        }
        
        addSubview(nameStories)
        nameStories.snp.makeConstraints { make in
            make.top.equalTo(cellStories.snp.bottom).offset(4)
            make.centerY.equalTo(cellStories.snp.centerY)
        }
    }
}
