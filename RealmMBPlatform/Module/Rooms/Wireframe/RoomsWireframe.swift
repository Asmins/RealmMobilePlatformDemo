//
//  RoomsWireframe.swift
//  RealmMBPlatform
//
//  Created by admin on 27.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class RoomsWireframe {
    var roomViewController:RoomsViewController?
}

extension RoomsWireframe: RoomsWireframeProtocol {
    func showCreateView(userName:String,password:String) {
        let createViewController = UIStoryboard(name: "Create", bundle: nil).instantiateViewController(withIdentifier: "CreateViewController") as! CreateViewController
        createViewController.navigation = CreateRoomWireframe()
        createViewController.presenter = CreateRoomPresenter()
        createViewController.presenter?.interactor = CreateRoomInteractor()
        createViewController.userName = userName
        createViewController.password = password
        roomViewController?.navigationController?.pushViewController(createViewController, animated: true)
    }
    
    func showMainView(userName: String, password: String, idRoom: Int) {
        let mainViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        mainViewController.userName = userName
        mainViewController.password = password
        mainViewController.idRoom = idRoom
        mainViewController.presenter = MainPresenter()
        mainViewController.presenter?.interactor = MainInteractor()
        roomViewController?.navigationController?.pushViewController(mainViewController, animated: true)
    }
    
    func popView(viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
}
