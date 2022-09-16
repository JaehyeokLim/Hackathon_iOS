//
//  registerViewController.swift
//  Hackathon
//
//  Created by Jaehyeok Lim on 2022/09/15.
//

import UIKit
import SnapKit
import Alamofire

class registerViewController: UIViewController {
    
    var superViewUIList: [UIView] = []
    var scrollViewUIList: [UIView] = []
    var contentViewUIList: [UIView] = []

    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "회원가입"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        
        return label
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
    
    private let profileTextLabel: UILabel = {
        let label = UILabel()
        
        label.text = "프로필 설정"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        
        return label
    }()
    
    private let userNameTextField: UITextField = {
        let field = UITextField()
        
        field.placeholder = "이름을 입력해주세요"
        
        field.backgroundColor = UIColor.white
        field.layer.cornerRadius = 5
        field.textColor = UIColor.darkGray
        field.font = UIFont.boldSystemFont(ofSize: 18)
        field.textAlignment = .left
        
        return field
    }()
    
    
    private let phoneNumberTextField: UITextField = {
        let field = UITextField()
        
        field.placeholder = "전화번호를 입력해주세요"
        
        field.backgroundColor = UIColor.white
        field.layer.cornerRadius = 5
        field.textColor = UIColor.darkGray
        field.font = UIFont.boldSystemFont(ofSize: 18)
        field.textAlignment = .left
        
        return field
    }()
    
    private let emailTextField: UITextField = {
        let field = UITextField()
        
        field.placeholder = "이메일을 입력해주세요"
        
        field.backgroundColor = UIColor.white
        field.layer.cornerRadius = 5
        field.textColor = UIColor.darkGray
        field.font = UIFont.boldSystemFont(ofSize: 18)
        field.textAlignment = .left
        
        return field
    }()
    
    private let addressTextField: UITextField = {
        let field = UITextField()
        
        field.placeholder = "주소를 입력해주세요"
        
        field.backgroundColor = UIColor.white
        field.layer.cornerRadius = 5
        field.textColor = UIColor.darkGray
        field.font = UIFont.boldSystemFont(ofSize: 18)
        field.textAlignment = .left
        
        return field
    }()
    
    private let aptNumTextField: UITextField = {
        let field = UITextField()
        
        field.placeholder = "상세주소를 입력해주세요 ex) 동, 호수"
        
        field.backgroundColor = UIColor.white
        field.layer.cornerRadius = 5
        field.textColor = UIColor.darkGray
        field.font = UIFont.boldSystemFont(ofSize: 18)
        field.textAlignment = .left
        
        return field
    }()
    
    private let profileBottomLine: UILabel = {
        let label = UILabel()
        
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 2
        
        return label
    }()

    private let accountTextLabel: UILabel = {
        let label = UILabel()
        
        label.text = "게정 설정"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        
        return label
    }()
    
    private let idTextField: UITextField = {
        let field = UITextField()
        
        field.placeholder = "아이디를 입력해주세요"
        
        field.backgroundColor = UIColor.white
        field.layer.cornerRadius = 5
        field.textColor = UIColor.darkGray
        field.font = UIFont.boldSystemFont(ofSize: 18)
        field.textAlignment = .left
        
        return field
    }()
    
    private let passwordTextField: UITextField = {
        let field = UITextField()
        
        field.placeholder = "비밀번호를 입력해주세요"
        
        field.backgroundColor = UIColor.white
        field.layer.cornerRadius = 5
        field.textColor = UIColor.darkGray
        field.font = UIFont.boldSystemFont(ofSize: 18)
        field.textAlignment = .left
        
        return field
    }()
    
    private let passwordCheckTextField: UITextField = {
        let field = UITextField()
        
        field.placeholder = "비밀번호를 다시 입력해주세요"
        
        field.backgroundColor = UIColor.white
        field.layer.cornerRadius = 5
        field.textColor = UIColor.darkGray
        field.font = UIFont.boldSystemFont(ofSize: 18)
        field.textAlignment = .left
        
        return field
    }()
    
    private let accountBottomLine: UILabel = {
        let label = UILabel()
        
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 2
        
        return label
    }()
    
