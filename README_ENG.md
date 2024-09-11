# ItemScrollView

## Overview

ItemScrollView is a customizable horizontal scroll component for iOS applications, built with Swift and UIKit(SnapKit). It provides an easy-to-use interface for creating scrollable, selectable items with smooth animations and delegation support.

<img src="https://github.com/wlxo0401/ItemHorizontalScroll/blob/main/SimulatorScreenRecording.gif" width="300" alt="ItemScrollView Demo">

## Key Features

- Horizontal scrolling with customizable items
- Smooth underline animation for selected items
- Easy integration with existing UIKit projects
- Flexible item management through ItemStackView
- Delegate pattern for handling item selection

## Requirements

- iOS 11.0+
- Swift 5.0+
- Xcode 12.0+
- [SnapKit](https://github.com/SnapKit/SnapKit) for auto layout

## Installation

To use ItemScrollView in your project, simply copy the following files into your Xcode project:

- `ItemScrollView.swift`
- `ItemStackView.swift`
- `ItemView.swift`

Make sure you have SnapKit installed in your project. You can install it via CocoaPods, Carthage, or Swift Package Manager.

## Usage

Here's a simple example of how to use ItemScrollView:

```swift
let scrollView = ItemScrollView(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
scrollView.setData(itemStrings: ["Item 1", "Item 2", "Item 3"], preSelectIndex: 0)
scrollView.itemScrollViewDelegate = self
view.addSubview(scrollView)
```

Implement the `ItemScrollViewDelegate` to handle item selection:

```swift
extension YourViewController: ItemScrollViewDelegate {
    func didSelectItem(at index: Int) {
        print("Selected item index: \(index)")
    }
}
```

## Customization

You can customize the appearance and behavior of ItemScrollView by modifying the properties in each of the component classes:

- `ItemScrollView`: Customize scroll view properties
- `ItemStackView`: Adjust stack view layout and underline appearance
- `ItemView`: Modify individual item appearance

## Code Explanation

The ItemScrollView component consists of three main parts:

1. **ItemScrollView**: The main container that manages horizontal scrolling and delegates item selection events.
2. **ItemStackView**: A custom UIStackView that arranges the individual items and manages the underline indicator for the selected item.
3. **ItemView**: Represents an individual item in the scroll view, containing a label for the item text and a button for user interaction.

These components work together to create a smooth, interactive horizontal scrolling experience with visual feedback for item selection.

## Contributing

We welcome contributions to improve ItemScrollView! This code is just one of many possible implementations, and we encourage you to use it as a reference or starting point for your own projects.

If you'd like to contribute, please feel free to submit a pull request or open an issue to discuss potential improvements or bug fixes. We appreciate any feedback or suggestions to make this component better.

---

We hope you find ItemScrollView useful in your projects! If you have any questions or need further assistance, please don't hesitate to open an issue or reach out to the maintainers.
