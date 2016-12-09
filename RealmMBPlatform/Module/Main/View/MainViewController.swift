
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
    @IBOutlet var activityIndicatorView: UIView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var presenter: MainPresenter?
    
    var userName: String?
    var password: String?
    var idRoom: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setuplongTap()
        self.setupTableView(tableView: tableView)
        self.presenter?.setupViewController(viewController: self)
        self.presenter?.syncData(userName: userName!, password: password!, tableView: tableView,id: idRoom!,indicator: activityIndicator,view:activityIndicatorView,navItem: navigationItem)
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //
        }
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MainViewController:UIGestureRecognizerDelegate {
    
    func setupTableView(tableView:UITableView) {
        tableView.register(UINib(nibName: "MessageCell", bundle: nil) , forCellReuseIdentifier: "MessageCell")
        tableView.estimatedRowHeight = CGFloat(80)
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
//    func setuplongTap() {
//        let longPressGesture:UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
//        longPressGesture.minimumPressDuration = 0.5
//        longPressGesture.delegate = self
//        self.tableView.addGestureRecognizer(longPressGesture)
//    }
//    
//    func longPress(_ longPressGestureRecognizer: UILongPressGestureRecognizer) {
//        
//        if longPressGestureRecognizer.state == UIGestureRecognizerState.began {
//            
//            let touchPoint = longPressGestureRecognizer.location(in: self.view)
//            print("Long")
//            
//        }
//    }
}

