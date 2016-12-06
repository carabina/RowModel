//
//  UIKit+WXB.swift
//
//  Created by Willow Alexandra on 2016-12-05.
//  Copyright © 2016 Willow Alexandra. All rights reserved.
//

import UIKit

extension UILabel {

    /// Create a new `UILabel` with a text style and color.
    /// - parameter textStyle: `UIFont.TextStyle`
    /// - parameter color: `UIColor?`
    /// - Returns: A new `UILabel` object.
    convenience init(textStyle: UIFont.TextStyle, color: UIColor? = nil) {
        self.init(frame: .zero)

        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = color ?? .black

        let preferredFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle(rawValue: textStyle.rawValue))

        switch textStyle {
        case .title1:
            font = UIFont.systemFont(ofSize: preferredFont.pointSize, weight: UIFontWeightHeavy)
        case .title2, .title3:
            font = preferredFont
        case .headline, .subheadline:
            font = preferredFont
        case .body:
            font = UIFont.systemFont(ofSize: preferredFont.pointSize - 2.5, weight: UIFontWeightMedium)
        case .callout, .footnote:
            font = preferredFont
        case .caption1, .caption2:
            font = preferredFont
        }
    }

}

extension UIFont {

	/// An enumeration for `UIFontTextStyle`.
	enum TextStyle {
		case title1, title2, title3
		case headline, subheadline
		case body, callout, footnote
		case caption1, caption2

		var rawValue: String {
			switch self {
			case .title1:
				return UIFontTextStyle.title1.rawValue
			case .title2:
				return UIFontTextStyle.title2.rawValue
			case .title3:
				return UIFontTextStyle.title3.rawValue
			case .headline:
				return UIFontTextStyle.headline.rawValue
			case .subheadline:
				return UIFontTextStyle.subheadline.rawValue
			case .body:
				return UIFontTextStyle.body.rawValue
			case .callout:
				return UIFontTextStyle.callout.rawValue
			case .footnote:
				return UIFontTextStyle.footnote.rawValue
			case .caption1:
				return UIFontTextStyle.caption1.rawValue
			case .caption2:
				return UIFontTextStyle.caption2.rawValue
			}
		}
	}

}
