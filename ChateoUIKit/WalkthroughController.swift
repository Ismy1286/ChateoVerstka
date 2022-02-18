//
//  ViewController.swift
//  ChateoUIKit
//
//  Created by user on 16.02.2022.
//

import UIKit
import SnapKit

class WalkthroughController: UIViewController {
    
    private lazy var illustration: UIImageView = {
        let view = UIImageView(image: UIImage(named: "illustration1"))
        return view
    }()
    
    private lazy var mainLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 15/255, green: 24/255, blue: 40/255, alpha: 1)
        view.font = .systemFont(ofSize: 24, weight: .bold)
        view.text = "Connect easily with \nyour family and friends \nover countries"
        view.numberOfLines = 0
        view.textAlignment = .center
        return view
    }()
    
    private lazy var termsAndPrivacyLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 15/255, green: 24/255, blue: 40/255, alpha: 1)
        view.font = .systemFont(ofSize: 14, weight: .semibold)
        view.text = "Terms & Privacy Policy"
        return view
    }()
    
    private lazy var startMessagingButton: RoundButton = {
        let view = RoundButton()
        view.setTitle("Start Messaging", for: .normal)
        view.titleLabel!.font = .systemFont(ofSize: 16, weight: .semibold)
        view.titleLabel?.textColor = UIColor(red: 247/255, green: 247/255, blue: 252/255, alpha: 1)
        view.backgroundColor = UIColor(red: 0/255, green: 45/255, blue: 227/255, alpha: 1)
//        view.layer.cornerRadius = view.bounds.height / 2
        view.addTarget(nil, action: #selector(Verification), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews(){
        
        view.backgroundColor = .white
        
        view.addSubview(illustration)
        illustration.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-view.frame.height / 2)
            make.centerX.equalToSuperview().offset(5)
            make.height.equalToSuperview().multipliedBy(0.334)
            make.width.equalTo(view.frame.height * 0.332)
        }
        
        view.addSubview(mainLabel)
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(illustration.snp.bottom).offset(view.frame.height / 20)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(startMessagingButton)
        startMessagingButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(view.frame.height * (-0.04))
            make.left.right.equalToSuperview().inset(view.frame.width * 0.066)
            make.height.equalToSuperview().multipliedBy(0.066)
        }
        
        view.addSubview(termsAndPrivacyLabel)
        termsAndPrivacyLabel.snp.makeConstraints { make in
            make.bottom.equalTo(startMessagingButton.snp.top).offset(view.frame.height * (-0.025))
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func Verification(sender: UIButton) {
        if sender.titleLabel?.text == "Start Messaging"{
            navigationController?.pushViewController(VerificationController(), animated: true)
        }
    }
}

class RoundButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = bounds.height / 2
    }
}

