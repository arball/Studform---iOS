//
//  ViewController.swift
//  Studform
//
//  Created by iOS development on 9/8/2017.
//  Copyright © 2017 iOS development. All rights reserved.
//

import UIKit

class MainActivityViewController: UIViewController {
    
    //MARK: - Properties and outlets
    
    let menu = MenuStructure.structure.childenNode
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - View controller methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = Bundle(for: SubMenuTableViewCell.self)
        let nib = UINib(nibName: "SubMenuTableViewCell", bundle: bundle)
        self.tableView.register(nib, forCellReuseIdentifier: "menuCellXib")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "subMenu" {
            let indexPath = sender as! IndexPath
            let vc = segue.destination as! SubMenuViewController
            vc.node = menu[indexPath.row]
        }
    }
}

//MARK: - UITableViewDataSource methods

extension MainActivityViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let description = Modules.description(module: menu[indexPath.row].value)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCellXib", for: indexPath) as! SubMenuTableViewCell
        cell.title.text = description.main
        cell.subtitle.text = description.sub
        return cell
    }
}

//MARK: - UITableViewDelegate methods

extension MainActivityViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "subMenu", sender: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
}















