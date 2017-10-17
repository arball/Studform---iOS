//
//  BooleanInputTableViewCell.swift
//  Studform
//
//  Created by iOS development on 25/8/2017.
//  Copyright © 2017 iOS development. All rights reserved.
//

import UIKit

class BooleanInputTableViewCell: DataTableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var value: UISwitch!
    
    override func awakeFromNib() {
        value.addTarget(self, action: #selector(BooleanInputTableViewCell.textDidChange(_:)), for: .valueChanged)
        value.isOn = true
    }
    
    func textDidChange(_ switch: UISwitch){
        data?.value = value.isOn
        delegate?.didChangeCellData(cell: self)
    }
}
