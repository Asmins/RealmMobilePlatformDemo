//
//  CreateViewController.swift
//  RealmMBPlatform
//
//  Created by admin on 27.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CreateViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var presenter: CreateRoomPresenter?
    var navigation: CreateRoomWireframe?
    var userName:String?
    var password:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create room"
        self.setupTableView(tableView: tableView)
        self.presenter?.synchronizeData(userName: userName!, password: password!)
        self.presenter?.setupNavigationController(navController: navigationController!)
//        self.presenter?.access(segmentController: segmentController, textField: textFieldForPassword)
        // Do any additional setup after loading the view.
 
    }
    
    @IBAction func saveButtonAction(_ sender: AnyObject) {
//        //self.presenter?.checkToEmpty(name: textFieldForNameRoom.text!, type: textFieldForTypeRoom.text!, value: segmentController.selectedSegmentIndex, password: textFieldForPassword.text!,action: {
//            self.navigation?.dismiss(viewController: self)
//        })
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}

extension CreateViewController {
    func setupTableView(tableView:UITableView) {
        tableView.register(UINib(nibName: "CreateRoomCell", bundle: nil), forCellReuseIdentifier: "CreateRoomCell")
        tableView.register(UINib(nibName: "AccessRoomCell", bundle:nil), forCellReuseIdentifier: "AccessRoomCell")
        tableView.register(UINib(nibName: "SaveCell", bundle: nil), forCellReuseIdentifier: "SaveCell")
    }
}

extension CreateViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return (self.presenter?.setupCell(indexPath: indexPath, tableView: tableView))!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
}

extension CreateViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 4 {
            self.presenter?.addNewGroup()
            self.navigation?.dismiss(viewController: self)
        }
    }
}
