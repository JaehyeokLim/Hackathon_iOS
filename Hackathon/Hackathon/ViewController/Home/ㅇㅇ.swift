//
//  ViewController.swift
//  Hackathon
//
//  Created by Jaehyeok Lim on 2022/09/15.
//

import UIKit
import SnapKit

class HomeViewController1: UIViewController {
    override func viewDidLoad() {
        
        view.backgroundColor = .white
        
        let ddd = UIImageView()
        
//        ddd.image = UIImage(named: "Image 1")
        view.addSubview(ddd)
        
        
        super.viewDidLoad()
        
        ddd.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.size.equalTo(CGSize(width: 200, height: 200))
        }
//        
//        let url = URL(string: "http://34.64.186.176/qrimage?boxNum=1")
//        ddd.load(url: url!)
    }
}
