//
//  MasterViewController.swift
//  Studform
//
//  Created by iOS development on 15/8/2017.
//  Copyright © 2017 iOS development. All rights reserved.
//

import Foundation
import UIKit

class MasterViewController: UITableViewController {
    
    let node = MenuStructure.mainMenu.childenNode
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = MenuStructure.mainMenu.value
        navigationItem.titleView = UIImageView(image: Views.navigationBarLogo)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 150)
        
        let mainController = MainActivityViewController()
        
        navigationController?.pushViewController(mainController, animated: true)
    }
    
    
    
    
}
