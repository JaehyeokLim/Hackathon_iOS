//
//  TradeViewCollectionCell.swift
//  Hackathon
//
//  Created by Jaehyeok Lim on 2022/09/15.
//

import UIKit
import SnapKit

class TradeViewCollectionCell: UICollectionViewCell {
    static let identifier = "TradeViewCollectionCell"
    
    let UserViewImage: UIButton = {
        let UserViewImage = UIButton()
        
        UserViewImage.layer.cornerRadius = 15
        UserViewImage.layer.masksToBounds = true

        return UserViewImage
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        
        label.text = ""
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    let mainTextLabel: UILabel = {
        let label = UILabel()
        
        label.text = ""
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 10)
        
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "star"), for: .normal)
        button.tintColor = .systemGray
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        
        return button
    }()
    
    private func setConstraint() {
        contentView.backgroundColor = UIColor.white
        addSubview(UserViewImage)
        addSubview(priceLabel)
        addSubview(mainTextLabel)
        addSubview(button)
        
        UserViewImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-50)
        }
        
        button.snp.makeConstraints { make in
            make.bottom.equalTo(UserViewImage).offset(-2)
            make.trailing.equalTo(UserViewImage).offset(-2)
            make.size.equalTo(CGSize(width: 25, height: 23))
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(UserViewImage.snp.bottom).offset(5)
            make.leading.equalTo(UserViewImage).offset(5)
        }
        
        mainTextLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(3)
            make.leading.equalTo(priceLabel).offset(0)
        }
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        UserViewImage.addTarget(TradeViewController().self, action: #selector(TradeViewController().buttonAction2), for: .touchUpInside)

    }
    
    @objc func buttonAction(_: UIButton) {
        button.setImage(UIImage(systemName: "star.fill"), for: .normal)
        button.tintColor = .systemYellow
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraint()
    }
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
