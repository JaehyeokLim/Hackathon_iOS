//
//  BoxViewController.swift
//  Hackathon
//
//  Created by Jaehyeok Lim on 2022/09/15.
//

import UIKit

public var boxCountNumber: [Int] = []

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
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.textAlignment = .center
        
        return label
    }()
    
    private let qrImageSaveLocalButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("이미지 저장", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.backgroundColor = UIColor.titleLogoColor?.cgColor
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        return button
    }()
    
    private let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0 // cell사이의 간격 설정
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.backgroundColor = UIColor.white
        view.register(BoxViewCollectionCell.self, forCellWithReuseIdentifier: "BoxViewCollectionCell")
        view.showsHorizontalScrollIndicator = false
        view.isPagingEnabled = true
        view.layer.cornerRadius = 10
//        view.layer.masksToBounds = true
//        view.layer.shadowColor = UIColor.lightGray.cgColor
//        view.layer.shadowOpacity = 1.0
//        view.layer.shadowOffset = CGSize.zero
//        view.layer.shadowRadius = 6
//        view.layer.masksToBounds = false
        view.layer.cornerRadius = 10
        view.layer.backgroundColor = UIColor.white.cgColor
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 1.0
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 6
//        view.layer.shadowOpacity = 0.8
//        view.layer.shadowOffset = CGSize(width: -2, height: 2)
//        view.layer.shadowRadius = 3
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(boxCountNumber)
        print(BoxStatusDataList)
        collectionView.reloadData()
        superViewLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if UserDefaults.standard.bool(forKey: "LoginStatus") == true {
            JsonPostManager().seqPostBoxStatusGet(sequenceName: String(UserInfoDataList[0].seq!))
            collectionView.reloadData()
        }
        
        if boxCountNumber.count < 0 {
            collectionView.isHidden = true
            qrImageSaveLocalButton.isHidden = true
        }
    }
    
    private func superViewLayout() {
        view.backgroundColor = UIColor.topViewBackgroundColor
        
        superViewUIList = [titleLabel, boxStatusViewEdge, boxStatusViewImage, collectionView, qrImageSaveLocalButton]
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        for uiView in superViewUIList {
            view.addSubview(uiView)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(90)
            make.width.equalTo(view)
        }
//
//        boxStatusViewEdge.snp.makeConstraints { make in
//            make.top.equalTo(view).offset(130)
//            make.leading.equalTo(view).offset(20)
//            make.trailing.equalTo(view).offset(-20)
//            make.height.equalTo(580)
//        }
//
//        boxStatusViewImage.snp.makeConstraints { make in
//            make.top.equalTo(boxStatusViewEdge).offset(30)
//            make.leading.equalTo(boxStatusViewEdge).offset(30)
//            make.trailing.equalTo(boxStatusViewEdge.snp.trailing).offset(-30)
//            make.height.equalTo(300)
//        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view).offset(180)
            make.leading.equalTo(view).offset(40)
            make.trailing.equalTo(view).offset(-40)
            make.bottom.equalTo(view).offset(-220)
        }
        
        qrImageSaveLocalButton.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(15)
            make.trailing.equalTo(collectionView)
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
    }
}

extension BoxViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                
        boxCountNumber.removeAll()
        
        for i in 0..<BoxStatusDataList.count {
    
            if BoxStatusDataList[i].ownerName == UserInfoDataList[0].userID {
                if boxCountNumber.contains(i) == true {
                    continue
                } else {
                    boxCountNumber.append(i)
                }
                
            }
        }
            
        return boxCountNumber.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BoxViewCollectionCell", for: indexPath) as? BoxViewCollectionCell else { return UICollectionViewCell() }

//        cell.boxNumberLabel.text = "보관함 NO." + BoxStatusDataList[boxCountNumber[indexPath]].ownerName

        cell.boxNumberLabel.text = "보관함 번호\(BoxStatusDataList[boxCountNumber[indexPath.row]].boxNum!)"
        cell.dateLabel.text = BoxStatusDataList[boxCountNumber[indexPath.row]].updatedDate ?? "nil"
        let url = URL(string: "http://34.64.186.176/qrimage?boxNum=\(boxCountNumber[indexPath.row]+1)")
        let ddd = UIImageView()
        ddd.load(url: url!)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 310, height: collectionView.frame.height)
    }
    
    @objc func boxEmptyzButtonAction(_: UIButton) {
        collectionView.isHidden = true
        qrImageSaveLocalButton.isHidden = true

    }
    func gradientLayer(bounds : CGRect) -> CAGradientLayer{
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [UIColor.orange.cgColor, UIColor.red.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        return gradient
    }

    func gradientColor(gradientLayer :CAGradientLayer) -> UIColor? {
        UIGraphicsBeginImageContextWithOptions(gradientLayer.bounds.size, false, 0.0)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return UIColor(patternImage: image!)
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
