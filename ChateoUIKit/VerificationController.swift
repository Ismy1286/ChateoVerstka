//
//  VerificationController.swift
//  ChateoUIKit
//
//  Created by user on 16.02.2022.
//

import Foundation
import UIKit
import SnapKit

class VerificationController: UIViewController {
    
    private lazy var enterNumberLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 15/255, green: 24/255, blue: 40/255, alpha: 1)
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.text = "Enter Your Phone Number"
        view.textAlignment = .center
        return view
    }()
    
    private lazy var confirmCountryLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 15/255, green: 24/255, blue: 40/255, alpha: 1)
        view.font = .systemFont(ofSize: 14)
        view.text = "Please confirm your country code and enter \nyour phone number"
        view.numberOfLines = 0
        view.textAlignment = .center
        return view
    }()
    
    private lazy var flagAndCodeView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 252/255, alpha: 1)
        return view
    }()
    
    private lazy var flagImage: UIImageView = {
        let view = UIImageView(image: UIImage(named: "flag"))
        return view
    }()
    
    private lazy var inputCode: UITextField = {
        let view = UITextField()
        view.textColor = UIColor(red: 15/255, green: 24/255, blue: 40/255, alpha: 1)
        view.font = .systemFont(ofSize: 14, weight: .semibold)
        view.clearsOnBeginEditing = true
        view.placeholder = "+62"
        return view
    }()
    
    private lazy var inputNumberView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 252/255, alpha: 1)
        return view
    }()
    
    private lazy var inputPhoneNumber: UITextField = {
        let view = UITextField()
        view.textColor = UIColor(red: 15/255, green: 24/255, blue: 40/255, alpha: 1)
        view.font = .systemFont(ofSize: 14, weight: .semibold)
        view.clearsOnBeginEditing = true
        view.placeholder = "Phone Number"
        return view
    }()
    
    
    private lazy var continueButton: RoundButton = {
        let view = RoundButton()
        view.setTitle("Continue", for: .normal)
        view.titleLabel!.font = .systemFont(ofSize: 16, weight: .semibold)
        view.titleLabel?.textColor = UIColor(red: 247/255, green: 247/255, blue: 252/255, alpha: 1)
        view.backgroundColor = UIColor(red: 0/255, green: 45/255, blue: 227/255, alpha: 1)
        view.layer.cornerRadius = 30
        view.addTarget(nil, action: #selector(VerifyCode), for: .touchUpInside)
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
        
        view.addSubview(enterNumberLabel)
        enterNumberLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(view.frame.height * 0.2)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(confirmCountryLabel)
        confirmCountryLabel.snp.makeConstraints { make in
            make.top.equalTo(enterNumberLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(flagAndCodeView)
        flagAndCodeView.snp.makeConstraints{ make in
            make.left.equalToSuperview().offset(24)
            make.top.equalTo(confirmCountryLabel.snp.bottom).offset(view.frame.height * 0.06)
            make.width.equalToSuperview().multipliedBy(0.2)
            make.height.equalToSuperview().multipliedBy(0.05)
        }
        
        flagAndCodeView.addSubview(flagImage)
        flagImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8)
            make.centerY.equalToSuperview()
        }
        
        flagAndCodeView.addSubview(inputCode)
        inputCode.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-6)
            make.centerY.equalToSuperview()
        }
        
        view.addSubview(inputNumberView)
        inputNumberView.snp.makeConstraints{ make in
            make.right.equalToSuperview().offset(-24)
            make.left.equalTo(flagAndCodeView.snp.right).offset(8)
            make.centerY.equalTo(flagAndCodeView.snp.centerY)
            make.height.equalToSuperview().multipliedBy(0.05)
        }
        
        inputNumberView.addSubview(inputPhoneNumber)
        inputPhoneNumber.snp.makeConstraints{ make in
            make.left.equalToSuperview().offset(8)
            make.right.bottom.top.equalToSuperview()
        }
        
        view.addSubview(keyboardImage)
        keyboardImage.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(view.frame.height * 0.33)
        }
        
        view.addSubview(continueButton)
        continueButton.snp.makeConstraints { make in
            make.bottom.equalTo(keyboardImage.snp.top).offset(view.frame.height * (-0.04))
            make.left.right.equalToSuperview().inset(view.frame.width * 0.066)
            make.height.equalToSuperview().multipliedBy(0.066)
        }
    }
    
    @objc func VerifyCode(sender: UIButton) {
        if sender.titleLabel?.text == "Continue"{
            navigationController?.pushViewController(VerifyCodeController(), animated: true)
        }
    }
}
