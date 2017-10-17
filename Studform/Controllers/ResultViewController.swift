//
//  ResultViewController.swift
//  Studform
//
//  Created by iOS development on 10/8/2017.
//  Copyright © 2017 iOS development. All rights reserved.
//

import UIKit
import MessageUI

// TODO: - UITableViewDelegate not called, deselectrow not working


class ResultViewController: UIViewController {
    
    // Properties
    
    var resultCell = [ResultCellData]()
    var node: Node?
    @IBOutlet weak var tableView: UITableView!
    
    // View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ResultTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "resultCell")
        self.navigationItem.title = "Result"
    }
    
    // Email button function

    @IBAction func submitButtomPressed(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
            let mailComposeViewController = MFMailComposeViewController()
            mailComposeViewController.mailComposeDelegate = self
            mailComposeViewController.setToRecipients(["david@studform.co.au"])
            mailComposeViewController.setSubject("New enquiry from iOS App")
            mailComposeViewController.setMessageBody(emailString(), isHTML: true)
            present(mailComposeViewController, animated: true, completion: nil)
        } else {
            let alrt = UIAlertController(title: "Warning", message: "Cannot detect an active email account", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Okay", style: .cancel) { (action) in
                self.dismiss(animated: true, completion: nil)
            }
            alrt.addAction(cancelAction)
            present(alrt, animated: true, completion: nil)
        }
    }
}

// MARK: - UITableViewDataSource

extension ResultViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("from numberOfrow")
        print(resultCell.count)
        return resultCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as! ResultTableViewCell
        
        let cellData = resultCell[indexPath.row]
        
        if let value = cellData.value {
            cell.title?.text = cellData.title
            cell.value?.text = "\(value)"
        }
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ResultTableViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print("hello")
        return 68
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("hello from didselect")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - MFMailComposeViewControllerDelegate

extension ResultViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
            
        case .cancelled, .sent, .saved, .failed :
            self.dismiss(animated: true, completion: nil)
            
            
        }
    }
}

// Email string composition

extension ResultViewController {
    
    func emailString() -> String {
        
        guard let node = node else {
            return ""
        }
        
        var string = ""
    
        let selectedCeiling = "Ceiling Selected: " + node.ceilingSelected.titleString
        
        var selectedModules: String = "Modules Selected: "
        
        for module in node.moduleSelected {
            selectedModules += module.titleString + ", "
        }
        
        let emailTitle = selectedCeiling + "\n\n" + selectedModules + "\n"
        
        for cell in resultCell {
            if let value = cell.value {
                string += "\(cell.title), \(value)\n"
            }
        }
        
        let disclaimer =
            
    """
        Disclaimer: Quantities displayed form an approximate guide and are based upon a square area without deviations.
        Additional product may be required to account for layout, light fixings, air conditioning registers and general construction wastage.
        Please note that is also BCC'd to info@studform.com.au
    """
        
        return emailTitle + "\n" + string + "\n" + disclaimer
        
    }
    
}









