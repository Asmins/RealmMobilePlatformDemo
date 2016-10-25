//
//  MainViewController.swift
//  RealmMBPlatform
//
//  Created by admin on 24.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var presenter:MainPresenter?
    var userName:String?
    var password:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: Selector("add"))
        self.presenter?.syncData(userName: userName!, password: password!, tableView: tableView)
        title = "My task"
    }
    
    func add() {
        self.presenter?.addItem(viewController: self)
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
