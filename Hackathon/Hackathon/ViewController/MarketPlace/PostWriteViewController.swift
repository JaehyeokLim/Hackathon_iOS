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
    var contentViewUIList: [UIView] = []
    let imagePicker = UIImagePickerController()
    
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
        button.tintColor = UIColor.titleLogoColor
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        
        return button
    }()
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        
        view.backgroundColor = UIColor.white
        view.showsVerticalScrollIndicator = false
        
        return view
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    private let goodsImage: UIImageView = {
        let image = UIImageView()
        
        image.layer.backgroundColor = UIColor.topViewBackgroundColor?.cgColor
        image.layer.cornerRadius = 15
        
        return image
    }()
    
    private let postTitleTextView: UITextField = {
        let view = UITextField()
        
        view.placeholder = "상품명"
        
        view.backgroundColor = UIColor.white
        view.textColor = UIColor.darkGray
        view.font = UIFont.boldSystemFont(ofSize: 18)
        view.textAlignment = .left
        
        return view
    }()
    
    private let postTitleTextViewBottomLine: UILabel = {
        let label = UILabel()
        
        label.layer.borderColor = UIColor.systemGray4.cgColor
        label.layer.borderWidth = 1
        
        return label
    }()
    
    private let postCategoryTextView: UITextField = {
        let view = UITextField()
        
        view.placeholder = "카테고리"
        
        view.backgroundColor = UIColor.white
        view.textColor = UIColor.darkGray
        view.font = UIFont.boldSystemFont(ofSize: 18)
        view.textAlignment = .left
        
        return view
    }()
    
    private let postCategoryTextViewBottomLine: UILabel = {
        let label = UILabel()
        
        label.layer.borderColor = UIColor.systemGray4.cgColor
        label.layer.borderWidth = 1
        
        return label
    }()
    
    private let postBoxNumberView: UITextField = {
        let view = UITextField()
        
        view.placeholder = "보관함 번호"
        
        view.backgroundColor = UIColor.white
        view.textColor = UIColor.darkGray
        view.font = UIFont.boldSystemFont(ofSize: 18)
        view.textAlignment = .left
        
        return view
    }()
    
    private let postBoxNumberViewBottomLine: UILabel = {
        let label = UILabel()
        
        label.layer.borderColor = UIColor.systemGray4.cgColor
        label.layer.borderWidth = 1
        
        return label
    }()
    
    private let postCoastTextView: UITextField = {
        let view = UITextField()
        
        view.placeholder = "₩"
        
        view.backgroundColor = UIColor.white
        view.textColor = UIColor.darkGray
        view.font = UIFont.boldSystemFont(ofSize: 18)
        view.textAlignment = .left
        
        return view
    }()
    
    private let postCoastTextViewBottomLine: UILabel = {
        let label = UILabel()
        
        label.layer.borderColor = UIColor.systemGray4.cgColor
        label.layer.borderWidth = 1
        
        return label
    }()
    
    private let postMainTextView: UITextView = {
        let view = UITextView()
        
        view.text = "상품에 대한 글을 작성해주세요"
        view.textColor = UIColor.lightGray
        view.backgroundColor = UIColor.white
        view.layer.backgroundColor = UIColor.white.cgColor
        view.layer.cornerRadius = 15
        view.font = UIFont.systemFont(ofSize: 15)
        view.textColor = UIColor.lightGray
        
        return view
    }()
    
    private let goodsPictureLoadButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "photo.on.rectangle.angled"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        superViewLayout()
        scrollViewLayout()
        contentViewLayout()
    }
    
    private func superViewLayout() {
        view.backgroundColor = UIColor.white
        
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
        saveButton.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
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
    
    @objc func saveButtonAction(_: UIButton) {
        
        let popup = UIAlertController(title: "판매글을 게시하시겠습니가?", message: "", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.default) { action in
            return
        }
        
        let rightAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default) { action in
            
            let data = SalesPostData(GoodsImage: self.goodsImage.image, PostTitleText: self.postTitleTextView.text, PostMainText: self.postMainTextView.text, PostDate: Date(), BoxNumber: self.postBoxNumberView.text, PostCategory: self.postCategoryTextView.text)
            
            SalesPostDatalist.insert(data, at: 0)
            
            print(SalesPostDatalist)
            
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
    
    private func contentViewLayout() {
        contentViewUIList = [goodsImage, postTitleTextView, postTitleTextViewBottomLine, postCategoryTextView, postCategoryTextViewBottomLine, postBoxNumberView, postBoxNumberViewBottomLine, postCoastTextView, postCoastTextViewBottomLine, postMainTextView, goodsPictureLoadButton]
        
        for uiView in contentViewUIList {
            contentView.addSubview(uiView)
        }
        
        postMainTextView.delegate = self
        imagePicker.delegate = self
        
        goodsImage.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(20)
            make.leading.equalTo(contentView).offset(80)
            make.trailing.equalTo(contentView).offset(-80)
            make.height.equalTo(230)
        }
        
        postTitleTextView.snp.makeConstraints { make in
            make.top.equalTo(goodsImage.snp.bottom).offset(30)
            make.leading.equalTo(contentView).offset(20)
            make.size.equalTo(CGSize(width: 350, height: 45))
        }
        
        postTitleTextViewBottomLine.snp.makeConstraints { make in
            make.top.equalTo(postTitleTextView.snp.bottom).offset(5)
            make.leading.equalTo(20)
            make.height.equalTo(1)
            make.width.equalTo(345)
        }
        
        postCategoryTextView.snp.makeConstraints { make in
            make.top.equalTo(postTitleTextView.snp.bottom).offset(15)
            make.leading.equalTo(contentView).offset(20)
            make.size.equalTo(CGSize(width: 350, height: 45))
        }
        
        postCategoryTextViewBottomLine.snp.makeConstraints { make in
            make.top.equalTo(postCategoryTextView.snp.bottom).offset(5)
            make.leading.equalTo(20)
            make.height.equalTo(1)
            make.width.equalTo(345)
        }
        
        postBoxNumberView.snp.makeConstraints { make in
            make.top.equalTo(postCategoryTextView.snp.bottom).offset(15)
            make.leading.equalTo(contentView).offset(20)
            make.size.equalTo(CGSize(width: 350, height: 45))
        }
        
        postBoxNumberViewBottomLine.snp.makeConstraints { make in
            make.top.equalTo(postBoxNumberView.snp.bottom).offset(5)
            make.leading.equalTo(20)
            make.height.equalTo(1)
            make.width.equalTo(345)
        }
        
        postCoastTextView.snp.makeConstraints { make in
            make.top.equalTo(postBoxNumberViewBottomLine.snp.bottom).offset(15)
            make.leading.equalTo(contentView).offset(20)
            make.size.equalTo(CGSize(width: 350, height: 45))
        }
        
        postCoastTextViewBottomLine.snp.makeConstraints { make in
            make.top.equalTo(postCoastTextView.snp.bottom).offset(5)
            make.leading.equalTo(20)
            make.height.equalTo(1)
            make.width.equalTo(345)
        }
        
        postMainTextView.snp.makeConstraints { make in
            make.top.equalTo(postCoastTextViewBottomLine).offset(10)
            make.leading.equalTo(contentView).offset(20)
            make.trailing.equalTo(contentView).offset(-20)
            make.height.equalTo(250)
        }
        
        goodsPictureLoadButton.snp.makeConstraints { make in
            make.bottom.equalTo(goodsImage).offset(-5)
            make.trailing.equalTo(goodsImage).offset(-3)
            make.size.equalTo(CGSize(width: 30, height: 30))
        }
        
        goodsPictureLoadButton.addTarget(self, action: #selector(choosePictureButtonAction), for: .touchUpInside)
    }
    
    @objc func choosePictureButtonAction() {
        let openCameraOrLibraryAlert = UIAlertController(title: "사진 선택하기", message: "상품의 이미지를 선택해주세요!", preferredStyle: .actionSheet)
        let libraryAlertAction = UIAlertAction(title: "사진앨범", style: .default) { (action) in self.openLibrary()}
        let cameraAlertAction = UIAlertAction(title: "카메라", style: .default) { (action) in self.openCamera()}
        let cancelAlertAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        openCameraOrLibraryAlert.addAction(libraryAlertAction)
        openCameraOrLibraryAlert.addAction(cameraAlertAction)
        openCameraOrLibraryAlert.addAction(cancelAlertAction)
        
        present(openCameraOrLibraryAlert, animated: true, completion: nil)
    }
    
    func openLibrary() {
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func openCamera() {
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: false, completion: nil)
    }
}

extension PostWriteViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            goodsImage.image = image
        }
        
        dismiss(animated: true, completion: nil)
    }
}

extension PostWriteViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ postMainTextView: UITextView) {
        if postMainTextView.textColor == UIColor.lightGray {
            postMainTextView.text = nil
            postMainTextView.textColor = UIColor.darkGray
        }
    }
    
    func textViewDidEndEditing(_ postMainTextView: UITextView) {
        if postMainTextView.text.isEmpty {
            postMainTextView.text = "상품에 대한 글을 작성해주세요"
            postMainTextView.textColor = UIColor.lightGray
        }
    }
}
