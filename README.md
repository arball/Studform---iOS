# Studform Ceiling Calculator in iOS

Description

Studform Ceiling Calculator is an app that allows user to select a wide range of ceiling products, given the user's ceiling area and product of their choosing, this calculator outputs all the neccessary components the user needs to get the job done.

Structure

Since each result the app products depend of the product that proceeds and the data is managed hierarchically, the way user's navigate around the menu is using a tree structure. Each screen the user sees represents each node on the tree and screens are managed by four view controllers.

To understand more about the structure, we can seperate the tree menu into three layers, the menu layer, sub-menu layers, input layer, and the output layer. The menu layer displays all the feature product line provided by Studform, these nodes are a immediate descendant from the very top node of the tree.

Next is the sub-menu layer, this layer covers all the node between the menu and the input layer because some product lines can go several layers deep. The SubMenuViewController cycles down this tree structure until there are no child left, when there are no child it means that there are no more options the user can choose from, that mean the app has all the information it needs for the input layer.




In order to make the code maintainable and scalable as far as adding in new products





