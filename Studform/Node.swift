//
//  Node.swift
//  Studform
//
//  Created by iOS development on 24/8/2017.
//  Copyright © 2017 iOS development. All rights reserved.
//

import Foundation

// THe data structure of the menu, DO NOT CHANGE THE CODE

class Node {
    
    let value: Modules
    
    var parentNode: Node?
    var childenNode = [Node]()
    
    var childCount: Int {
        return childenNode.count
    }
    
    func appendNode(node: Node) {
        childenNode.append(node)
        node.parentNode = self
    }
    
    func isLeaveNode() -> Bool {
        return childenNode.isEmpty
    }
    
    lazy var ceilingSelected: Modules = {
        let module: Modules
        let path = self.getPath()
        module = path[path.count - 2].value
        return module
    
    }()
    
    lazy var moduleSelected: [Modules] = {
        var modules = [Modules]()
        let path = self.getPath()
        
        for i in 0..<path.count - 2{
            modules.append(path[i].value)
        }
        return modules
    }()
    
    func getPath() -> [Node] {
        if self.parentNode == nil {
            return [self]
        } else {
            return [self] + self.parentNode!.getPath()
        }
    }
    
    init(module: Modules) {
        self.value = module
    }              
}
