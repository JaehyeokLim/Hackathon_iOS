//
//  UserProfileViewTableCell.swift
//  Hackathon
//
//  Created by Jaehyeok Lim on 2022/09/15.
//

import UIKit
import SnapKit

class UserProfileViewTableCell: UITableViewCell {
    let identifier = "UserProfileViewTableCell"
    
    let sideMenuItem: UIButton = {
        let button = UIButton()

        button.setTitle("test", for: .normal)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//        button.titleLabel?.textAlignment = .left
        
        return button
    }()
    
    private let cellChevronButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = UIColor.black
        
        return button
    }()
    
    func setConstraint() {
        contentView.backgroundColor = UIColor.white
        contentView.addSubview(sideMenuItem)
        contentView.addSubview(cellChevronButton)
        
        sideMenuItem.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView)
            make.leading.equalTo(contentView).offset(15)
        }
        
        cellChevronButton.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(6)
            make.trailing.equalTo(contentView).offset(0)
            make.size.equalTo(CGSize(width: 45, height: 45))
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
