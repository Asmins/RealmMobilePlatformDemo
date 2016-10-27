//
//  CreateViewController.swift
//  RealmMBPlatform
//
//  Created by admin on 27.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var presenter: CreateRoomPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create room"
        self.setupTableView(tableView: tableView)
        // Do any additional setup after loading the view.
    }
}

extension CreateViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        let aCell = tableView.dequeueReusableCell(withIdentifier: "CreateCell") as! CreateCell
        switch indexPath.section {
        case 0:
            aCell.textField.placeholder = "Please enter namy room"
            cell = aCell
        case 1:
            aCell.textField.placeholder = "What will be in this room? Interests"
            cell = aCell
        case 2:
            aCell.textField.placeholder = "Private or Public"
            cell = aCell
        case 3:
            aCell.textField.placeholder = "Password if it`s private rooms"
            aCell.textField.isSecureTextEntry = true
            cell = aCell
        case 4:
            let aCell = tableView.dequeueReusableCell(withIdentifier: "SaveCell") as! SaveCell
            aCell.save(action: {
                self.presenter?.add(room: Room(nameRoom: "", acesses: "public", type: "some", password: "0"))
            })
            cell = aCell
        default:
            print("Error")
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}

extension CreateViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 4 {
            return CGFloat(30)
        }else{
            return CGFloat(60)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as! HeaderView
        header.configHeader(header: header, section: section)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 4{
            return CGFloat(0)
        }else{
            return CGFloat(30)
        }
    }
}


extension CreateViewController {
    func setupTableView(tableView:UITableView) {
        tableView.register(UINib(nibName:"HeaderView",bundle:nil), forHeaderFooterViewReuseIdentifier: "HeaderView")
        tableView.register(UINib(nibName:"CreateCell",bundle:nil), forCellReuseIdentifier: "CreateCell")
        tableView.register(UINib(nibName:"SaveCell",bundle:nil), forCellReuseIdentifier: "SaveCell")
        
    }
}
