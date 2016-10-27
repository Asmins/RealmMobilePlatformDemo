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
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL)
        self.setupTableView(tableView:tableView)
        title = "Rooms"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        // Do any additional setup after loading the view.
    }
    
    func add(){
        self.navigation?.showCreateView()
    }
}

extension RoomsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomsCell") as! RoomsCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
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
