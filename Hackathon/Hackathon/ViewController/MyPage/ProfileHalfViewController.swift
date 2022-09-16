//
//  ProfileHalfViewController.swift
//  Hackathon
//
//  Created by Jaehyeok Lim on 2022/09/16.
//

import UIKit
import SnapKit

class ProfileHalfViewController: UIViewController {
    
    var superViewUIList: [UIView] = []
    
    private let userName: UILabel = {
        let label = UILabel()
        
        label.text = UserInfoDataList[0].userName! + "님 안녕하세요!"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = UIColor.black
        
        return label
    }()
    
    private let userIDTitleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "아이디"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor.black
        
        return label
    }()
    
    private let profileEdge: UIButton = {
        let button = UIButton()
        
        button.layer.cornerRadius = 10
        button.layer.backgroundColor = UIColor.topViewBackgroundColor?.cgColor
        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.layer.shadowOpacity = 1.0
        button.layer.shadowOffset = CGSize.zero
        button.layer.shadowRadius = 6
        
        return button
    }()
    
    private let userIDLabel: UILabel = {
        let label = UILabel()
        
        label.text = UserInfoDataList[0].userID
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.darkGray
        
        return label
    }()
    
    private let profileHalfViewVerticalLine: UIButton = {
        let button = UIButton()
        
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.white.cgColor
        
        return button
    }()
    
    private let userEmailTitleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "이메일"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor.black
        
        return label
    }()
    
    private let userEmailLabel: UILabel = {
        let label = UILabel()
        
        label.text = UserInfoDataList[0].userEmail
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.darkGray
        
        return label
    }()
    
    private let userPhoneNumberTitleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "전화번호"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor.black
        
        return label
    }()
    
    private let userPhoneNumberLabel: UILabel = {
        let label = UILabel()
        
        label.text = "0" + String(UserInfoDataList[0].userCellPhoneNumber!)
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.darkGray
        
        return label
    }()
    
    private let userAddressTitleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "주소지"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor.black
        
        return label
    }()
    
    private let userAddressLabel: UILabel = {
        let label = UILabel()
        
        label.text = UserInfoDataList[0].userAddress! + " " + UserInfoDataList[0].aptNum!
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.darkGray
        
        return label
    }()
    
    private let titleLogo: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "cube.transparent.fill")
        imageView.tintColor = UIColor.white

        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "DoBox"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        
        return label
    }()
    
    private let logoutButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("로그아웃", for: .normal)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = 10
        button.layer.backgroundColor = UIColor.white.cgColor
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        superViewLayout()
    }
    
    private func superViewLayout() {
        view.backgroundColor = UIColor.white
        
        superViewUIList = [userName, profileEdge, userIDTitleLabel, userIDLabel, profileHalfViewVerticalLine, userEmailTitleLabel, userEmailLabel, userPhoneNumberTitleLabel, userPhoneNumberLabel, userAddressTitleLabel, userAddressLabel, titleLogo, titleLabel, logoutButton]
        
        for uiName in superViewUIList {
            view.addSubview(uiName)
        }
        
        userName.snp.makeConstraints { make in
            make.top.equalTo(view).offset(35)
            make.leading.equalTo(view).offset(30)
        }
        
        profileEdge.snp.makeConstraints { make in
            make.top.equalTo(userName.snp.bottom).offset(30)
            make.leading.equalTo(view).offset(20)
            make.trailing.equalTo(view).offset(-20)
            make.height.equalTo(200)
        }
        
        userIDTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(userName.snp.bottom).offset(55)
            make.leading.equalTo(view).offset(40)
        }
        
        userIDLabel.snp.makeConstraints { make in
            make.top.equalTo(userIDTitleLabel.snp.bottom).offset(2)
            make.leading.equalTo(view).offset(40)
        }
        
//        profileHalfViewVerticalLine.snp.makeConstraints { make in
//            make.top.equalTo(userIDTitleLabel).offset(2.5)
//            make.leading.equalTo(userIDTitleLabel.snp.trailing).offset(115)
//            make.bottom.equalTo(profileEdge.snp.bottom).offset(-18)
//            make.width.equalTo(1.5)
//        }
//
        userEmailTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(userIDLabel.snp.bottom).offset(15)
            make.leading.equalTo(view).offset(40)
        }
        
        userEmailLabel.snp.makeConstraints { make in
            make.top.equalTo(userEmailTitleLabel.snp.bottom).offset(2)
            make.leading.equalTo(view).offset(40)
        }
        
        userPhoneNumberTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(userIDTitleLabel)
            make.leading.equalTo(userIDTitleLabel.snp.trailing).offset(130)
        }
        
        userPhoneNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(userPhoneNumberTitleLabel.snp.bottom).offset(2)
            make.leading.equalTo(userPhoneNumberTitleLabel)
        }
        
        userAddressTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(userEmailLabel.snp.bottom).offset(15)
            make.leading.equalTo(view).offset(40)
        }
        
        userAddressLabel.snp.makeConstraints { make in
            make.top.equalTo(userAddressTitleLabel.snp.bottom).offset(2)
            make.leading.equalTo(view).offset(40)
        }
        
        titleLogo.snp.makeConstraints { make in
            make.top.equalTo(userAddressTitleLabel)
            make.leading.equalTo(userAddressTitleLabel).offset(170)
            make.size.equalTo(CGSize(width: 45, height: 45))
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLogo).offset(4.5)
            make.leading.equalTo(titleLogo.snp.trailing).offset(8)
        }
        
        logoutButton.snp.makeConstraints { make in
            make.top.equalTo(profileEdge.snp.bottom).offset(15)
            make.trailing.equalTo(profileEdge).offset(10)
            make.size.equalTo(CGSize(width: 80, height: 45))
        }
        
        logoutButton.addTarget(self, action: #selector(logoutButtonAction), for: .touchUpInside)
    }
    
    @objc func logoutButtonAction(_: UIButton) {
        
        let popup = UIAlertController(title: "알림", message: "정말 로그아웃을 하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
        let cancelAction = UIAlertAction(title: "취소", style: .default) { (action) in
            return
        }
        let acceptAction = UIAlertAction(title: "확인", style: .default) { (action) in
            UserDefaults.standard.set(false, forKey: "LoginStatus")
            self.dismiss(animated: true)
        }
        
        popup.addAction(cancelAction)
        popup.addAction(acceptAction)
        
        present(popup, animated: true)
    }
}
