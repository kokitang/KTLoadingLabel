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

## Preview

- **Stroke:**

![Gif](Resources/animateLabel.gif)

## Usage

### Programmatically
```Swift
import KTLoadingLabel

let label = KTLoadingLabel.init(staticString: "Loading", animateString: "...")
// Start Animation of KTLoadingLabel
label.animate()

// Layout by setting constraints to view
/* Can also use frame/storyboard/xib to config */
label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
label.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 16).isActive = true
label.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: 8).isActive = true

// Layout by setting frame directly (Alternative)
label.frame = CGRect(x: 100, y: 100, width: 100, height: 100)

// You can also set the params of UILabel as normal
label.font = UIFont.systemFont(ofSize: 16)
label.textColor = .yellow


// End Animation of KTLoadKTLoadingLabel
label.stopAnimate()
```
### Storyboard / xib files

1. Simply drags UILabel into UIView.
2. Go to Identity Inspector, change the class to KTLoadingLabel.
3. Customize some params (e.g. staticText, animateText, repeats, etc...) in Attributes Inspector.
4. Setup autoResizing / autoConstraints.

## Parameters

<!--- **MarkType:** The possible shapes of the mark.-->
<!--- `checkmark` — The mark is a standard checkmark.-->
<!--- `radio` — The mark is a radio style fill.-->
<!--- **BoxType:** The possible shapes of the box.-->
<!--- `circle` — The box is a circle.-->
<!--- `square` — The box is square with optional rounded corners.-->

- **timerInterval `@IBInspectable Double`:** The speed of animation (per sec)
- **repeats `@IBInspectable Bool`:** Defines loops of animation. If repeats == false, animation will stop automatically after it go throughs 1 animation cycle, else will loop until stopAnimate() called.
- **autoAnimated `@IBInspectable Bool`:** `IB/Storyboard Only` If it set to true, will call animate() in awakeFormNib automatically.
- **staticText `@IBInspectable String`:** *Always override `text` attribute of UILabel* `Text of label which will always shown.
- **animateText `@IBInspectable String`:** Text of label will do animation.

<!--#### - timerInterval-->
<!--Defines the speed of animation (per sec)-->
<!--```-->
<!--@IBInspectable var timerInterval: Double = 0.25-->
<!--```-->

<!--#### - repeats-->
<!--Defines loops of animation. If repeats == false, animation will stop automatically after it go throughs 1 animation cycle, else will loop until stopAnimate() called.-->
<!--```-->
<!--@IBInspectable var repeats: Bool = true-->
<!--```-->

<!--#### - autoAnimated-->
<!--If it set to true, will call animate() in awakeFormNib automatically.-->
<!--```-->
<!--@IBInspectable var autoAnimated: Bool = false // Use when create by IB/Storyboard, to define needs animate by default-->
<!--```-->

<!--#### - staticText-->
<!--Text of label which will always shown.-->
<!--```-->
<!--@IBInspectable var staticText: String = ""-->
<!--```-->
<!--#### - animateText-->
<!--Text of label will do animation.-->
<!--```-->
<!--@IBInspectable var animateText: String = ""-->
<!---->
<!--```-->

## Author

Koki Tang

## License

KTLoadingLabel is available under the MIT license. See the LICENSE file for more info.
