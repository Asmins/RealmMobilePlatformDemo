
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
    
    var presenter:MainPresenter?
    var userName:String?
    var password:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView(tableView: tableView)
        self.presenter?.syncData(userName: userName!, password: password!, tableView: tableView)
        self.presenter?.some(textField: textField)
        title = "My message"
    }
    
    @IBAction func sendMessageButton(_ sender: AnyObject) {
        self.presenter?.clean(textField: textField)
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

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
}

extension MainViewController {
    func setupTableView(tableView:UITableView) {
        tableView.register(UINib(nibName: "MessageCell", bundle: nil) , forCellReuseIdentifier: "MessageCell")
    }
}
