//
//  AppDelegate.swift
//  Hackathon
//
//  Created by Jaehyeok Lim on 2022/09/15.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        ImagePickerManger().checkAlbumPermission()
        ImagePickerManger().checkCameraPermission()
        
        let item1 = SalesPostData(GoodsImage: UIImage(named: "Image 1"), PostTitleText: "MacBook M1 Pro 14인치", PostMainText: "팝니다", PostDate: Date(), BoxNumber: "1", price: "2,490,000")
        let item2 = SalesPostData(GoodsImage: UIImage(named: "Image 2"), PostTitleText: "iPhone 14 Pro Max", PostMainText: "팝니다", PostDate: Date(), BoxNumber: "2", price: "1,490,000원")
        let item3 = SalesPostData(GoodsImage: UIImage(named: "Image 3"), PostTitleText: "Apple Watch 8 Hermess", PostMainText: "팝니다", PostDate: Date(), BoxNumber: "3", price: "1,680,000원")
        let item4 = SalesPostData(GoodsImage: UIImage(named: "Image 4"), PostTitleText: "AirPod Pro 3gen", PostMainText: "팝니다", PostDate: Date(), BoxNumber: "4", price: "359,000원")

        SalesPostDatalist.insert(item1, at: 0)
        SalesPostDatalist.insert(item2, at: 0)
        SalesPostDatalist.insert(item3, at: 0)
        SalesPostDatalist.insert(item4, at: 0)
        
//        UserDefaults.standard.set(false, forKey: "LoginStatus")
            
        if UserDefaults.standard.bool(forKey: "LoginStatus") == true {
            LoginViewController().getData(id: UserDefaults.standard.string(forKey: "userID")!, password: UserDefaults.standard.string(forKey: "userPassword")!)
            print("UserInfo 불러오기 완료")
            print("userID: \(UserDefaults.standard.string(forKey: "userID")) 불러오기 완료\nuserPassword: \(UserDefaults.standard.string(forKey: "userPassword")) 불러오기 완료")
            JsonPostManager().seqPostBoxStatusGet(sequenceName: String(UserInfoDataList[0].seq!))

        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Hackathon")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

//
//  AppDelegate.swift
//  Hackathon
//
//  Created by Jaehyeok Lim on 2022/09/15.
//

//import UIKit
//import CoreData
//
//@main
//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//
//        ImagePickerManger().checkAlbumPermission()
//        ImagePickerManger().checkCameraPermission()
//
////        UserDefaults.standard.set(false, forKey: "LoginStatus")
//        let item1 = SalesPostData(GoodsImage: UIImage(named: "Image 1"), PostTitleText: "MacBook M1 Pro 14인치", PostMainText: "팝니다", PostDate: Date(), BoxNumber: "1", price: "2,490,000")
//        let item2 = SalesPostData(GoodsImage: UIImage(named: "Image 2"), PostTitleText: "iPhone 14 Pro Max", PostMainText: "팝니다", PostDate: Date(), BoxNumber: "2", price: "1,490,000원")
//        let item3 = SalesPostData(GoodsImage: UIImage(named: "Image 3"), PostTitleText: "Apple Watch 8 Hermess", PostMainText: "팝니다", PostDate: Date(), BoxNumber: "3", price: "1,680,000원")
//        let item4 = SalesPostData(GoodsImage: UIImage(named: "Image 4"), PostTitleText: "AirPod Pro 3gen", PostMainText: "팝니다", PostDate: Date(), BoxNumber: "4", price: "359,000원")
//
//        SalesPostDatalist.insert(item1, at: 0)
//        SalesPostDatalist.insert(item2, at: 0)
//        SalesPostDatalist.insert(item3, at: 0)
//        SalesPostDatalist.insert(item4, at: 0)
//
//        print(SalesPostDatalist.count)
//        if UserDefaults.standard.bool(forKey: "LoginStatus") == true {
//            LoginViewController().getData(id: UserDefaults.standard.string(forKey: "userID")!, password: UserDefaults.standard.string(forKey: "userPassword")!)
//            print("UserInfo 불러오기 완료")
//            print("userID: \(UserDefaults.standard.string(forKey: "userID")) 불러오기 완료\nuserPassword: \(UserDefaults.standard.string(forKey: "userPassword")) 불러오기 완료")
////            JsonPostManager().seqPostBoxStatusGet(sequenceName: String(UserInfoDataList[0].seq!))
//            let item1 = BoxStatusData(boxNum: 1, boxEmpty: 1, ownerName: "chungnam", updatedDate: "2022/09/18 12:07")
//            let item2 = BoxStatusData(boxNum: 2, boxEmpty: 0, ownerName: "nil", updatedDate: "nil")
//            let item3 = BoxStatusData(boxNum: 3, boxEmpty: 0, ownerName: "nil", updatedDate: "nil")
//            let item4 = BoxStatusData(boxNum: 4, boxEmpty: 0, ownerName: "nil", updatedDate: "nil")
//            BoxStatusDataList.insert(item1, at: 0)
//            BoxStatusDataList.insert(item2, at: 1)
//            BoxStatusDataList.insert(item3, at: 2)
//            BoxStatusDataList.insert(item4, at: 3)
//
//        }
//
//        return true
//    }
//
//    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }
//
//    // MARK: - Core Data stack
//
//    lazy var persistentContainer: NSPersistentContainer = {
//        /*
//         The persistent container for the application. This implementation
//         creates and returns a container, having loaded the store for the
//         application to it. This property is optional since there are legitimate
//         error conditions that could cause the creation of the store to fail.
//        */
//        let container = NSPersistentContainer(name: "Hackathon")
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//
//                /*
//                 Typical reasons for an error here include:
//                 * The parent directory does not exist, cannot be created, or disallows writing.
//                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
//                 * The device is out of space.
//                 * The store could not be migrated to the current model version.
//                 Check the error message to determine what the actual problem was.
//                 */
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        return container
//    }()
//
//    // MARK: - Core Data Saving support
//
//    func saveContext () {
//        let context = persistentContainer.viewContext
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
//    }
//
//}

