# RecipeApp - iOS - (MVVM + swiftUI + RXSwift + combine)

### Description
*RecipeApp* is an iOS application built to displays list of Recipes from the Contentful api , and allow the user to show the details of Recipe  .

### Run Requirements

* Xcode 12.4
* Swift 5


### Notes 
* for Network layer using `Rxswift` and `Contentful`.
* for UI Views using `swift ui` .
* for view binding using `Combine` .

### High Level Layers
* `View` -  is SwiftUI classess is a user interface toolkit that lets us design apps in a declarative way and displays data passed by the `viewModels`
    * Usually the view is passive  - it shouldn't contain any complex logic and that's why most of the times we don't need write Unit Tests for it
* `viewModel` - contains the presentation logic and tells the `View` what to present
    * Usually we have one `viewModel` per scene (view )
    * it 's using for binding the data you want to view using combine framework .
    * It should be covered by Unit Tests .
* `Service` - contains actual implementation of the protocols defined in the `RecipeServiceProtocol` layer .
    * it's should be abstracted so that we can change it to any service layer (Api-Database- .... ).
    * it's using for fetching data from Contentful Api using their SDK and then notify the view model using RXSwift .
    * It should be covered by Unit Tests . 
* `Model` - plain `Swift` classes / structs
    * Models objects used by your application such as `Recipe`, etc
    
#### Unit Tests
* unit test for viewModel 
