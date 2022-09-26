//
//  HomeViewMyBoxCollectionCell.swift
//  Hackathon
//
//  Created by Jaehyeok Lim on 2022/09/17.
//

import UIKit
import SnapKit

class HomeViewMyBoxCollectionCell: UICollectionViewCell {
    static let identifier = "HomeViewMyBoxCollectionCell"
    
    let UserViewImage: UIButton = {
        let UserViewImage = UIButton()
        
        UserViewImage.backgroundColor = UIColor.topViewBackgroundColor
        UserViewImage.layer.cornerRadius = 15
        UserViewImage.layer.masksToBounds = true

        return UserViewImage
    }()
    
    let boxEmptyzButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "lock.circle"), for: .normal)
        button.tintColor = UIColor.systemGreen
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        
        return button
    }()
    
    let boxOwnerButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "person.circle"), for: .normal)
        button.tintColor = UIColor.systemBlue
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        
        return button
    }()
    
    let boxInsideStateButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "shippingbox.circle"), for: .normal)
        //repeat.circle
        button.tintColor = UIColor.systemGray
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        
        return button
    }()
    
    private func setConstraint() {
        contentView.backgroundColor = UIColor.white
        addSubview(UserViewImage)
        addSubview(boxEmptyzButton)
        addSubview(boxOwnerButton)
        addSubview(boxInsideStateButton)
        
        UserViewImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        boxEmptyzButton.snp.makeConstraints { make in
            make.top.equalTo(UserViewImage).offset(15)
            make.leading.equalTo(UserViewImage).offset(20)
            make.size.equalTo(CGSize(width: 30, height: 30))
        }
        
        boxOwnerButton.snp.makeConstraints { make in
            make.top.equalTo(boxEmptyzButton.snp.bottom).offset(15)
            make.leading.equalTo(UserViewImage).offset(20)
            make.size.equalTo(CGSize(width: 30, height: 30))
        }
        
        boxInsideStateButton.snp.makeConstraints { make in
            make.top.equalTo(boxOwnerButton.snp.bottom).offset(15)
            make.leading.equalTo(UserViewImage).offset(20)
            make.size.equalTo(CGSize(width: 30, height: 30))
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraint()
    }
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
