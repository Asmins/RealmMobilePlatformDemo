
//  MainViewController.swift
//  RealmMBPlatform
//
//  Created by admin on 24.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var tableView: UITableView!
    var presenter:MainPresenter?
    var userName:String?
    var password:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.syncData(userName: userName!, password: password!, tableView: tableView)
        title = "My task"
    }
    
    @IBAction func sendMessageButton(_ sender: AnyObject) {
        self.presenter?.addItem(text: textField.text!)
        textField.text = ""
    }
}
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell
        self.presenter?.setupCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.presenter?.numberOfItem())!
    }
}
