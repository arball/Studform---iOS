//
//  NumericInputTableViewCell.swift
//  Studform
//
//  Created by iOS development on 25/8/2017.
//  Copyright © 2017 iOS development. All rights reserved.
//

import UIKit

class NumericInputTableViewCell: DataTableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var value: UITextField!
    
    override func awakeFromNib() {
        value.addTarget(self, action: #selector(NumericInputTableViewCell.textDidChange(_:)), for: .editingChanged)
    }
    
    func textDidChange(_ textField: UITextField){

        delegate?.didChangeCellData(cell: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.value.becomeFirstResponder()
    }
}

