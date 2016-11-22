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
    var id = 0 
    var bool = false
    var username:String!
    var rooms = [Rooms]()
    var messages = List<Message>()
    var realm:Realm!
    var notificationToken: NotificationToken!
    
    var disposeBag = DisposeBag()
    var textVariavble = Variable<String?>("")
    
    func some(textField:UITextField){
        
        textVariavble = Variable("\(textField.text)")
        
        /*textField.rx.text.bindTo(textVariavble).addDisposableTo(disposeBag)
        
        textVariavble.asObservable().throttle(0.1, scheduler: MainScheduler.instance).subscribe(onNext: { text in
            
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
        }).addDisposableTo(disposeBag)*/
    }
}

extension MainInteractor: MainInteractorProtocol {
    
    func addNewTask(text:String) {
        
        let timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .medium)
        try! realm.write {
            let newMessage = Message()
            newMessage.textMessage = text
            newMessage.user = username
            newMessage.date = timestamp
            self.rooms[id].message.append(newMessage)
        }
    }
    
    func clean(textField: UITextField) {
        self.bool = false
        textField.text = ""
    }
    
    func synchronizeData(userName: String, password: String,tableView:UITableView,id:Int,indicator:UIActivityIndicatorView,view:UIView) {
        let url = URL(string: "http://10.0.4.193:9080")
        username = userName
        view.isHidden = false
        indicator.startAnimating()
        SyncUser.authenticate(with: Credential.usernamePassword(username: userName, password: password, actions: []), server: url!, onCompletion: { user,error in
            let user = user
          
            let configuration = Realm.Configuration(
                syncConfiguration: (user!, URL(string: "realm://10.0.4.193:9080/all/rooms")!)
            )
            
            self.realm = try! Realm(configuration: configuration)
            
            func updateList() {
                self.rooms = Array(self.realm.objects(Rooms.self))
                self.messages = self.rooms[id].message
                self.id = id
                view.isHidden = true
                indicator.stopAnimating()
                tableView.reloadData()
            }
            updateList()
            self.notificationToken = self.realm.addNotificationBlock { _ in
                updateList()
            }
        })
    }
    
}
