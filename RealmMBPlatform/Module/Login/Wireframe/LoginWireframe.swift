//
//  LoginWireframe.swift
//  RealmMBPlatform
//
//  Created by admin on 24.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class LoginWireframe {
    var loginViewController:LoginViewController?
    var window:UIWindow?
}

extension LoginWireframe: LoginWireframeProtocol {
    
    func showLoginView() {
        let loginViewController = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.loginViewController = loginViewController
        self.loginViewController?.presenter = LoginPresenter()
        self.loginViewController?.presenter?.interactor = LoginInteractor()
        self.loginViewController?.navigation = self
        let nav = UINavigationController(rootViewController: loginViewController)
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
    }
    
    func showMainView(userName:String,password:String) {
       	/*
			If you want to see mainView with message uncomment fistr part code 
			if you want to see rooms and createRoom views uncoment second part
		*/
        /*
         let mainViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
         mainViewController.userName = userName
         mainViewController.password = password
         mainViewController.presenter = MainPresenter()
         mainViewController.presenter?.interactor = MainInteractor()
         loginViewController?.navigationController?.pushViewController(mainViewController, animated: true)
         */
        
        let roomsViewController = UIStoryboard(name: "Rooms", bundle: nil).instantiateViewController(withIdentifier: "RoomsViewController") as! RoomsViewController
        roomsViewController.navigation = RoomsWireframe()
        roomsViewController.navigation?.roomViewController = roomsViewController
        roomsViewController.presenter = RoomsPresenter()
        roomsViewController.presenter?.interactor = RoomsInteractor()
        roomsViewController.userName = userName
        roomsViewController.password = password
        loginViewController?.navigationController?.pushViewController(roomsViewController, animated: true)
        
    }
    
    func showRegistrView() {
        let registerView = UIStoryboard(name: "Registration", bundle: nil).instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
        registerView.presenter = RegistrationPresenter()
        registerView.presenter?.interactor = RegistrationInteractor()
        registerView.navigation = RegistrationWireframe()
        registerView.navigation?.registerView = registerView
        loginViewController?.navigationController?.pushViewController(registerView, animated: true)
    }
}
