//
//  ViewController.swift
//  Hackathon
//
//  Created by Jaehyeok Lim on 2022/09/15.
//

import UIKit
import SnapKit

public extension UIColor {
    static let titleLogoColor = UIColor(named: "TitleLogoColor")
    static let topViewBackgroundColor = UIColor(named: "TopViewBackgroundColor")
}

class HomeViewController: UIViewController {
    
    var superViewUIList: [UIView] = []
    var scrollViewUIList: [UIView] = []
    var contentViewUIList: [UIView] = []
    
    private let titleLogo: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "cube.transparent.fill")
        imageView.tintColor = UIColor.titleLogoColor

        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "DoBox"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        
        return label
    }()
    
    private let alramButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "bell"), for: .normal)
        button.tintColor = UIColor.darkGray
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
    
    private let storageBoxStatusEdge: UIButton = {
        let button = UIButton()
        
        button.layer.backgroundColor = UIColor.white.cgColor
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    private let storageBoxStatusLabel: UILabel = {
        let label = UILabel()
        
        label.text = "마이박스 바로보기"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 22)
        
        return label
    }()
    
    private let storageBoxStatusButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = UIColor.black
        
        return button
    }()
    
    private let goodsOfTodayEdge: UIButton = {
        let button = UIButton()
        
        button.layer.backgroundColor = UIColor.white.cgColor
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    private let goodsOfTodayLabel: UILabel = {
        let label = UILabel()
        
        label.text = "회원님을 위한 오늘의 상품"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 22)
        
        return label
    }()
    
    private let goodsOfTodayButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = UIColor.black
        
        return button
    }()

    private let saleStatusEdge: UIButton = {
        let button = UIButton()
        
        button.layer.backgroundColor = UIColor.white.cgColor
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    private let saleStatusLabel: UILabel = {
        let label = UILabel()
        
        label.text = "판매 목록"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 22)
        
        return label
    }()
    
    private let saleStatusButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = UIColor.black
        
        return button
    }()
    
    private let purchaseStatusEdge: UIButton = {
        let button = UIButton()
        
        button.layer.backgroundColor = UIColor.white.cgColor
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    private let purchaseStatusLabel: UILabel = {
        let label = UILabel()
        
        label.text = "구입 목록"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 22)
        
        return label
    }()
    
    private let purchaseStatusButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = UIColor.black
        
        return button
    }()

    private let mapViewEdge: UIButton = {
        let button = UIButton()
        
        button.layer.backgroundColor = UIColor.white.cgColor
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    private let mapViewLabel: UILabel = {
        let label = UILabel()
        
        label.text = "한눈에 보기"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 22)
        
        return label
    }()
    
    private let mapViewButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = UIColor.black
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        superViewLayout()
        scrollViewLayout()
        contentViewLayout()
    }
    
    private func superViewLayout() {
        view.backgroundColor = UIColor.topViewBackgroundColor
        
        superViewUIList = [titleLogo, titleLabel, alramButton, scrollView]
        
        for uiView in superViewUIList {
            view.addSubview(uiView)
        }
        
        titleLogo.snp.makeConstraints { make in
            make.top.equalTo(view).offset(50)
            make.leading.equalTo(view).offset(15)
            make.size.equalTo(CGSize(width: 40, height: 40))
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLogo).offset(5)
            make.leading.equalTo(titleLogo.snp.trailing).offset(10)
        }
        
        alramButton.snp.makeConstraints { make in
            make.top.equalTo(titleLogo).offset(7)
            make.trailing.equalTo(view).offset(-17)
            make.size.equalTo(CGSize(width: 33, height: 33))
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view).offset(100)
            make.leading.bottom.trailing.equalTo(0)
        }
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
            make.height.equalTo(745)
        }
    }
    
    private func contentViewLayout() {
        contentViewUIList = [storageBoxStatusEdge, storageBoxStatusLabel, storageBoxStatusButton, goodsOfTodayEdge, goodsOfTodayLabel, goodsOfTodayButton, saleStatusEdge, saleStatusLabel, saleStatusButton, purchaseStatusEdge, purchaseStatusLabel, purchaseStatusButton, mapViewEdge, mapViewLabel, mapViewButton]
        
        for uiView in contentViewUIList {
            contentView.addSubview(uiView)
        }
        
        storageBoxStatusEdge.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(20)
            make.leading.equalTo(contentView).offset(20)
            make.trailing.equalTo(contentView).offset(-20)
            make.height.equalTo(200)
        }
        
        storageBoxStatusLabel.snp.makeConstraints { make in
            make.top.equalTo(storageBoxStatusEdge).offset(15)
            make.leading.equalTo(storageBoxStatusEdge).offset(15)
        }
        
        storageBoxStatusButton.snp.makeConstraints { make in
            make.top.equalTo(storageBoxStatusEdge).offset(6)
            make.trailing.equalTo(storageBoxStatusEdge).offset(0)
            make.size.equalTo(CGSize(width: 45, height: 45))
        }
        
        goodsOfTodayEdge.snp.makeConstraints { make in
            make.top.equalTo(storageBoxStatusEdge.snp.bottom).offset(30)
            make.leading.equalTo(contentView).offset(20)
            make.trailing.equalTo(contentView).offset(-20)
            make.height.equalTo(150)
        }
        
        goodsOfTodayLabel.snp.makeConstraints { make in
            make.top.equalTo(goodsOfTodayEdge).offset(15)
            make.leading.equalTo(goodsOfTodayEdge).offset(15)
        }
        
        goodsOfTodayButton.snp.makeConstraints { make in
            make.top.equalTo(goodsOfTodayEdge).offset(6)
            make.trailing.equalTo(goodsOfTodayEdge).offset(0)
            make.size.equalTo(CGSize(width: 45, height: 45))
        }
        
        saleStatusEdge.snp.makeConstraints { make in
            make.top.equalTo(goodsOfTodayEdge.snp.bottom).offset(30)
            make.leading.equalTo(contentView).offset(20)
            make.trailing.equalTo(contentView).offset(-203)
            make.height.equalTo(55)
        }
        
        saleStatusLabel.snp.makeConstraints { make in
            make.top.equalTo(saleStatusEdge).offset(15)
            make.leading.equalTo(saleStatusEdge).offset(15)
        }
        
        saleStatusButton.snp.makeConstraints { make in
            make.top.equalTo(saleStatusEdge).offset(6)
            make.trailing.equalTo(saleStatusEdge).offset(0)
            make.size.equalTo(CGSize(width: 45, height: 45))
        }
        
        purchaseStatusEdge.snp.makeConstraints { make in
            make.top.equalTo(goodsOfTodayEdge.snp.bottom).offset(30)
            make.leading.equalTo(saleStatusEdge.snp.trailing).offset(20)
            make.trailing.equalTo(contentView).offset(-20)
            make.height.equalTo(55)
        }
        
        purchaseStatusLabel.snp.makeConstraints { make in
            make.top.equalTo(purchaseStatusEdge).offset(15)
            make.leading.equalTo(purchaseStatusEdge).offset(15)
        }
        
        purchaseStatusButton.snp.makeConstraints { make in
            make.top.equalTo(purchaseStatusEdge).offset(6)
            make.trailing.equalTo(purchaseStatusEdge).offset(0)
            make.size.equalTo(CGSize(width: 45, height: 45))
        }
        
        mapViewEdge.snp.makeConstraints { make in
            make.top.equalTo(saleStatusEdge.snp.bottom).offset(30)
            make.leading.equalTo(contentView).offset(20)
            make.trailing.equalTo(contentView).offset(-20)
            make.height.equalTo(180)
        }
        
        mapViewLabel.snp.makeConstraints { make in
            make.top.equalTo(mapViewEdge).offset(15)
            make.leading.equalTo(mapViewEdge).offset(15)
        }
        
        mapViewButton.snp.makeConstraints { make in
            make.top.equalTo(mapViewEdge).offset(6)
            make.trailing.equalTo(mapViewEdge).offset(0)
            make.size.equalTo(CGSize(width: 45, height: 45))
        }
        
        storageBoxStatusButton.addTarget(self, action: #selector(storageBoxStatusButtonAction), for: .touchUpInside)
        goodsOfTodayButton.addTarget(self, action: #selector(goodsOfTodayButtonAction), for: .touchUpInside)
    }
    
    @objc func storageBoxStatusButtonAction(_: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    @objc func goodsOfTodayButtonAction(_: UIButton) {
        tabBarController?.selectedIndex = 2
    }
}

