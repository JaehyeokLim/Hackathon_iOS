//
//  TradeViewConroller.swift
//  Hackathon
//
//  Created by Jaehyeok Lim on 2022/09/15.
//

import UIKit
import SnapKit

class TradeViewController: UIViewController {
    
    var superViewUIList: [UIView] = []
    var scrollViewUIList: [UIView] = []

    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "마켓 플레이스"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        
        return label
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = UIColor.black
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        
        return button
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = UIColor.black
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        
        return button
    }()
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        
        view.backgroundColor = UIColor.topViewBackgroundColor
        view.showsVerticalScrollIndicator = false

        return view
    }()

    private let contentView: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.topViewBackgroundColor
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        superViewLayout()
        scrollViewLayout()
    }
    
    private func superViewLayout() {
        view.backgroundColor = UIColor.topViewBackgroundColor
        
        superViewUIList = [titleLabel, searchButton, addButton, scrollView]
        
        for uiView in superViewUIList {
            view.addSubview(uiView)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(55)
            make.width.equalTo(view)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view).offset(100)
            make.leading.bottom.trailing.equalTo(0)
        }
        
        addButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel)
            make.trailing.equalTo(view).offset(-17)
            make.size.equalTo(CGSize(width: 30, height: 27.5))
        }
        
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel)
            make.trailing.equalTo(addButton.snp.leading).offset(-10)
            make.size.equalTo(CGSize(width: 30, height: 27))
        }
        
        addButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
    }
    
    @objc func addButtonAction(_: UIButton) {
        let viewController = PostWriteViewController()
        
        viewController.modalPresentationStyle = .fullScreen
        
        present(viewController, animated: true)
    }
    
    private func scrollViewLayout() {
        scrollViewUIList = [contentView]
        
        for uiView in scrollViewUIList {
            scrollView.addSubview(uiView)
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(scrollView)
            make.leading.trailing.bottom.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.equalTo(700)
        }
    }
}
