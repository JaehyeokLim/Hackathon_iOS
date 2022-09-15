//
//  BoxViewController.swift
//  Hackathon
//
//  Created by Jaehyeok Lim on 2022/09/15.
//

import UIKit

class BoxViewController: UIViewController {
    
    var superViewUIList: [UIView] = []
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "마이박스"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        superViewLayout()
    }
    
    private func superViewLayout() {
        view.backgroundColor = UIColor.white
        
        superViewUIList = [titleLabel]
        
        for uiView in superViewUIList {
            view.addSubview(uiView)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(55)
            make.width.equalTo(view)
        }
    }
}
