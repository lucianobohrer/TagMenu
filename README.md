# TagMenu

[![Build Status](https://travis-ci.com/lucianobohrer/TagMenu.svg?token=qq5fjiKDEp43N6JsJhQv&branch=main)](https://travis-ci.com/lucianobohrer/TagMenu)
[![Version](https://img.shields.io/cocoapods/v/TagMenu.svg?style=flat)](https://cocoapods.org/pods/TagMenu)
[![License](https://img.shields.io/cocoapods/l/TagMenu.svg?style=flat)](https://cocoapods.org/pods/TagMenu)
[![Platform](https://img.shields.io/cocoapods/p/TagMenu.svg?style=flat)](https://cocoapods.org/pods/TagMenu)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage

### Generic Elements
ViewModel generic type needs to conform to `Displayable` protocol that is responsible to represent the string shown in the tag view.

### Single Selection
<img src=Docs/single.gif width=200 align="right" />

```swift
let viewModel = TagMenuViewModel<String>(items: [
    SelectableListItem(value: "Item 1", selected: true),
    SelectableListItem(value: "Item 2"),
    SelectableListItem(value: "Item 3"),
    SelectableListItem(value: "Item 4")
],
title: "",
selection: .single)

let view = TagMenuView<String>(viewModel: viewModel)
```
### Multiple Selection
<img src=Docs/multiple.gif width=200 align="right" />

```swift
let viewModel = TagMenuViewModel<String>(items: [
    SelectableListItem(value: "Item 1"),
    SelectableListItem(value: "Item 2"),
    SelectableListItem(value: "Item 3"),
    SelectableListItem(value: "Item 4")
],
title: "Select until 3 items",
selection: .multiple(max: 3))

let view = TagMenuView<String>(viewModel: viewModel)
```

### Handling Selection Event

Subscribe the `selectedItemsSubject` to get the current selected values when a new item is selected/deselected.

```swift
var cancellable: Cancellable?

cancellable = viewModel.selectedItemsSubject.sink { (values) in
    print(values)
}
```

### Customizing the view

Set `TagMenuSettings` custom parameters

```swift
let view = TagMenu<String>(viewModel: vm,
                           tagSettings: TagMenuSettings(highlightColor: .systemRed,
                                                        regularColor: .gray,
                                                        backgroundColor: .white,
                                                        cornerRadius: 8,
                                                        borderSize: 1))
```

## Package 

### For Xcode Projects

File > Swift Packages > Add Package Dependency: https://github.com/lucianobohrer/TagMenu

### For Swift Packages

Add a dependency in your your `Package.swift`

```swift
.package(url: "https://github.com/lucianobohrer/TagMenu.git", from: "1.0.0"),
```

## CocoaPods 

TagMenu is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TagMenu'
```

## Authors

- [lucianobohrer](https://github.com/lucianobohrer)
- [gabrielsilveiraa](https://github.com/gabrielsilveiraa)

## License

TagMenu is available under the MIT license. See the LICENSE file for more info.
