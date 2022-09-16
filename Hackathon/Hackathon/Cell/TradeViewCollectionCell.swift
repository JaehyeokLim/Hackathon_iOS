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
    
    private func setConstraint() {
        contentView.backgroundColor = UIColor.topViewBackgroundColor
        addSubview(UserViewImage)

        UserViewImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
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
