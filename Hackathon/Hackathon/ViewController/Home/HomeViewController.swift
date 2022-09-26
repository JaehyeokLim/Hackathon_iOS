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
    
    private let deliveryViewEdge: UIButton = {
        let button = UIButton()
        
        button.layer.backgroundColor = UIColor.white.cgColor
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    private let tradeViewEdge: UIButton = {
        let button = UIButton()
        
        button.layer.backgroundColor = UIColor.white.cgColor
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    private let goodsOfTodayLabel: UILabel = {
        let label = UILabel()
        
        label.text = ""
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
    
    private let homeViewVerticalLine: UIButton = {
        let button = UIButton()
        
        button.layer.borderWidth = 2.5
        button.layer.borderColor = UIColor.topViewBackgroundColor?.cgColor
        
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
    
    private let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10 // cell사이의 간격 설정
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.backgroundColor = UIColor.white
        view.register(HomeViewMyBoxCollectionCell.self, forCellWithReuseIdentifier: "HomeViewMyBoxCollectionCell")
        view.showsHorizontalScrollIndicator = false
        
        return view
    }()
    
    private let secondCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10 // cell사이의 간격 설정
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.backgroundColor = UIColor.white
        view.register(HomeViewGoodsCollectionCell.self, forCellWithReuseIdentifier: "HomeViewGoodsCollectionCell")
        view.showsHorizontalScrollIndicator = false
        
        return view
    }()
    
    private let myBoxDeliveryLabel: UILabel = {
        let label = UILabel()
        
        label.text = "택배"
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.layer.backgroundColor = UIColor.white.cgColor
        label.layer.cornerRadius = 5
        
        return label
    }()
    
    private let myBoxTradeLabel: UILabel = {
        let label = UILabel()
        
        label.text = "거래"
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.layer.backgroundColor = UIColor.white.cgColor
        label.layer.cornerRadius = 5
        
        return label
    }()
    
    private let myDeliveryBoxEALabel: UILabel = {
        let label = UILabel()
        
        label.text = "택배함 소지 개수"
        label.textColor = UIColor.darkGray
        label.font = UIFont.boldSystemFont(ofSize: 14)
        
        return label
    }()
    
    private let myTradeBoxEALabel: UILabel = {
        let label = UILabel()
        
        label.text = "거래함 소지 개수"
        label.textColor = UIColor.darkGray
        label.font = UIFont.boldSystemFont(ofSize: 14)
        
        return label
    }()
    
    private let myDeliveryBoxNumber: UILabel = {
        let label = UILabel()
        
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 70)
        label.textAlignment = .center
        label.layer.backgroundColor = UIColor.white.cgColor
        
        return label
    }()
    
    private let myTradeBoxNumber: UILabel = {
        let label = UILabel()
        
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 70)
        label.textAlignment = .center
        label.layer.backgroundColor = UIColor.white.cgColor
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(boxCountNumber)
        collectionView.reloadData()

        superViewLayout()
        scrollViewLayout()
        contentViewLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print(boxCountNumber)
        deliveryAndTradeEA()
        collectionView.reloadData()
    }
    
    private func deliveryAndTradeEA() {
        var deliveryNumber: Int = 0
        var tradeNumber: Int = 0
        
        for i in 0..<BoxStatusDataList.count {
            if BoxStatusDataList[i].boxEmpty == 1 && BoxStatusDataList[i].ownerName == UserInfoDataList[0].userID {
                deliveryNumber += 1
            } else if BoxStatusDataList[i].boxEmpty == 2 && BoxStatusDataList[i].ownerName == UserInfoDataList[0].userID {
                tradeNumber += 1
            } else {
                continue
            }
        }
        
        myDeliveryBoxNumber.text = String(deliveryNumber)
        myTradeBoxNumber.text = String(tradeNumber)
        print("deliveryNumber is \(deliveryNumber), tradeNumber is \(tradeNumber)")
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
        contentViewUIList = [storageBoxStatusEdge, storageBoxStatusLabel, storageBoxStatusButton, deliveryViewEdge, goodsOfTodayLabel, goodsOfTodayButton, saleStatusEdge, saleStatusLabel, saleStatusButton, purchaseStatusEdge, purchaseStatusLabel, purchaseStatusButton, mapViewEdge, mapViewLabel, mapViewButton, collectionView, homeViewVerticalLine, myDeliveryBoxEALabel,
                             myBoxDeliveryLabel, myBoxTradeLabel, tradeViewEdge, myTradeBoxEALabel, myDeliveryBoxNumber, myTradeBoxNumber, secondCollectionView]
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        secondCollectionView.delegate = self
        secondCollectionView.dataSource = self

        for uiView in contentViewUIList {
            contentView.addSubview(uiView)
        }
        
        storageBoxStatusEdge.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(20)
            make.leading.equalTo(contentView).offset(20)
            make.trailing.equalTo(contentView).offset(-20)
            make.height.equalTo(230)
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
        
//        goodsOfTodayEdge.snp.makeConstraints { make in
//            make.top.equalTo(storageBoxStatusEdge.snp.bottom).offset(30)
//            make.leading.equalTo(contentView).offset(20)
//            make.trailing.equalTo(contentView).offset(-20)
//            make.height.equalTo(150)
//        }
        
        myBoxDeliveryLabel.snp.makeConstraints { make in
            make.top.equalTo(storageBoxStatusEdge.snp.bottom).offset(20)
            make.leading.equalTo(deliveryViewEdge).offset(55)
            make.width.equalTo(60)
            make.height.equalTo(30)
        }
        
        myBoxTradeLabel.snp.makeConstraints { make in
            make.top.equalTo(storageBoxStatusEdge.snp.bottom).offset(20)
            make.leading.equalTo(tradeViewEdge).offset(55)
            make.width.equalTo(60)
            make.height.equalTo(30)
        }
        
        deliveryViewEdge.snp.makeConstraints { make in
            make.top.equalTo(myBoxDeliveryLabel.snp.bottom).offset(10)
            make.leading.equalTo(contentView).offset(20)
            make.width.equalTo(170)
            make.height.equalTo(150)
        }
        
        tradeViewEdge.snp.makeConstraints { make in
            make.top.equalTo(myBoxTradeLabel.snp.bottom).offset(10)
            make.trailing.equalTo(contentView).offset(-20)
            make.width.equalTo(170)
            make.height.equalTo(150)
        }
        
        goodsOfTodayLabel.snp.makeConstraints { make in
            make.top.equalTo(deliveryViewEdge).offset(15)
            make.leading.equalTo(deliveryViewEdge).offset(15)
        }
        
//        homeViewVerticalLine.snp.makeConstraints { make in
//            make.center.equalTo(goodsOfTodayEdge)
//            make.height.equalTo(100)
//            make.width.equalTo(2.5)
//        }
        
        myDeliveryBoxEALabel.snp.makeConstraints { make in
            make.top.equalTo(deliveryViewEdge).offset(15)
            make.leading.equalTo(deliveryViewEdge).offset(40)
        }
        
        myDeliveryBoxNumber.snp.makeConstraints { make in
            make.top.equalTo(myDeliveryBoxEALabel).offset(28)
            make.leading.equalTo(20)
            make.width.equalTo(deliveryViewEdge)
        }
        
        myTradeBoxNumber.snp.makeConstraints { make in
            make.top.equalTo(myTradeBoxEALabel).offset(28)
            make.trailing.equalTo(-20)
            make.width.equalTo(tradeViewEdge)
        }
        
        myTradeBoxEALabel.snp.makeConstraints { make in
            make.top.equalTo(tradeViewEdge).offset(15)
            make.leading.equalTo(tradeViewEdge).offset(40)
        }
        
//        goodsOfTodayButton.snp.makeConstraints { make in
//            make.top.equalTo(goodsOfTodayEdge).offset(6)
//            make.trailing.equalTo(goodsOfTodayEdge).offset(0)
//            make.size.equalTo(CGSize(width: 45, height: 45))
//        }
        
        saleStatusEdge.snp.makeConstraints { make in
            make.top.equalTo(deliveryViewEdge.snp.bottom).offset(30)
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
            make.top.equalTo(deliveryViewEdge.snp.bottom).offset(30)
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
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(storageBoxStatusEdge).offset(60)
            make.leading.equalTo(storageBoxStatusEdge).offset(20)
            make.trailing.equalTo(storageBoxStatusEdge).offset(-20)
            make.bottom.equalTo(storageBoxStatusEdge).offset(-20)
        }
        
        secondCollectionView.snp.makeConstraints { make in
            make.top.equalTo(mapViewEdge).offset(60)
            make.leading.equalTo(mapViewEdge).offset(20)
            make.trailing.equalTo(mapViewEdge).offset(-20)
            make.bottom.equalTo(mapViewEdge).offset(-20)
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
    
//    func gradientLayer(bounds : CGRect) -> CAGradientLayer{
//        let gradient = CAGradientLayer()
//        gradient.frame = bounds
//        gradient.colors = [UIColor.orange.cgColor, UIColor.red.cgColor]
//        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
//        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
//        return gradient
//    }

//    func gradientColor(gradientLayer :CAGradientLayer) -> UIColor? {
//        UIGraphicsBeginImageContextWithOptions(gradientLayer.bounds.size, false, 0.0)
//        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return UIColor(patternImage: image!)
//    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.collectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeViewMyBoxCollectionCell", for: indexPath) as? HomeViewMyBoxCollectionCell else { return UICollectionViewCell() }
            
            if UserDefaults.standard.bool(forKey: "LoginStatus") == true {
                if BoxStatusDataList[indexPath.row].boxEmpty == 0 {
                    cell.boxEmptyzButton.tintColor = UIColor.systemGreen
                } else if BoxStatusDataList[indexPath.row].boxEmpty == 1 {
                    cell.boxEmptyzButton.tintColor = UIColor.systemRed
                    cell.boxInsideStateButton.setImage(UIImage(systemName: "shippingbox.circle"), for: .normal)
                    cell.boxInsideStateButton.tintColor = UIColor.systemBlue
                } else if BoxStatusDataList[indexPath.row].boxEmpty == 2 {
                    cell.boxEmptyzButton.tintColor = UIColor.systemRed
                    cell.boxInsideStateButton.setImage(UIImage(systemName: "repeat.circle"), for: .normal)
                    cell.boxInsideStateButton.tintColor = UIColor.systemBlue
                }
                
                if BoxStatusDataList[indexPath.row].ownerName == UserInfoDataList[0].userID {
                    cell.boxOwnerButton.tintColor = UIColor.systemGreen
                } else { cell.boxOwnerButton.tintColor = UIColor.systemRed }
            }
            return cell
        } else if collectionView == secondCollectionView {
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeViewGoodsCollectionCell", for: indexPath) as? HomeViewGoodsCollectionCell else { return UICollectionViewCell() }
            
            cell.UserViewImage.setImage(SalesPostDatalist[indexPath.row].GoodsImage, for: .normal)
            cell.contentView.backgroundColor = .white

            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.collectionView {
            return CGSize(width: 70, height: collectionView.frame.height)

        } else if collectionView == secondCollectionView {
            return CGSize(width: 100, height: collectionView.frame.height)

        }
        
        return CGSize(width: 300, height: 300)
    }
}

