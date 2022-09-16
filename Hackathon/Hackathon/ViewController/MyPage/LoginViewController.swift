//
//  LoginViewController.swift
//  Hackathon
//
//  Created by Jaehyeok Lim on 2022/09/15.
//

import UIKit
import SnapKit
import Alamofire

struct User: Codable {
    var id: String
    var name: String
    var phoneNumber: Int
    var email: String
    var address: String
    var aptNum: String
}

class LoginViewController: UIViewController {
    
    var superViewUIList: [UIView] = []
    var scrollViewUIList: [UIView] = []
    var contentViewUIList: [UIView] = []
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "로그인"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        
        return label
    }()
    
    private let idTextField: UITextField = {
        let field = UITextField()
        
        field.placeholder = "아이디"
        
        field.backgroundColor = UIColor.white
        field.layer.cornerRadius = 5
        field.textColor = UIColor.darkGray
        field.font = UIFont.boldSystemFont(ofSize: 18)
        field.textAlignment = .left
        field.autocapitalizationType = .none
        
        return field
    }()
    
    private let idTextFieldBottomLine: UILabel = {
        let label = UILabel()
        
        label.layer.borderColor = UIColor.systemGray4.cgColor
        label.layer.borderWidth = 1
        
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let field = UITextField()
        
        field.placeholder = "비밀번호"
        
        field.backgroundColor = UIColor.white
        field.layer.cornerRadius = 5
        field.textColor = UIColor.darkGray
        field.font = UIFont.boldSystemFont(ofSize: 18)
        field.textAlignment = .left
        field.autocapitalizationType = .none
        
        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        
        button.layer.backgroundColor = UIColor.titleLogoColor?.cgColor
        button.layer.cornerRadius = 15
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.setTitleColor(UIColor.white, for: .normal)
        
        return button
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("회원가입", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        
        return button
    }()
    
    private let idPasswordFindingButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("아이디/비밀번호 찾기", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        superViewLayout()
    }
    
    private func superViewLayout() {
        view.backgroundColor = UIColor.topViewBackgroundColor
        
        superViewUIList = [titleLabel, idTextField, idTextFieldBottomLine, passwordTextField, loginButton, registerButton, idPasswordFindingButton]
        
        for uiView in superViewUIList {
            view.addSubview(uiView)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(250)
            make.width.equalTo(view)
        }
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).offset(55)
            make.leading.equalTo(view).offset(90)
            make.trailing.equalTo(view).offset(-90)
            make.height.equalTo(35)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField).offset(50)
            make.leading.equalTo(view).offset(90)
            make.trailing.equalTo(view).offset(-90)
            make.height.equalTo(35)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField).offset(50)
            make.leading.equalTo(view).offset(90)
            make.trailing.equalTo(view).offset(-90)
            make.height.equalTo(50)
        }
        
        idTextFieldBottomLine.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(15)
            make.leading.equalTo(75)
            make.height.equalTo(1)
            make.width.equalTo(245)
        }
        
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(idTextFieldBottomLine).offset(5)
            make.trailing.equalTo(loginButton.snp.trailing)
        }
        
        idPasswordFindingButton.snp.makeConstraints { make in
            make.top.equalTo(idTextFieldBottomLine).offset(5)
            make.leading.equalTo(loginButton.snp.leading)
        }
        
        registerButton.addTarget(self, action: #selector(registerButtonAction), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
    }
    
    @objc func registerButtonAction(_: UIButton) {
        let viewController = registerViewController()
        
        viewController.modalPresentationStyle = .fullScreen
        
        present(viewController, animated: true)
    }
    
    @objc func loginButtonAction(_: UIButton) {
        postBodyJsonRequest()
    }
    
    func postBodyJsonRequest(){
        
        // [http 요청 주소 지정]
        let url = "http://34.64.186.176/login"
        
        
        // [http 요청 헤더 지정]
        let header : HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        
        // [http 요청 파라미터 지정 실시]
        let bodyData:Parameters = [
            "id": idTextField.text!,
            "pwd": passwordTextField.text!
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
                print("로그인 성공!\n")
                UserDefaults.standard.set(true, forKey: "LoginStatus")
                UserDefaults.standard.set(String(self.idTextField.text!), forKey: "userID")
                UserDefaults.standard.set(String(self.passwordTextField.text!), forKey: "userPassword")
                print("LoginStatus: \(UserDefaults.standard.bool(forKey: "LoginStatus")) 저장완료\nuserID: \(UserDefaults.standard.string(forKey: "userID")!) 저장완료\nuserPassword: \(UserDefaults.standard.string(forKey: "userPassword")!) 저장완료")
                self.getData(id: self.idTextField.text!, password: self.passwordTextField.text!)
                
                DispatchQueue.main.async {
                    
                }
                
            } else {
                print("로그인 실패..")
            }
        }
        
        self.dismiss(animated: true)
    }
    
    func getData(id: String, password: String) {
        let semaphore = DispatchSemaphore (value: 0)

        let parameters = "{\n    \"id\": \"\(id)\",\n    \"pwd\": \"\(password)\"\n}"
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "http://34.64.186.176/login")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("loginData=s%3A-jQDdUIpZ1vZgcFqqYk6i8gVbCWScGaV.Vqg5UDiB89%2FAl5zq%2Bv4DKlhpRiRMt0IarNtUZf%2BlyFY", forHTTPHeaderField: "Cookie")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
            
            let info = try? JSONDecoder().decode(User.self, from: data)
            print("불러오기 완료 \(info)")
            
            let item = UserInfoData(userID: info?.id, userName: info?.name, userCellPhoneNumber: info?.phoneNumber, userEmail: info?.email, userAddress: info?.address, aptNum: info?.aptNum)
            
            UserInfoDataList.insert(item, at: 0)
            print("UserInfo DataList에 저장완료")
        }
        
        task.resume()
//        semaphore.wait()
        
        DispatchQueue.main.async {
        
        }
    }
}
