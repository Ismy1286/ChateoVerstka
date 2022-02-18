//
//  NewsCell.swift
//  ChateoUIKit
//
//  Created by user on 17.02.2022.
//

import Foundation
import UIKit
import SnapKit


class ContactsCell: UITableViewCell {
    
    lazy var titleImage: UIImageView = {
        let view = UIImageView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()
    
    lazy var titleName: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 15)
        view.numberOfLines = 0
        return view
    }()
    
    lazy var titleDescription: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 10)
        view.textColor = UIColor(red: 51/255, green: 60/255, blue: 68/255, alpha: 1)
        view.numberOfLines = 0
        return view
    }()
    
    lazy var border: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    override func layoutSubviews() {
        
        addSubview(titleImage)
        titleImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(5)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(90)
        }
        
        addSubview(titleName)
        titleName.snp.makeConstraints { make in
            make.left.equalTo(titleImage.snp.right).offset(10)
            make.top.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(40)
        }
        
        addSubview(titleDescription)
        titleDescription.snp.makeConstraints { make in
            make.left.equalTo(titleImage.snp.right).offset(10)
            make.top.equalTo(titleName.snp.bottom).offset(5)
            make.right.equalToSuperview().offset(-5)
            make.bottom.equalToSuperview().offset(-6)
        }
        
        addSubview(border)
        border.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-1)
            make.height.equalTo(1)
            make.width.equalToSuperview().multipliedBy(0.97)
        }
    }
}
