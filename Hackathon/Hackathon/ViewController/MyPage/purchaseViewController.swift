//
//  purchaseViewController.swift
//  Hackathon
//
//  Created by Jaehyeok Lim on 2022/09/18.
//

import UIKit
import SnapKit

class purchaseViewController: UIViewController {
    override func viewDidLoad() {
        
        view.backgroundColor = .white
        
        let imageView = UIImageView()
        
        imageView.image = SalesPostDatalist[0].GoodsImage
        
        view.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view).offset(15)
            make.leading.equalTo(90)
            make.size.equalTo(CGSize(width: 200, height: 200))
        }
        
        super.viewDidLoad()
    }
    
    
}
