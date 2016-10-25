//
//  MainInteractor.swift
//  RealmMBPlatform
//
//  Created by admin on 24.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import Foundation
import RealmSwift

class MainInteractor {
    var items = List<Task>()
    var realm:Realm!
    var notificationToken: NotificationToken!
}

extension MainInteractor: MainInteractorProtocol {
    
    func addNewTask(viewController:UIViewController ) {
        let alertController = UIAlertController(title: "Add", message: "Add new item", preferredStyle: .alert)
       
        var alertTextField: UITextField!
        alertController.addTextField { textField in
            alertTextField = textField
            textField.placeholder = "Task Name"
        }
        alertController.addAction(UIAlertAction(title: "Add", style: .default) { _ in
            guard let text = alertTextField.text , !text.isEmpty else { return }
            
            let items = self.items
            try! items.realm?.write {
             //   items.insert(Task(value: ["text": text]))
                items.insert(Task(value:["text":text]), at: items.count)
            }
        })
        
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    func synchronizeData(userName: String, password: String,tableView:UITableView) {
        let url = URL(string: "http://10.0.4.117:9080")
        
        SyncUser.authenticate(with: Credential.usernamePassword(username: userName, password: password, actions: []), server: url!, onCompletion: { user,error in
            let user = user
            
            if user == nil {
                    fatalError(String(describing: error))
            }
            
            let configuration = Realm.Configuration(
                syncConfiguration: (user!, URL(string: "realm://10.0.4.117:9080/2969436d5996f60fc11b96cc382c1310/realmtasks")!)
            )
            self.realm = try! Realm(configuration: configuration)
            
            func updateList() {
                if self.items.realm == nil, let list = self.realm.objects(TaskList.self).first {
                    self.items = list.items
                }
                print(self.items)
                tableView.reloadData()
            }
            updateList()
            self.notificationToken = self.realm.addNotificationBlock { _ in
                updateList()
            }
        })
    }
}
