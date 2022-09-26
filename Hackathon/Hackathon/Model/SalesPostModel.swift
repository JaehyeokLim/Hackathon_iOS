//
//  SalesPostModel.swift
//  Hackathon
//
//  Created by Jaehyeok Lim on 2022/09/15.
//

import UIKit

var SalesPostDatalist = [SalesPostData]()

struct SalesPostData {
    
    let GoodsImage: UIImage?
    let PostTitleText: String?
    let PostMainText: String?
    let PostDate: Date?
    let BoxNumber: String?
    let price: String?
}
