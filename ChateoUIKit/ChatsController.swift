//
//  ChatsController.swift
//  ChateoUIKit
//
//  Created by user on 18.02.2022.
//

import Foundation
import UIKit
import SnapKit

class ChatsController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDataSource, UITableViewDelegate {
    
    
    
    private var stories: [StoriesModel] = []
    
    private var contacts: [ContactModel] = []
    
    private lazy var collectionStories: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.delegate = self
        view.dataSource = self
        view.register(StoriesCell.self, forCellWithReuseIdentifier: "StoriesCell")
        view.backgroundColor = .white
        return view
    }()
    
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
        view.placeholder = "Placeholder"
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
        view.setImage(UIImage(named: "contacts"), for: .normal)
        return view
    }()
    
    private lazy var chatsImage: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "chatsTapped"), for: .normal)
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
        
        view.addSubview(collectionStories)
        collectionStories.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(view.frame.height * 0.13)
            make.height.equalToSuperview().multipliedBy(0.134)
        }
        
        view.addSubview(searchView)
        searchView.snp.makeConstraints{ make in
            make.left.right.equalToSuperview().inset(view.frame.width * 0.05)
            make.top.equalTo(collectionStories.snp.bottom).offset(view.frame.height * 0.02)
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
        
        stories.append(StoriesModel(image: "yourStories", name: "Your Story"))
        stories.append(StoriesModel(image: "avatarMidala", name: "Midala Hu..."))
        stories.append(StoriesModel(image: "avatarSalsa", name: "Salsabila..."))
        
        
        contactTableView.dataSource = self
        contactTableView.delegate = self
        
        contacts.append(ContactModel(name: "Athalia Putri", lastSeen: "Good morning, did you sleep well?", image: "Athalia"))
        contacts.append(ContactModel(name: "Raki Devon", lastSeen: "How is it going?", image: "raki"))
        contacts.append(ContactModel(name: "Erlan Sadewa", lastSeen: "Aight, noted", image: "erlan"))
        
        navigationItem.title = "Chats"
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
    
    func collectionView(_ collectionStories: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(
            width: view.frame.width * 0.1,
            height: view.frame.height * 0.134)
    }
    
    func collectionView(_ collectionStories: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionStories: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }
    
    func collectionView(_ collectionStories: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let index = indexPath.row
        let model = stories[index]
        let cell = collectionStories.dequeueReusableCell(withReuseIdentifier: "StoriesCell", for: indexPath) as! StoriesCell
        cell.cellStories.image = UIImage(named: model.image)
        cell.nameStories.text = model.name
        return cell
    }
}
