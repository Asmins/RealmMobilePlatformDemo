//
//  CreateRoomPresenter.swift
//  RealmMBPlatform
//
//  Created by admin on 27.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class CreateRoomPresenter {
    
    var interactor:CreateRoomInteractor?
    var bool = false
    var textForPasswordTextField = "Only for private room"
    var tableView: UITableView?
    var nameTextField: UITextField?
    var typeTextField: UITextField?
    var passwordTextField: UITextField?
    
    @objc func switchChange() {
        if bool == false{
            bool = true
            textForPasswordTextField = "Enter password for room"
        }else{
            bool = false
            textForPasswordTextField = "Only for private room"
            passwordTextField?.text = ""
        }
        self.tableView?.reloadData()
    }

    @objc func changesTextField(){
//        if nameTextField?.text?.isEmpty == false && typeTextField?.text?.isEmpty == false{
//            if bool == true && passwordTextField?.text?.isEmpty == false{
//                print("Cool")
//            }else{
//                print("Something else")
//            }
//        }else{
//            print("nil")
//        }
    }
}

extension CreateRoomPresenter: CreateRoomPresenterProtocol {
    
    func setupNavigationController(navController: UINavigationController) {
        navController.navigationBar.tintColor = UIColor.white
        navController.navigationBar.backgroundColor = UIColor.black
    }
    
    func setupCell(indexPath:IndexPath,tableView:UITableView) -> UITableViewCell {
        var cell = UITableViewCell()
      
        switch indexPath.section {
        case 0:
            let aCell = tableView.dequeueReusableCell(withIdentifier: "CreateRoomCell") as! CreateRoomCell
            aCell.mainTextField.placeholder = "Enter name room"
            self.nameTextField = aCell.mainTextField
            self.nameTextField?.addTarget(self, action: #selector(changesTextField), for: UIControlEvents.editingDidEnd)
            cell = aCell
        case 1:
            let aCell = tableView.dequeueReusableCell(withIdentifier: "AccessRoomCell") as! AccessRoomCell
            self.tableView = tableView
            aCell.switchAccess.addTarget(self, action: #selector(switchChange), for: UIControlEvents.valueChanged)
            cell = aCell
        case 2:
            let aCell = tableView.dequeueReusableCell(withIdentifier: "CreateRoomCell") as! CreateRoomCell
            if textForPasswordTextField == "Only for private room" {
                aCell.mainTextField.isEnabled = false
            }else{
                aCell.mainTextField.isEnabled = true
            }
            aCell.mainTextField.isSecureTextEntry = true
            aCell.mainTextField.placeholder = textForPasswordTextField
            self.passwordTextField = aCell.mainTextField
            self.passwordTextField?.addTarget(self, action: #selector(changesTextField), for: .editingDidEnd)
            cell = aCell
        case 3:
            let aCell = tableView.dequeueReusableCell(withIdentifier: "SaveCell") as! SaveCell
            cell = aCell
        default:
            print("error")
        }
        return cell
    }
    
    func addNewGroup(userName:String) {
        if bool == true {
            self.interactor?.add(name: (nameTextField?.text)!, user: userName, password: (passwordTextField?.text)!, access: "Private")
        }else{
            self.interactor?.add(name: (nameTextField?.text)!, user: userName, password: "0", access: "Public")
        }
    }
    
    func synchronizeData(userName: String, password: String) {
        self.interactor?.synchronizeData(userName: userName, password: password)
    }
}
