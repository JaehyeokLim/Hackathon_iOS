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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        superViewLayout()
    }
    
    private func superViewLayout() {
        view.backgroundColor = UIColor.white
        
        superViewUIList = [userName, profileEdge, userIDTitleLabel, userIDLabel, profileHalfViewVerticalLine, userEmailTitleLabel, userEmailLabel]
        
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
            make.top.equalTo(userName.snp.bottom).offset(50)
            make.leading.equalTo(view).offset(40)
        }
        
        userIDLabel.snp.makeConstraints { make in
            make.top.equalTo(userIDTitleLabel.snp.bottom).offset(5)
            make.leading.equalTo(view).offset(40)
        }
        
        profileHalfViewVerticalLine.snp.makeConstraints { make in
            make.top.equalTo(userIDTitleLabel).offset(2.5)
            make.leading.equalTo(userIDTitleLabel.snp.trailing).offset(115)
            make.bottom.equalTo(profileEdge.snp.bottom).offset(-18)
            make.width.equalTo(1.5)
        }
        
        userEmailTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(userIDLabel.snp.bottom).offset(20)
            make.leading.equalTo(view).offset(40)
        }
        
        userEmailLabel.snp.makeConstraints { make in
            make.top.equalTo(userEmailTitleLabel.snp.bottom).offset(5)
            make.leading.equalTo(view).offset(40)
        }
    }
}
