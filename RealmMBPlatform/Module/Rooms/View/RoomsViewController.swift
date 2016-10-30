//
//  RoomsViewController.swift
//  RealmMBPlatform
//
//  Created by admin on 27.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//
import RealmSwift
import UIKit

class RoomsViewController: UIViewController {

    var navigation: RoomsWireframe?

    @IBOutlet var tableView: UITableView!
    var presenter: RoomsPresenter?
    var text = "test"
    var userName:String?
    var password:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL)
        self.setupTableView(tableView:tableView)
        title = "Rooms"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        self.presenter?.syncData(userName: userName!, password: password!, tableView: tableView)
        // Do any additional setup after loading the view.
    }
    
    func add(){
        self.navigation?.showCreateView(userName: userName!, password: password!)
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
        return CGFloat(200)
    }
}

extension RoomsViewController {
    func setupTableView(tableView:UITableView) {
        tableView.register(UINib(nibName:"RoomsCell",bundle:nil), forCellReuseIdentifier: "RoomsCell")
    }
}
