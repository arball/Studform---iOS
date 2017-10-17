//
//  UserInputViewController.swift
//  Studform
//
//  Created by iOS development on 10/8/2017.
//  Copyright © 2017 iOS development. All rights reserved.
//

import UIKit


class UserInputViewController: UIViewController{
    
    var node: Node?
    var userInputDict = [String: Any]()
    
    @IBOutlet weak var tableViewBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var tableView: UITableView!
    
    func showAlertController(warningMessage: String, title: String = "Warning") {
        
        let alc = UIAlertController(title: title, message: warningMessage, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Okay", style: .cancel) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        
        alc.addAction(cancelAction)
        self.present(alc, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let numericXib = UINib(nibName: "NumericInputTableViewCell", bundle: nil)
        let booleanXib = UINib(nibName: "BooleanInputTableViewCell", bundle: nil)
        self.navigationItem.title = node?.value.titleString
        
        tableView.register(numericXib, forCellReuseIdentifier: "numericCell")
        tableView.register(booleanXib, forCellReuseIdentifier: "booleanCell")
        
        NotificationCenter.default.addObserver(self, selector: #selector(UserInputViewController.keyboardWillShow(_:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(UserInputViewController.keyboardWillHide(_:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(UserInputViewController.doneButtonTapped))
    }
    
    func keyboardWillShow(_ notification: Notification){
        if let info = notification.userInfo, let keyboardFrame = info[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let frame = keyboardFrame.cgRectValue
            tableViewBottomConstraint.constant = frame.size.height - 83
            UIView.animate(withDuration: 0.8) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    func doneButtonTapped() {
        
        guard let node = node else {
            return
        }
        
        let calculationDataPoint = CalculatorDataPoint.map(userInputDict)
//        print("\n***Parent Node***")
//        print(node.ceilingSelected)
//        print("\n***Child Node***")
//        print(node.moduleSelected)
//        print("\n***User input***")
//        print(userInputDict)
//        print("\n")
        
        let result: Result
        
        do {
            result = try Calculator.getResult(calculationDataPoint: calculationDataPoint, ceilingType: node.ceilingSelected, moduleType: node.moduleSelected)
            
            let rawViewModel = ResultTableCellData.getTableCellData(result: result)
            
            let realViewModel = rawViewModel.filter({ (data) -> Bool in
                data.value != nil
            })
            
            //let roundedViewModel = realViewModel.map{$0.value.map{$0.rounded(FloatingPointRoundingRule.down)}}
            
            let resultViewController = self.storyboard!.instantiateViewController(withIdentifier: "resultView") as! ResultViewController
            
            resultViewController.resultCell = realViewModel
            resultViewController.node = node
            //let subMenuViewController = SubMenuViewController(node: selectedNode)
            self.navigationController?.pushViewController(resultViewController, animated: true)
            
            // MARK: - Error handling code
            
        } catch InputError.incompleteArgument {
            
            showAlertController(warningMessage: "Please complete the required fields", title: "Warning")
            
        } catch InputError.lengthDropOutOfBound {
            
            showAlertController(warningMessage: "Length Drop must be between 0.1 and 10", title: "Warning")
            
        } catch InputError.spline_option {
            
            showAlertController(warningMessage: "Please select YES to C Spline", title: "Warning")
            
        } catch InputError._1200X400_AND_1200X300_selected {
            
            showAlertController(warningMessage: "1200 X 400 and 1200 X 300 cannot be co-selected", title: "Warning")
            
        } catch InputError._1500X500_AND_1500X300_selected {
            
            showAlertController(warningMessage: "1500 X 500 and 1500 X 300 cannot be co-selected", title: "Warning")
            
        } catch {
            
            showAlertController(warningMessage: "Unknown error", title: "Error")
        }  
    }
    
    func keyboardWillHide(_ notification: Notification){
        tableViewBottomConstraint.constant = 0
        
        UIView.animate(withDuration: 0.8) {
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.view.endEditing(true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension UserInputViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let node = node else {
            return 0
        }
        
        return TableViewCells.getTableViewCell(ceilingType: node.ceilingSelected, moduleType: node.moduleSelected).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let node = node else {
            return UITableViewCell()
        }
        
        let cellArray = TableViewCells.getTableViewCell(ceilingType: node.ceilingSelected, moduleType: node.moduleSelected)
        
        switch cellArray[indexPath.row].cellType {
            
        case .numericInput :
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "numericCell", for: indexPath) as! NumericInputTableViewCell
            cell.title.text = cellArray[indexPath.row].title
            cell.delegate = self
            return cell
            
        case .booleanInput :
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "booleanCell", for: indexPath) as! BooleanInputTableViewCell
            cell.title.text = cellArray[indexPath.row].title
            cell.delegate = self
            userInputDict[cell.title.text!] = cell.value.isOn
            return cell
        }
    }
}

// MARK: - UITableViewDelegate

extension UserInputViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //TODO: - Need to find another elegant way to implement this, autoresizing cells
        return 68
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        tableView.deselectRow(at: indexPath, animated: true)
//        if let selectedCell = tableView.cellForRow(at: indexPath) as? NumericInputTableViewCell {
//            selectedCell.value.becomeFirstResponder()
//        }
//    }
}

extension UserInputViewController: DataCellDelegate {
    
    // TODO: - Implement a switch statement
    
    func didChangeCellData(cell: DataTableViewCell) {
        
        if let cell = cell as? NumericInputTableViewCell {
            userInputDict[cell.title.text!] = cell.value.text!
        }
        
        if let cell = cell as? BooleanInputTableViewCell {
            //print("boolean cell called")
            userInputDict[cell.title.text!] = cell.value.isOn
        }
    }
}














