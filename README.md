# Studform Ceiling Calculator in iOS

## Description

Studform Ceiling Calculator is an app that allows user to select a wide range of ceiling products, given the user's ceiling area and product of their choosing, this calculator outputs all the neccessary components the user needs to get the job done.

## Structure

Since each result the app products depend of the product that proceeds and the data is managed hierarchically, the way user's navigate around the menu is using a tree structure. Each screen the user sees represents each node on the tree and screens are managed by four view controllers.

To understand more about the structure, we can seperate the tree menu into three layers, the menu layer, sub-menu layers, input layer, and the output layer. The menu layer displays all the feature product line provided by Studform, these nodes are a immediate descendant from the very top node of the tree.

Next is the sub-menu layer, this layer covers all the node between the menu and the input layer because some product lines can go several layers deep. The SubMenuViewController cycles down this tree structure until there are no child left, when there are no child it means that there are no more options the user can choose from, that mean the app has all the information it needs for the input layer. 

For example:

```
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

```

The input layer changes depending on what the user has choosen to get to the input layer. The input layer has two different `UITableViewCell`, one has an `UITextField` and the other `UISwitch`. The know the input layer know what to display is by using a switch statment to switch on the ceiling type and module type the user has choosen. For example:

```
switch (ceilingType) {
            
        case .KWIKLOC_REGAL :
            
            if moduleType == [._1200X600_REGULAR_H_PATTERN_REGAL] || moduleType == [._600X600_REGAL] || moduleType == [._600X600_HEAVY_DUTY_REGAL] {
                
                cells =
                    [
                        (InputTitle.area, .numericInput),
                        (InputTitle._1200X300_t_bar_troffer, .booleanInput),
                        (InputTitle.largeOpenArea, .booleanInput),
                        (InputTitle._600X600_air_cond_register, .booleanInput),
                        (InputTitle.lengthDrop, .numericInput),
                        (InputTitle.spareTile, .numericInput)
                        
                ]
```
The way user's input are captured is using the `UITextFieldDelegate` and `UISwitch`'s `isOn` property is set to true. Whenever the user types in the text field, the delegate listens records it in a `[String: Any]` dictionary. This raw data will be passed into `CalculationDataPoint` which is a struct with all possible inputs as it's properties (these properties are optionals). This `CalculationDataPoint` struct will then be passed into the concrete types where all the actual calcuations will happen. Once the outputs are ready, the dictionary will then passed into the output layer and populates the `UITableView`

# Error throwing

Errors are thrown inside of the concrete types during the calculation and the `UserInputViewController` catches those errors and handles them using `UIAlertController`






