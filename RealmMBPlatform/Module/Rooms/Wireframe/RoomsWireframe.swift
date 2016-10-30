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
        createViewController.presenter = CreateRoomPresenter()
        createViewController.presenter?.interactor = CreateRoomInteractor()
        createViewController.userName = userName
        createViewController.password = password
        roomViewController?.navigationController?.pushViewController(createViewController, animated: true)
    }
}
