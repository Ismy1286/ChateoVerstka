//
//  VerificationCodeController.swift
//  ChateoUIKit
//
//  Created by user on 16.02.2022.
//

import Foundation
import UIKit
import SnapKit

class VerifyCodeController: UIViewController {
    
    private lazy var enterCodeLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 15/255, green: 24/255, blue: 40/255, alpha: 1)
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.text = "Enter Code"
        view.textAlignment = .center
        return view
    }()
    
    private lazy var sentSMSLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 15/255, green: 24/255, blue: 40/255, alpha: 1)
        view.font = .systemFont(ofSize: 14)
        view.text = "We have sent you an SMS with the code \nto +62 1309 - 1710 - 1920"
        view.numberOfLines = 0
        view.textAlignment = .center
        return view
    }()
    
    private lazy var inputSMSCode: UITextField = {
        let view = UITextField()
        view.textColor = UIColor(red: 173/255, green: 181/255, blue: 189/255, alpha: 1)
        view.font = .systemFont(ofSize: 32, weight: .bold)
        view.clearsOnBeginEditing = true
        view.text = "****"
        return view
    }()
    
    private lazy var continueButton: UIButton = {
        let view = UIButton()
        view.setTitle("Continue", for: .normal)
        view.titleLabel!.font = .systemFont(ofSize: 16, weight: .semibold)
        view.titleLabel?.textColor = UIColor(red: 247/255, green: 247/255, blue: 252/255, alpha: 1)
        view.backgroundColor = UIColor(red: 0/255, green: 45/255, blue: 227/255, alpha: 1)
        view.layer.cornerRadius = 30
//        view.addTarget(nil, action: #selector(VerificationCode), for: .touchUpInside)
        return view
    }()
    
    private lazy var keyboardImage: UIImageView = {
        let view = UIImageView(image: UIImage(named: "keyboard"))
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews(){
        
        view.backgroundColor = .white
        
        view.addSubview(enterCodeLabel)
        enterCodeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(view.frame.height * 0.2)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(sentSMSLabel)
        sentSMSLabel.snp.makeConstraints { make in
            make.top.equalTo(enterCodeLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(inputSMSCode)
        inputSMSCode.snp.makeConstraints{ make in
            make.left.equalToSuperview().offset(24)
            make.top.equalTo(sentSMSLabel.snp.bottom).offset(view.frame.height * 0.06)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalToSuperview().multipliedBy(0.05)
        }
        
        view.addSubview(keyboardImage)
        keyboardImage.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(keyboardImage.frame.width * 0.9)
        }
        
        view.addSubview(continueButton)
        continueButton.snp.makeConstraints { make in
            make.bottom.equalTo(keyboardImage.snp.top).offset(-30)
            make.left.right.equalToSuperview().inset(view.frame.width * 0.065)
            make.height.equalToSuperview().multipliedBy(0.065)
        }
    }
    
//    @objc func Verification(sender: UIButton) {
//        if sender.titleLabel?.text == "Continue"{
//            navigationController?.pushViewController(VerificationCodeController(), animated: true)
//        }
//    }
}
