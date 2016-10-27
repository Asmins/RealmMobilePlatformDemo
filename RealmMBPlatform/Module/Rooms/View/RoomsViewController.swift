//
//  RoomsViewController.swift
//  RealmMBPlatform
//
//  Created by admin on 27.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class RoomsViewController: UIViewController {

    var navigation: RoomsWireframe?

    @IBOutlet var tableView: UITableView!
    var presenter: RoomsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView(tableView:tableView)
        // Do any additional setup after loading the view.
    }
}

extension RoomsViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomsCell") as! RoomsCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}

extension RoomsViewController {
    func setupTableView(tableView:UITableView) {
        tableView.register(UINib(nibName:"RoomsCell",bundle:nil), forCellReuseIdentifier: "RoomsCell")
    }
}
