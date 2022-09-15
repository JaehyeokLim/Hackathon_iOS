//
//  PostWriteViewController.swift
//  Hackathon
//
//  Created by Jaehyeok Lim on 2022/09/15.
//

import UIKit
import SnapKit

class PostWriteViewController: UIViewController {
    
    var superViewUIList: [UIView] = []
    var scrollViewUIList: [UIView] = []

    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "판매글 작성"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        
        return label
    }()
    
    private let cancelButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = UIColor.black
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        
        return button
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "checkmark"), for: .normal)
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
        
        superViewUIList = [titleLabel, cancelButton, saveButton, scrollView]
        
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
        
        cancelButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel)
            make.leading.equalTo(view).offset(17)
            make.size.equalTo(CGSize(width: 30, height: 27.5))
        }
        
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel)
            make.trailing.equalTo(-17)
            make.size.equalTo(CGSize(width: 30, height: 27))
        }
        
        cancelButton.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
    }
    
    @objc func cancelButtonAction(_: UIButton) {
        let popup = UIAlertController(title: "정말 작성을 취소하시겠습니까?", message: "작성 중이던 글은 저장이 되지 않습니다", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.default) { action in
            return
        }
        
        let rightAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default) { action in
            self.dismiss(animated: true)
        }
        
        popup.addAction(cancelAction)
        popup.addAction(rightAction)
        
        self.present(popup, animated: true, completion: nil)
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
