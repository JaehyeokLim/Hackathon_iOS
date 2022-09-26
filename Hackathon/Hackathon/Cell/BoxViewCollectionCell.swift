//
//  BoxViewCollectionCell.swift
//  Hackathon
//
//  Created by Jaehyeok Lim on 2022/09/17.
//

import UIKit
import SnapKit

class BoxViewCollectionCell: UICollectionViewCell {
    static let identifier = "BoxViewCollectionCell"
    
    let UserViewImage: UIButton = {
        let UserViewImage = UIButton()
        
        UserViewImage.backgroundColor = UIColor.white
        UserViewImage.layer.cornerRadius = 15
        UserViewImage.layer.masksToBounds = true

        return UserViewImage
    }()
    
    lazy var boxEmptyzButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "qr"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10

        return button
    }()
    
    lazy var boxNumberLabel: UILabel = {
        let label = UILabel()
        
        label.text = "보관함 No.2"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    private let bottomLine: UILabel = {
        let label = UILabel()
        
        label.layer.borderColor = UIColor.systemGray4.cgColor
        label.layer.borderWidth = 1
        
        return label
    }()
    
    let dateTitleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "보관 날짜"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        
        label.text = "2022-09-16T22:46:44.000Z"
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    private func setConstraint() {
        contentView.backgroundColor = UIColor.white
        addSubview(UserViewImage)
        addSubview(boxEmptyzButton)
        addSubview(dateLabel)
        addSubview(boxNumberLabel)
        addSubview(bottomLine)
        addSubview(dateTitleLabel)

        UserViewImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        boxEmptyzButton.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(30)
            make.leading.equalTo(contentView).offset(30)
            make.trailing.equalTo(contentView.snp.trailing).offset(-30)
            make.height.equalTo(260)
        }
        
        boxNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(boxEmptyzButton.snp.bottom)
            make.leading.equalTo(boxEmptyzButton).offset(25)
        }
        
        bottomLine.snp.makeConstraints { make in
            make.top.equalTo(boxNumberLabel.snp.bottom).offset(15)
            make.leading.equalTo(boxNumberLabel)
            make.trailing.equalTo(boxEmptyzButton).offset(-25)
            make.height.equalTo(1.5)
        }
        
        dateTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(bottomLine.snp.bottom).offset(15)
            make.leading.equalTo(bottomLine)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(dateTitleLabel.snp.bottom).offset(5)
            make.leading.equalTo(dateTitleLabel)
            make.trailing.equalTo(dateTitleLabel)
        }
        
        boxEmptyzButton.addTarget(BoxViewController(), action: #selector(BoxViewController.boxEmptyzButtonAction), for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraint()
    }
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
