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
    
    lazy var contactImage: UIImageView = {
        let view = UIImageView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 16
        return view
    }()
    
    lazy var contactName: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 14, weight: .semibold)
        view.textColor = UIColor(red: 15/255, green: 24/255, blue: 40/255, alpha: 1)
        return view
    }()
    
    lazy var contactLastSeen: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 14, weight: .semibold)
        view.textColor = UIColor(red: 173/255, green: 181/255, blue: 189/255, alpha: 1)
        return view
    }()
    
    lazy var border: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1)
        return view
    }()
    
    override func layoutSubviews() {
        
        addSubview(contactImage)
        contactImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.6)
            make.width.equalTo(frame.height * 0.6)
            make.left.equalToSuperview().inset(frame.width * 0.05)
        }
        
        addSubview(contactName)
        contactName.snp.makeConstraints { make in
            make.left.equalTo(contactImage.snp.right).offset(14)
            make.top.equalTo(contactImage.snp.top)
            make.height.equalToSuperview().multipliedBy(0.29)
        }
        
        addSubview(contactLastSeen)
        contactLastSeen.snp.makeConstraints { make in
            make.left.equalTo(contactImage.snp.right).offset(14)
            make.bottom.equalTo(contactImage.snp.bottom)
            make.height.equalToSuperview().multipliedBy(0.29)
        }
        
        addSubview(border)
        border.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-1)
            make.height.equalTo(1)
            make.width.equalToSuperview().inset(frame.width * 0.05)
        }
    }
}
