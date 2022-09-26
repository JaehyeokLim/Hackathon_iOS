//
//  JsonPostManager.swift
//  Hackathon
//
//  Created by Jaehyeok Lim on 2022/09/17.
//

import UIKit

struct Box: Codable {

    var boxNum: Int?
    var boxEmpty: Int?
    var ownerName: String?
    var updatedDate: String?
}


class JsonPostManager: UIViewController {
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    func seqPostBoxStatusGet(sequenceName: String) {
        BoxStatusDataList.removeAll()
        let semaphore = DispatchSemaphore (value: 0)

        let parameters = "{\n    \"seq\":\(sequenceName)\n}"
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "http://34.64.186.176/")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
            let info = try? JSONDecoder().decode([Box].self, from: data)
            print("보관함 데이터 불러오기 완료 \(info)")
            
            for i in 0..<4 {
                let item = BoxStatusData(boxNum: info?[i].boxNum, boxEmpty: info?[i].boxEmpty, ownerName: info?[i].ownerName, updatedDate: info?[i].updatedDate)
                BoxStatusDataList.insert(item, at: i)
                print(BoxStatusDataList[i])
            }
            
            print(BoxStatusDataList)
            print("BoxStatus DataList에 불러오기 완료")
            
            semaphore.signal()
        }

        task.resume()
        
        semaphore.wait()
    }
}
