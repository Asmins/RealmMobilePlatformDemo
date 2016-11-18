
//  MainViewController.swift
//  RealmMBPlatform
//
//  Created by admin on 24.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class MainViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var tableView: UITableView!
    
    var presenter: MainPresenter?
    
    var userName: String?
    var password: String?
    var idRoom: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView(tableView: tableView)
        self.presenter?.syncData(userName: userName!, password: password!, tableView: tableView,id: idRoom!)
        self.presenter?.setupNavController(navigationController: navigationController!)
        self.presenter?.some(textField: textField)
        title = "Messages"
    }
    
    @IBAction func sendMessageButton(_ sender: AnyObject) {
        if !(textField.text?.isEmpty)! {
            self.presenter?.addItem(text: textField.text!)
            textField.text = ""
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell") as! MessageTableViewCell
        self.presenter?.setupCell(cell: cell, indexPath: indexPath as NSIndexPath, userName: userName!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.presenter?.numberOfItem())!
    }
}

extension MainViewController {
    func setupTableView(tableView:UITableView) {
        tableView.register(UINib(nibName: "MessageCell", bundle: nil) , forCellReuseIdentifier: "MessageCell")
        tableView.estimatedRowHeight = CGFloat(60)
        tableView.rowHeight = UITableViewAutomaticDimension
    }
}
