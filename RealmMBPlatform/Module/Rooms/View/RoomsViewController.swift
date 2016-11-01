//
//  RoomsViewController.swift
//  RealmMBPlatform
//
//  Created by admin on 27.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//
import RealmSwift
import UIKit
import SCLAlertView

class RoomsViewController: UIViewController {
    
    var navigation: RoomsWireframe?
    
    @IBOutlet var tableView: UITableView!
    var presenter: RoomsPresenter?
    var text = "test"
    var userName:String?
    var password:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView(tableView:tableView)
        self.setupUI()
        self.presenter?.syncData(userName: userName!, password: password!, tableView: tableView)
        print(Realm.Configuration.defaultConfiguration.fileURL)
        // Do any additional setup after loading the view.
    }
}

extension RoomsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomsCell") as! RoomsCell
        self.presenter?.setupCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.presenter?.numberOfItem())!
    }
}

extension RoomsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! RoomsCell
        self.presenter?.access(indexPath: indexPath as NSIndexPath, firstAction: {
            let alert = SCLAlertView()
            let textField = alert.addTextField("Enter password")
            alert.addButton("Enter", action: {
                self.presenter?.checkPassword(password: textField.text!, indexPath: indexPath as NSIndexPath, action: {
                    self.navigation?.showMainView(userName: self.userName!, password: self.password!, idRoom: cell.id)
                })
            })
            alert.showSuccess("Private Room", subTitle: "This room is private. If you want connect to this room,you must enter password")
            }, secondAction: {
                self.navigation?.showMainView(userName: userName!, password: password!, idRoom: cell.id)
        })
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension RoomsViewController {
    func setupTableView(tableView:UITableView) {
        tableView.register(UINib(nibName:"RoomsCell",bundle:nil), forCellReuseIdentifier: "RoomsCell")
    }
    
    func setupUI() {
        title = "Rooms"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Log out", style: .bordered, target: self, action: #selector(back))
    }
    
    func add(){
        self.navigation?.showCreateView(userName: userName!, password: password!)
    }
    
    func back(){
        self.navigation?.popView(viewController: self)
    }
}
