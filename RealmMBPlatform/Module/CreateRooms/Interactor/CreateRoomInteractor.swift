//
//  CreateRoomInteractor.swift
//  RealmMBPlatform
//
//  Created by admin on 27.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RealmSwift
import SCLAlertView

class CreateRoomInteractor {
    var segmentControllerVariable = Variable<Int>(0)
    var rooms = [Rooms]()
    var realm:Realm!
    var disposeBag = DisposeBag()
    let uuid = NSUUID().uuidString.lowercased()
    let alert = SCLAlertView()
}
extension CreateRoomInteractor: CreateRoomInteractorProtocol {
    
    func synchronizeData(userName: String, password: String) {
       let url = URL(string: "http://10.0.4.193:9080")
        SyncUser.authenticate(with: .usernamePassword(username: userName, password: password, actions: []), server: url!, onCompletion: {user,error in
            let user = user
           
            if user == nil {
                print("User does not found")
            }
            
            let configuration = Realm.Configuration(
                syncConfiguration: (user!, URL(string: "realm://10.0.4.193:9080/all/rooms")!)
            )
            self.realm = try! Realm(configuration: configuration)
        })
    }
    
    func access(segmentController:UISegmentedControl,textField:UITextField){
        segmentController.rx.value.bindTo(segmentControllerVariable).addDisposableTo(disposeBag)
        segmentControllerVariable.asObservable().subscribe(onNext: { value in 
            if value == 1 {
                textField.isEnabled = false
                textField.placeholder = "Only for private room"
                textField.text = ""
            }else{
                textField.isEnabled = true
                textField.placeholder = "Enter password"
                textField.text = ""
            }
        }).addDisposableTo(disposeBag)
    }
    
    
    func add(name: String, type: String, password: String,access:String) {
        if password == "" {
            try! realm.write {
                realm.add(Rooms(value: [name,type,access,"0","\(uuid)",List<Message>()]))
            }
        }else{
            try! realm.write {
                realm.add(Rooms(value: [name,type,access,password,"\(uuid)",List<Message>()]))
            }
        }
    }
    
    func checkToEmpty(name:String,type:String,value:Int,password:String,action:()->()) {
        if name.isEmpty == false && type.isEmpty == false {
            if value == 0 {
                if password != "" {
                    self.add(name: name, type: type, password: password, access: "Private")
                    action()
                }else{
                    alert.showError("Error", subTitle: "Enter password")
                }
            }else{
                self.add(name: name, type: type, password: "0",access: "Publick")
                action()
            }
        }else{
            alert.showError("Not save", subTitle: "Enter all fields")
        }
    }
}
