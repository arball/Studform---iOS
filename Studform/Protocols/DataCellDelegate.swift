//
//  DataCellDelegate.swift
//  Studform
//
//  Created by iOS development on 21/9/2017.
//  Copyright © 2017 iOS development. All rights reserved.
//

import Foundation
import UIKit

protocol DataCellDelegate: class {
    func didChangeCellData(cell: DataTableViewCell)
}
