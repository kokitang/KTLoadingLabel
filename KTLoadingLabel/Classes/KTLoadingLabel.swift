//
//  KTLoadingLabel.swift
//  dynamic
//
//  Created by Koki Tang on 2/3/2018.
//  Copyright © 2018年 wchingtech. All rights reserved.
//

import UIKit

@IBDesignable public class KTLoadingLabel: UILabel {
    
    /*
     To declare label.text value when the label is not animating
     Default: .fullString
     - fullString: label.text = staticString + animateString.
     - staticString: label.text = staticString.
     - animateString: label.text = animateString.
     */
    public enum StringType {
        case fullString
        case staticString
        case animateString
        
        /* Default value */
        init() {
            self = .fullString
        }
    }
    public enum AnimationType {
        case defaults // Linear, start from index 0. (i.e. 0, 1, 2, 3, 0, 1, ...)
        case reverse // Reverse order when meet the maximum index. (i.e. 0, 1, 2, 3, 2, 1, 0, 1, ...)
        
        /* Default value */
        init() {
            self = .defaults
        }
    }
    
    // MARK: - IBInspectable variables
    @IBInspectable public var timerInterval: Double = 0.25
    @IBInspectable public var repeats: Bool = true
    @IBInspectable public var autoAnimated: Bool = false // Use when create by IB/Storyboard, to define needs animate by default
    @IBInspectable public var staticText: String = "" {
        didSet {
            setDefaultText()
        }
    }
    @IBInspectable public var animateText: String = "" {
        didSet {
            setDefaultText()
            self.animate()
        }
    }
    
    // MARK: - Public variables
    public var stringType: StringType = .init()
    public var animationType: AnimationType = .init()
    public var textSize: CGFloat = 16 {
        didSet {
            font = font.withSize(textSize)
        }
    }
    
    // MARK: - Private variables
    private var timer: Timer?
    private var isReversing: Bool = false
    
    // MARK: - Codes
    public init(staticString: String = "", animateString: String = "") {
        super.init(frame: .zero)
        self.staticText = staticString
        self.animateText = animateString
        setup()
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        setup()
        if autoAnimated {
            animate()
        }
    }
    
    override public final func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
        if staticText.isEmpty && animateText.isEmpty {
            text = "staticText not set"
        }
    }
    
    final func setup(){
        clipsToBounds = true
        textAlignment = .center
        text = staticText + animateText
        numberOfLines = 0
        font = UIFont.init(name: "SetoFont", size: textSize) ?? UIFont.systemFont(ofSize: UIFont.labelFontSize)
    }
    
    public final func setDefaultText() {
        switch stringType {
        case .fullString:
            text = staticText + animateText
            
        case .staticString:
            text = staticText
            
        case .animateString:
            text = animateText
        }
    }
    
    public final func animate() {
        if timer != nil {
            stopAnimate()
        }
        
        if animateText.count > 0 {
            text = staticText
            
            timer = Timer.init(timeInterval: timerInterval, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
            RunLoop.current.add(timer!, forMode: .commonModes)
        }
    }
    
    @objc final func timerAction() {
        if animateText.count == 0 {
            stopAnimate()
            return
        }
        
        if let labelText = text {
            switch animationType {
            case .defaults:
                let labelTextCount = labelText.count + 1 - staticText.count
                if labelTextCount <= animateText.count {
                    let subString = animateText.prefix(labelTextCount)
                    text = staticText + String(subString)
                } else {
                    if repeats {
                        text = staticText
                    } else {
                        stopAnimate()
                    }
                }
                break
                
            case .reverse:
                let labelTextCount = labelText.count + 1 - staticText.count
                if labelTextCount <= animateText.count && !isReversing {
                    let subString = animateText.prefix(labelTextCount)
                    text = staticText + String(subString)
                    if text!.count == staticText.count + animateText.count {
                        isReversing = true
                    }
                } else if isReversing {
                    let newCount = labelText.count - staticText.count - 1
                    if newCount < 0 {
                        if repeats {
                            text = staticText
                            isReversing = false
                        } else {
                            stopAnimate()
                        }
                    } else {
                        let subString = animateText.prefix(newCount)
                        text = staticText + String(subString)
                    }
                }
                break
            }
            
        }
    }
    
    public final func stopAnimate() {
        timer?.invalidate()
        timer = nil
        setDefaultText()
    }
}
