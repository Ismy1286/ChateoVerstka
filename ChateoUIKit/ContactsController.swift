//
//  ContactsController.swift
//  ChateoUIKit
//
//  Created by user on 17.02.2022.
//

import Foundation
import UIKit
import SnapKit

class ContactsController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var contacts: [ContactModel] = []
    
    private lazy var searchView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 252/255, alpha: 1)
        return view
    }()
    
    private lazy var searchImage: UIImageView = {
        let view = UIImageView(image: UIImage(named: "search"))
        return view
    }()
    
    private lazy var searchField: UITextField = {
        let view = UITextField()
        view.textColor = UIColor(red: 15/255, green: 24/255, blue: 40/255, alpha: 1)
        view.font = .systemFont(ofSize: 14, weight: .semibold)
        view.clearsOnBeginEditing = true
        view.placeholder = "Search"
        return view
    }()
    
    private lazy var contactTableView: UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    private lazy var downButtonsView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 252/255, alpha: 1)
        return view
    }()
    
    private lazy var contactstImage: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "contactsTapped"), for: .normal)
        return view
    }()
    
    private lazy var chatsImage: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "chats"), for: .normal)
        view.addTarget(nil, action: #selector(Chats), for: .touchUpInside)
        return view
    }()
    
    private lazy var moreImage: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "more"), for: .normal)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubView()
        setupViews()
    }
    
    private func setupSubView() {
        
        view.backgroundColor = .white
        
        view.addSubview(searchView)
        searchView.snp.makeConstraints{ make in
            make.left.right.equalToSuperview().inset(view.frame.width * 0.05)
            make.top.equalToSuperview().offset(view.frame.height * 0.13)
            make.height.equalToSuperview().multipliedBy(0.05)
        }
        
        searchView.addSubview(searchImage)
        searchImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        
        searchView.addSubview(searchField)
        searchField.snp.makeConstraints { make in
            make.left.equalTo(searchImage.snp.right).offset(10)
            make.centerY.equalToSuperview()
        }
        
        view.addSubview(downButtonsView)
        downButtonsView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.1)
            make.bottom.equalToSuperview()
        }
        
        downButtonsView.addArrangedSubview(contactstImage)
        downButtonsView.addArrangedSubview(chatsImage)
        downButtonsView.addArrangedSubview(moreImage)
        
        view.addSubview(contactTableView)
        contactTableView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(searchView.snp.bottom)
            make.bottom.equalTo(downButtonsView.snp.top)
        }
    }
    
    private func setupViews() {
        
        contactTableView.dataSource = self
        contactTableView.delegate = self
        
        contacts.append(ContactModel(name: "Athalia Putri", lastSeen: "Last seen yesterday", image: "Athalia"))
        contacts.append(ContactModel(name: "Erlan Sadewa", lastSeen: "Online", image: "erlan"))
        contacts.append(ContactModel(name: "Midala Huera", lastSeen: "Last seen 3 hours ago", image: "midala"))
        contacts.append(ContactModel(name: "Nafisa Gitari", lastSeen: "Online", image: "nafisa"))
        contacts.append(ContactModel(name: "Raki Devon", lastSeen: "Online", image: "raki"))
        contacts.append(ContactModel(name: "Salsabila Akira", lastSeen: "Last seen 30 minutes ago", image: "salsa"))
        
        navigationItem.title = "Contacts"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (view.frame.height * 0.104)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = ContactsCell()
        let model = contacts[indexPath.row]
        
        cell.contactName.text = model.name
        cell.contactLastSeen.text = model.lastSeen
        cell.contactImage.image = UIImage(named: model.image)
        
        return cell
    }
    
    @objc func Chats(sender: UIButton) {
            navigationController?.pushViewController(ChatsController(), animated: true)
    }
}
