//
//  ProfileController.swift
//  ChateoUIKit
//
//  Created by user on 17.02.2022.
//

import Foundation
import UIKit
import SnapKit

class ProfileController: UIViewController {
    
    private lazy var avatar: UIImageView = {
        let view = UIImageView(image: UIImage(named: "avatar"))
        return view
    }()
    
    private lazy var inputNameView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 252/255, alpha: 1)
        return view
    }()
    
    private lazy var inputFirstName: UITextField = {
        let view = UITextField()
        view.textColor = UIColor(red: 15/255, green: 24/255, blue: 40/255, alpha: 1)
        view.font = .systemFont(ofSize: 14, weight: .semibold)
        view.clearsOnBeginEditing = true
        view.placeholder = "First Name (Required)"
        return view
    }()
    
    private lazy var inputLastNameView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 252/255, alpha: 1)
        return view
    }()
    
    private lazy var inputLastName: UITextField = {
        let view = UITextField()
        view.textColor = UIColor(red: 15/255, green: 24/255, blue: 40/255, alpha: 1)
        view.font = .systemFont(ofSize: 14, weight: .semibold)
        view.clearsOnBeginEditing = true
        view.placeholder = "Last Name (Optional)"
        return view
    }()
    
    
    private lazy var saveButton: RoundButton = {
        let view = RoundButton()
        view.setTitle("Save", for: .normal)
        view.titleLabel!.font = .systemFont(ofSize: 16, weight: .semibold)
        view.titleLabel?.textColor = UIColor(red: 247/255, green: 247/255, blue: 252/255, alpha: 1)
        view.backgroundColor = UIColor(red: 0/255, green: 45/255, blue: 227/255, alpha: 1)
        view.layer.cornerRadius = 30
        view.addTarget(nil, action: #selector(Contacts), for: .touchUpInside)
        return view
    }()
    
    private lazy var keyboardImage: UIImageView = {
        let view = UIImageView(image: UIImage(named: "keyboard2"))
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews(){
        
        view.backgroundColor = .white
        
        view.addSubview(avatar)
        avatar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(view.frame.height * 0.15)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(inputNameView)
        inputNameView.snp.makeConstraints{ make in
            make.left.right.equalToSuperview().inset(view.frame.width * 0.066)
            make.top.equalTo(avatar.snp.bottom).offset(view.frame.height * 0.03)
            make.height.equalToSuperview().multipliedBy(0.05)
        }
        
        inputNameView.addSubview(inputFirstName)
        inputFirstName.snp.makeConstraints{ make in
            make.left.equalToSuperview().offset(8)
            make.right.bottom.top.equalToSuperview()
        }
        
        view.addSubview(inputLastNameView)
        inputLastNameView.snp.makeConstraints{ make in
            make.left.right.equalToSuperview().inset(view.frame.width * 0.066)
            make.top.equalTo(inputNameView.snp.bottom).offset(view.frame.height * 0.03)
            make.height.equalToSuperview().multipliedBy(0.05)
        }
        
        inputLastNameView.addSubview(inputLastName)
        inputLastName.snp.makeConstraints{ make in
            make.left.equalToSuperview().offset(8)
            make.right.bottom.top.equalToSuperview()
        }
        
        view.addSubview(keyboardImage)
        keyboardImage.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(view.frame.height * 0.33)
        }
        
        view.addSubview(saveButton)
        saveButton.snp.makeConstraints { make in
            make.bottom.equalTo(keyboardImage.snp.top).offset(view.frame.height * (-0.04))
            make.left.right.equalToSuperview().inset(view.frame.width * 0.066)
            make.height.equalToSuperview().multipliedBy(0.066)
        }
    }
    
    @objc func Contacts(sender: UIButton) {
        if sender.titleLabel?.text == "Save"{
            navigationController?.pushViewController(ContactsController(), animated: true)
        }
    }
}
