# KTLoadingLabel
[![Version](https://img.shields.io/cocoapods/v/KTLoadingLabel.svg?style=flat)](http://cocoapods.org/pods/KTLoadingLabel)
[![License](https://img.shields.io/cocoapods/l/KTLoadingLabel.svg?style=flat)](http://cocoapods.org/pods/KTLoadingLabel)
[![Platform](https://img.shields.io/cocoapods/p/KTLoadingLabel.svg?style=flat)](http://cocoapods.org/pods/KTLoadingLabel)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 8.0+ / macOS 10.10+ / tvOS 9.0+ / watchOS 2.0+
- Xcode 8.3+
- Swift 3.1+

## Installation

KTLoadingLabel is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'KTLoadingLabel'
```

## Usage

### Programmatically
```Swift
import KTLoadingLabel

let label = KTLoadingLabel.init(staticString: "Loading", animateString: "...")
// Start Animation of KTLoadingLabel
label.animate()

// Constraints to view /* Can also use frame/storyboard/xib to config */
label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
label.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 16).isActive = true
label.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: 8).isActive = true

// End Animation of KTLoadKTLoadingLabel
label.stopAnimate()
```
### Storyboard / xib files

1. Simply drags UILabel into UIView.
2. Go to Identity Inspector, change the class to KTLoadingLabel.
3. You can customize some params in Attributes Inspector.
#### timerInterval
Defines the speed of animation (per sec)
```
@IBInspectable var timerInterval: Double = 0.25
```
#### repeats
Defines loops of animation. If repeats == false, animation will stop automatically after it go throughs 1 animation cycle, else will loop until stopAnimate() called.
```
@IBInspectable var repeats: Bool = true
```
#### autoAnimated
If it set to true, will call animate() in awakeFormNib automatically.
```
@IBInspectable var autoAnimated: Bool = false // Use when create by IB/Storyboard, to define needs animate by default
```
#### staticText
Text of label which will always shown.
```
@IBInspectable var staticText: String = ""
```
#### animateText
Text of label will do animation.
```
@IBInspectable var animateText: String = ""

```
4. Setup autoResizing / autoConstraints.



## Author

Koki Tang

## License

KTLoadingLabel is available under the MIT license. See the LICENSE file for more info.
