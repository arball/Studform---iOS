//
//  DataTableViewCell.swift
//  Studform
//
//  Created by iOS development on 22/9/2017.
//  Copyright © 2017 iOS development. All rights reserved.
//

import UIKit

class DataTableViewCell: UITableViewCell {

    var data: CellData? // For future refactoring, not being used
    weak var delegate: DataCellDelegate?

}



