//
//  MainInteractor.swift
//  RealmMBPlatform
//
//  Created by admin on 24.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import Foundation
import RealmSwift
import RxCocoa
import RxSwift

class MainInteractor {
    var bool = false
    var username:String!
    var message = [Message]()
    var realm:Realm!
    var notificationToken: NotificationToken!
    
    var disposeBag = DisposeBag()
    var textVariavble = Variable<String?>("")
    
    func some(textField:UITextField){
        
        textVariavble = Variable("\(textField.text)")
        
        textField.rx.text.bindTo(textVariavble).addDisposableTo(disposeBag)
        
        textVariavble.asObservable().throttle(0.1, scheduler: MainScheduler.instance).subscribe(onNext: { text in
            print(text!)
            if text?.isEmpty == false{
                if self.bool == false{
                    try! self.realm.write {
                        self.realm.add(Message(value: [text!,self.username!]))
                    }
                    self.bool = true
                }else{
                    let message = self.realm.objects(Message.self).last
                    try! self.realm.write {
                        message?.textMessage = text!
                    }
                }
            }
            
            if self.bool == true {
                if text?.characters.count == 0 {
                    let message = self.realm.objects(Message.self).last
                    try! self.realm.write {
                        self.realm.delete(message!)
                    }
                    self.bool = false
                }
            }
        }).addDisposableTo(disposeBag)
    }
}

extension MainInteractor: MainInteractorProtocol {
    
    func addNewTask(text:String) {
        try! realm.write {
            realm.add(Message(value: [text,username!]))
        }
    }
    
    func clean(textField: UITextField) {
        self.bool = false
        textField.text = ""
    }
    
    func synchronizeData(userName: String, password: String,tableView:UITableView,id:String) {
        let url = URL(string: "http://127.0.0.1:9080")
        print(Realm.Configuration.defaultConfiguration.fileURL)
        username = userName
        SyncUser.authenticate(with: Credential.usernamePassword(username: userName, password: password, actions: []), server: url!, onCompletion: { user,error in
            let user = user
            
            if user == nil {
                fatalError(String(describing: error))
            }
            
            let configuration = Realm.Configuration(
                syncConfiguration: (user!, URL(string: "realm://127.0.0.1:9080/\(id)/messages")!)
            )
            
            self.realm = try! Realm(configuration: configuration)
            
            func updateList() {
                self.message = Array(self.realm.objects(Message.self))
                tableView.reloadData()
            }
            updateList()
            self.notificationToken = self.realm.addNotificationBlock { _ in
                updateList()
            }
        })
    }
    
}
