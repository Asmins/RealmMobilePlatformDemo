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

class CreateRoomInteractor {
    var segmentControllerVariable = Variable<Int>(0)
    var rooms = [Rooms]()
    var realm:Realm!
    var disposeBag = DisposeBag()
    let uuid = NSUUID().uuidString.lowercased()
}
extension CreateRoomInteractor: CreateRoomInteractorProtocol {
    
    func synchronizeData(userName: String, password: String) {
       let url = URL(string: "http://127.0.0.1:9080")
        SyncUser.authenticate(with: .usernamePassword(username: userName, password: password, actions: []), server: url!, onCompletion: {user,error in
            let user = user
           
            if user == nil {
                fatalError(String(describing: error))
            }
            
            let configuration = Realm.Configuration(
                syncConfiguration: (user!, URL(string: "realm://127.0.0.1:9080/all/rooms")!)
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
    
    
    func add(name: String, type: String, password: String) {
        if password == "" {
            try! realm.write {
                realm.add(Rooms(value: [name,type,"0","\(uuid)"]))
            }
        }else{
            try! realm.write {
                realm.add(Rooms(value: [name,type,password,"\(uuid)"]))
            }
        }
    }
    
    func checkToEmpty(name: String, type: String, value: Int, password: String) {
        if name.isEmpty == false && type.isEmpty == false {
            //Chect private or publick
            if value == 0 {
                if password != "" {
                    self.add(name: name, type: type, password: password)
                }else{
                    print("Enter password")
                }
            }else{
                self.add(name: name, type: type, password: "0")
                print("Save")
            }
        }else{
            print("Not save")
            print("Enter all fields")
        }
    }
}
