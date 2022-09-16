//
//  UserProfileViewController.swift
//  Hackathon
//
//  Created by Jaehyeok Lim on 2022/09/15.
//

import UIKit
import SnapKit

class UserProfileViewController: UIViewController {
    
    var superViewUIList: [UIView] = []
    var scrollViewUIList: [UIView] = []
    var contentViewUIList: [UIView] = []
    var items = ["공지사항", "문의하기", "이벤트", "이용방법","회원탈퇴"]

    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "마이페이지"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        
        return label
    }()
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        
        view.backgroundColor = UIColor.topViewBackgroundColor
        view.showsVerticalScrollIndicator = false

        return view
    }()

    private let contentView: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.topViewBackgroundColor
        
        return view
    }()
    
    private let userProfileViewEdge: UIButton = {
        let button = UIButton()
        
        button.layer.backgroundColor = UIColor.white.cgColor
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    private let userProfileViewLabel: UILabel = {
        let label = UILabel()
        
        label.text = "프로필"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    private let userProfileViewButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = UIColor.black
        
        return button
    }()
    
    private let userProfileImage: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "person.circle"), for: .normal)
        button.tintColor = UIColor.gray
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        
        return button
    }()
    
    private let walletViewEdge: UIButton = {
        let button = UIButton()
        
        button.layer.backgroundColor = UIColor.white.cgColor
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    private let walletViewLabel: UILabel = {
        let label = UILabel()
        
        label.text = "내 지갑 바로가기"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    private let walletViewButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = UIColor.black
        
        return button
    }()
    
    private let walletViewExampleImage: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "CreditCardExample"), for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        
        return button
    }()
    
    private let settingViewEdge: UIButton = {
        let button = UIButton()
        
        button.layer.backgroundColor = UIColor.white.cgColor
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    private let settingViewLabel: UILabel = {
        let label = UILabel()
        
        label.text = "설정"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        
        return label
    }()
    
    private let tableView: UITableView = {
        let view = UITableView()
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.rowHeight = 62
        view.separatorInset.left = 0
        view.isScrollEnabled = false
        view.showsVerticalScrollIndicator = false
        view.register(UserProfileViewTableCell.self, forCellReuseIdentifier: "UserProfileViewTableCell")
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        superViewLayout()
        scrollViewLayout()
        contentViewLayout()
    }
    
    private func superViewLayout() {
        view.backgroundColor = UIColor.topViewBackgroundColor
        
        superViewUIList = [scrollView, titleLabel]
        
        for uiView in superViewUIList {
            view.addSubview(uiView)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(55)
            make.width.equalTo(view)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view).offset(100)
            make.leading.bottom.trailing.equalTo(0)
        }
    }
    
    private func scrollViewLayout() {
        scrollViewUIList = [contentView]
        
        for uiView in scrollViewUIList {
            scrollView.addSubview(uiView)
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(scrollView)
            make.leading.trailing.bottom.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.equalTo(1700)
        }
    }
    
    private func contentViewLayout() {
        contentViewUIList = [userProfileViewEdge, userProfileViewLabel, userProfileViewButton, walletViewEdge, walletViewLabel, walletViewButton, settingViewEdge, settingViewLabel, tableView]
        
        for uiView in contentViewUIList {
            contentView.addSubview(uiView)
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        
        userProfileViewEdge.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(5)
            make.leading.equalTo(contentView).offset(20)
            make.trailing.equalTo(contentView).offset(-20)
            make.height.equalTo(55)
        }
        
        userProfileViewLabel.snp.makeConstraints { make in
            make.top.equalTo(userProfileViewEdge).offset(16.5)
            make.leading.equalTo(userProfileViewEdge).offset(15)
        }
        
        userProfileViewButton.snp.makeConstraints { make in
            make.top.equalTo(userProfileViewEdge).offset(6)
            make.trailing.equalTo(userProfileViewEdge).offset(0)
            make.size.equalTo(CGSize(width: 45, height: 45))
        }
        
//        userProfileImage.snp.makeConstraints { make in
//            make.top.equalTo(userProfileViewLabel.snp.bottom).offset(15)
//            make.leading.equalTo(userProfileViewEdge).offset(15)
//            make.size.equalTo(CGSize(width: 90, height: 85))
//        }
        
        walletViewEdge.snp.makeConstraints { make in
            make.top.equalTo(userProfileViewEdge.snp.bottom).offset(30)
            make.leading.equalTo(contentView).offset(20)
            make.trailing.equalTo(contentView).offset(-20)
            make.height.equalTo(55)
        }
        
        walletViewLabel.snp.makeConstraints { make in
            make.top.equalTo(walletViewEdge).offset(16.5)
            make.leading.equalTo(walletViewEdge).offset(15)
        }
        
        walletViewButton.snp.makeConstraints { make in
            make.top.equalTo(walletViewEdge).offset(6)
            make.trailing.equalTo(walletViewEdge).offset(0)
            make.size.equalTo(CGSize(width: 45, height: 45))
        }
        
//        walletViewExampleImage.snp.makeConstraints { make in
//            make.top.equalTo(walletViewLabel.snp.bottom).offset(30)
//            make.leading.equalTo(walletViewEdge).offset(30)
//            make.trailing.equalTo(walletViewEdge).offset(-30)
//            make.height.equalTo(200)
//        }
        
        settingViewEdge.snp.makeConstraints { make in
            make.top.equalTo(walletViewEdge.snp.bottom).offset(30)
            make.leading.equalTo(contentView).offset(20)
            make.trailing.equalTo(contentView).offset(-20)
            make.height.equalTo(369)
        }
        
        settingViewLabel.snp.makeConstraints { make in
            make.top.equalTo(settingViewEdge).offset(15)
            make.leading.equalTo(settingViewEdge).offset(15)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(settingViewLabel.snp.bottom).offset(15)
            make.leading.bottom.trailing.equalTo(settingViewEdge)
        }
        
        userProfileViewButton.addTarget(self, action: #selector(userProfileViewButtonAction), for: .touchUpInside)
    }
    
    @objc func userProfileViewButtonAction(_: UIButton) {
        if UserDefaults.standard.bool(forKey: "LoginStatus") {
            let popup = UIAlertController(title: "알림", message: "이미 로그인이 되셨습니다!", preferredStyle: .alert)
            
            let rightAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default) { action in
                
                let detailViewController = ProfileHalfViewController()
                let nav = UINavigationController(rootViewController: detailViewController)
                // 1
                nav.modalPresentationStyle = .pageSheet

                
                // 2
                if let sheet = nav.sheetPresentationController {

                    // 3
                    sheet.detents = [.medium(), .medium()]

                }
                // 4
                self.present(nav, animated: true, completion: nil)
            }
            
            popup.addAction(rightAction)
            
            self.present(popup, animated: true, completion: nil)
            
        } else {
            let viewController = LoginViewController()
            
            viewController.modalPresentationStyle = .fullScreen
            
            present(viewController, animated: true)
        }
    }
}

extension UserProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserProfileViewTableCell", for: indexPath) as! UserProfileViewTableCell
        
//        cell.sideMenuItem.text = items[indexPath.row]
        cell.sideMenuItem.setTitle(items[indexPath.row], for: .normal)
        
        return cell
    }
    
}
