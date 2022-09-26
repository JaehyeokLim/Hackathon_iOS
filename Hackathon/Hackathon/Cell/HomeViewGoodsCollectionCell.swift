//
//  HomeViewGoodsCollectionCell.swift
//  Hackathon
//
//  Created by Jaehyeok Lim on 2022/09/26.
//

import UIKit
import SnapKit

class HomeViewGoodsCollectionCell: UICollectionViewCell {
    static let identifier = "HomeViewGoodsCollectionCell"
    
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
        
        UserViewImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
 
        UserViewImage.addTarget(TradeViewController().self, action: #selector(TradeViewController().buttonAction2), for: .touchUpInside)

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraint()
    }
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