    private let NextButton: UIButton = {
        let button = UIButton()
        
        button.layer.backgroundColor = UIColor.titleLogoColor?.cgColor
        button.layer.cornerRadius = 15
        button.setTitle("다음 단계로 이동", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.setTitleColor(UIColor.white, for: .normal)
        
        return button
    }()
    
    private let nameTextLabel: UILabel = {
        let label = UILabel()
        
        label.text = "이름"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    private let phoneNumberTextLabel: UILabel = {
        let label = UILabel()
        
        label.text = "전화번호"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    private let emailTextLabel: UILabel = {
        let label = UILabel()
        
        label.text = "이메일 주소"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    private let addressTextLabel: UILabel = {
        let label = UILabel()
        
        label.text = "거주지"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    private let aptNumberTextLabel: UILabel = {
        let label = UILabel()
        
        label.text = "상세주소"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    private let idTextLabel: UILabel = {
        let label = UILabel()
        
        label.text = "아이디"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    private let passwordTextLabel: UILabel = {
        let label = UILabel()
        
        label.text = "비밀번호"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    private let passwordCheckTextLabel: UILabel = {
        let label = UILabel()
        
        label.text = "비밀번호 재입력"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        superViewLayout()
        scrollViewLayout()
        contentViewLayout()
    }
    
    private func superViewLayout() {
        view.backgroundColor = UIColor.topViewBackgroundColor
        
        superViewUIList = [scrollView, titleLabel]
        
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
            make.height.equalTo(1700)
        }
    }
    
    private func contentViewLayout() {
        contentViewUIList = [profileTextLabel, userNameTextField, phoneNumberTextField, emailTextField, addressTextField, aptNumTextField, profileBottomLine, accountTextLabel, idTextField, passwordTextField, passwordCheckTextField, accountBottomLine, NextButton,
            nameTextLabel, phoneNumberTextLabel, emailTextLabel, addressTextLabel, aptNumberTextLabel, idTextLabel, passwordTextLabel, passwordCheckTextLabel]
        
        for uiView in contentViewUIList {
            contentView.addSubview(uiView)
        }
        
        profileTextLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(30)
            make.leading.equalTo(contentView).offset(25)
        }
        
        userNameTextField.snp.makeConstraints { make in
            make.top.equalTo(profileTextLabel).offset(80)
            make.leading.equalTo(30)
            make.height.equalTo(35)
            make.width.equalTo(335)
        }
        
        phoneNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(userNameTextField).offset(50)
            make.leading.equalTo(30)
            make.height.equalTo(35)
            make.width.equalTo(335)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberTextField).offset(50)
            make.leading.equalTo(30)
            make.height.equalTo(35)
            make.width.equalTo(335)
        }
        
        addressTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField).offset(50)
            make.leading.equalTo(30)
            make.height.equalTo(35)
            make.width.equalTo(335)
        }
        
        aptNumTextField.snp.makeConstraints { make in
            make.top.equalTo(addressTextField).offset(50)
            make.leading.equalTo(30)
            make.height.equalTo(35)
            make.width.equalTo(335)
        }
        
        profileBottomLine.snp.makeConstraints { make in
            make.top.equalTo(aptNumTextField.snp.bottom).offset(15)
            make.leading.equalTo(30)
            make.height.equalTo(2)
            make.width.equalTo(335)
        }
        
        //
        accountTextLabel.snp.makeConstraints { make in
            make.top.equalTo(profileBottomLine.snp.bottom).offset(30)
            make.leading.equalTo(contentView).offset(25)
        }

        idTextField.snp.makeConstraints { make in
            make.top.equalTo(accountTextLabel).offset(80)
            make.leading.equalTo(30)
            make.height.equalTo(35)
            make.width.equalTo(335)
        }

        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField).offset(50)
            make.leading.equalTo(30)
            make.height.equalTo(35)
            make.width.equalTo(335)
        }

        passwordCheckTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField).offset(50)
            make.leading.equalTo(30)
            make.height.equalTo(35)
            make.width.equalTo(335)
        }

        accountBottomLine.snp.makeConstraints { make in
            make.top.equalTo(passwordCheckTextField
                .snp.bottom).offset(15)
            make.leading.equalTo(30)
            make.height.equalTo(2)
            make.width.equalTo(335)
        }
        
        NextButton.snp.makeConstraints { make in
            make.top.equalTo(accountBottomLine.snp.bottom).offset(35)
            make.leading.equalTo(30)
            make.height.equalTo(60)
            make.width.equalTo(335)
        }
        
        NextButton.addTarget(self, action: #selector(nextbuttonAction), for: .touchUpInside)
    }
    
    @objc func nextbuttonAction(_: UIButton) {
        let item =  RegisterData(userID: idTextField.text, userPassword: passwordTextField.text, userName: userNameTextField.text, userCellPhoneNumber: Int(phoneNumberTextField.text!), userEmail: userNameTextField.text, userAddress: addressTextField.text, aptNum: aptNumTextField.text)

        RegisterDataList.insert(item, at: 0)
        
        print(RegisterDataList)
        postBodyJsonRequest()
//        registerDataPost(list: RegisterDataList)
    }
    
    func registerDataPost(list: Array<Any>) {
//        guard let url = URL(string: "http://34.64.186.176/register") else {
//            print("url is wrong")
//            return
//        }
//
//        var request = URLRequest(url: url)
//
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let body: [String: Any] = [
//            "id": RegisterDataList[0].userID!,
//            "pwd": RegisterDataList[0].userPassword!,
//            "name": RegisterDataList[0].userName!,
//            "phoneNumber": RegisterDataList[0].userCellPhoneNumber!,
//            "email": RegisterDataList[0].userEmail!,
//            "address": RegisterDataList[0].userAddress!,
//            "aptNum": RegisterDataList[0].aptNum!
//        ]
//
//        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
//
//        let task = URLSession.shared.dataTask(with: request) { data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//
//            do {
//                let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
//                print("SUCCESS: \(response)")
//            }
//
//            catch {
//                print(error)
//            }
//        }
//
//        task.resume()
        let URL = "http://34.64.186.176/register"
        //전송할 파라미터 정보
        let PARAM:Parameters = [
//            "id": idTextField.text!,
//            "pwd": passwordTextField.text!,
//            "name": userNameTextField.text!,
//            "phoneNumber": Int(phoneNumberTextField.text!)!,
//            "email": emailTextField.text!,
//            "address": addressTextField.text!,
//            "aptNum": aptNumTextField.text!
            "id": "jaehyeoklim",
            "pwd": "1234",
            "name": "임재혁",
            "phoneNumber": 01024985409,
            "email": "aaa@gmail.com",
            "address": "두성아파트",
            "aptNum": "101동 901호",
            "Accept-Language": "en"
        ]
        //위의 URL와 파라미터를 담아서 POST 방식으로 통신하며, statusCode가 200번대(정상적인 통신) 인지 유효성 검사 진행
        let alamo = AF.request(URL, method: .post, parameters: PARAM).validate(statusCode: 200..<300)
        //결과값으로 문자열을 받을 때 사용
        alamo.responseString() { response in
            switch response.result
            {
            //통신성공
            case .success(let value):
                print("value: \(value)")
                
            //통신실패
            case .failure(let error):
                print("error: \(String(describing: error.errorDescription))")
            }
        }
    }
    
// MARK: - [Post Body Json Request 방식 http 요청 실시]
    func postBodyJsonRequest(){
        
        /*
         // -----------------------------------------
         [postBodyJsonRequest 메소드 설명]
         // -----------------------------------------
         1. 사전 spm 매니저 사용해 Alamofire 라이브러리 설치 필요 :
         https://github.com/Alamofire/Alamofire
         // -----------------------------------------
         2. http 허용 info plist : App Transport Security Settings >> Allow Arbitrary Loads >> YES
         // -----------------------------------------
         3. import 추가 : import Alamofire
         // -----------------------------------------
         */
        
        
        // [http 요청 주소 지정]
        let url = "http://34.64.186.176/register"
        
        
        // [http 요청 헤더 지정]
        let header : HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        
        // [http 요청 파라미터 지정 실시]
        let bodyData:Parameters = [
            "id": idTextField.text!,
            "pwd": passwordTextField.text!,
            "name": userNameTextField.text!,
            "phoneNumber": Int(phoneNumberTextField.text!)!,
            "email": emailTextField.text!,
            "address": addressTextField.text!,
            "aptNum": aptNumTextField.text!,
        ]
        
        // [http 요청 수행 실시]
        print("")
        print("====================================")
        print("[ >> postBodyJsonRequest() :: Post Body Json 방식 http 요청 실시]")
        print("-------------------------------")
        print("주 소 :: ", url)
        print("-------------------------------")
        print("데이터 :: ", bodyData.description)
        print("====================================")
        print("")
        
        AF.request(
            url, // [주소]
            method: .post, // [전송 타입]
            parameters: bodyData, // [전송 데이터]
            encoding: JSONEncoding.default, // [인코딩 스타일]
            headers: header // [헤더 지정]
        )
        .validate(statusCode: 200..<300)
        .responseData { response in
            if response.response?.statusCode == 200 {
                print("등록 성공!")
                
                self.dismiss(animated: true)
            } else {
                print("등록 실패..")
            }
        }
    }
}
