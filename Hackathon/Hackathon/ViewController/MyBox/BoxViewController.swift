//
//  BoxViewController.swift
//  Hackathon
//
//  Created by Jaehyeok Lim on 2022/09/15.
//

import UIKit

class BoxViewController: UIViewController {
    
    var superViewUIList: [UIView] = []
    
    private let boxStatusViewEdge: UIButton = {
        let button = UIButton()
        
        button.layer.backgroundColor = UIColor.white.cgColor
//        button.layer.shadowColor = UIColor.black.cgColor
//        button.layer.shadowOffset = CGSize(width: 1, height: 1)
//        button.layer.shadowOpacity = 0.4
//        button.layer.shadowRadius = 4.0
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray5.cgColor
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    private let boxStatusViewImage: UIButton = {
        let button = UIButton()
        
        button.layer.backgroundColor = UIColor.topViewBackgroundColor?.cgColor
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "마이박스"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        
        return label
    }()
    
//    private let collectionView: UICollectionView = {
//        let view = UICollectionView()
//        
//        
//        
//        return view
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        superViewLayout()
    }
    
    private func superViewLayout() {
        view.backgroundColor = UIColor.topViewBackgroundColor
        
        superViewUIList = [titleLabel, boxStatusViewEdge, boxStatusViewImage]
        
        for uiView in superViewUIList {
            view.addSubview(uiView)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(55)
            make.width.equalTo(view)
        }
        
        boxStatusViewEdge.snp.makeConstraints { make in
            make.top.equalTo(view).offset(130)
            make.leading.equalTo(view).offset(20)
            make.trailing.equalTo(view).offset(-20)
            make.height.equalTo(580)
        }
        
        boxStatusViewImage.snp.makeConstraints { make in
            make.top.equalTo(boxStatusViewEdge).offset(30)
            make.leading.equalTo(boxStatusViewEdge).offset(30)
            make.trailing.equalTo(boxStatusViewEdge.snp.trailing).offset(-30)
            make.height.equalTo(300)
        }
    }
}
