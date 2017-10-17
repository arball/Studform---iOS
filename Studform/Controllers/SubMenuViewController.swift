//
//  SubMenuViewController.swift
//  Studform
//
//  Created by iOS development on 10/8/2017.
//  Copyright © 2017 iOS development. All rights reserved.
//

import UIKit


class SubMenuViewController: UIViewController {
    
    //MARK: - Properties and outlets
    
    var node: Node?
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - View controller methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = node?.value.titleString
        
        let nib = UINib(nibName: "SubMenuTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "SubMenuCell") 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "userInput" {
            let vc = segue.destination as! UserInputViewController
            let indexPath = sender as! IndexPath
            vc.node = node?.childenNode[indexPath.row]
        }
    }
}

//MARK: UITableViewDataSource methods

extension SubMenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return node!.childCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubMenuCell", for: indexPath) as! SubMenuTableViewCell
        let desciptionModule = node?.childenNode[indexPath.row].value
        
        let description = Modules.description(module: desciptionModule!)
        
        cell.title.text = description.main
        cell.subtitle.text = description.sub

        return cell
    }
}

//MARK: - UITableViewDelegate methods

extension SubMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let selectedNode = node?.childenNode[indexPath.row] else {
            return
        }
        
        if selectedNode.isLeaveNode() {
            performSegue(withIdentifier: "userInput", sender: indexPath)
        } else {
            let subMenuViewController = self.storyboard!.instantiateViewController(withIdentifier: "subMenu") as! SubMenuViewController
            subMenuViewController.node = selectedNode
            //let subMenuViewController = SubMenuViewController(node: selectedNode)
            self.navigationController?.pushViewController(subMenuViewController, animated: true)
        }
    }
}












