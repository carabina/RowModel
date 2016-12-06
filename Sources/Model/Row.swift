//
//  Row.swift
//
//  Created by Willow Alexandra on 2016-12-01.
//  Copyright © 2016 Willow Alexandra. All rights reserved.
//

import Foundation

struct Row {
	let title: String
	let representedObject: Any
	let subtitle: String?
	let imageUrl: URL?
}

fileprivate protocol Initialization {
	init(title: String, representedObject: Any)
	init(title: String, subtitle: String, representedObject: Any)
	init(title: String, subtitle: String, imageUrl: URL, representedObject: Any)
}

extension Row: Initialization {
	init(title: String, representedObject: Any) {
		self.title = title
		self.subtitle = nil
		self.imageUrl = nil
		self.representedObject = representedObject
	}
	
	init(title: String, subtitle: String, representedObject: Any) {
		self.title = title
		self.subtitle = subtitle
		self.imageUrl = nil
		self.representedObject = representedObject
	}
	
	init(title: String, subtitle: String, imageUrl: URL, representedObject: Any) {
		self.title = title
		self.subtitle = subtitle
		self.imageUrl = imageUrl
		self.representedObject = representedObject
	}
}
