//
//  RowModel+Options.swift
//
//  Created by Willow Alexandra on 2016-12-05.
//  Copyright © 2016 Willow Alexandra. All rights reserved.
//

import Foundation

extension RowModel {
	struct Options {
		let subtitle: String?
		let segments: [String]?
		let representedObject: Any?
	}
}

fileprivate protocol Initialization {
	init(subtitle: String)
	init(subtitle: String, representedObject: Any)
	init(segments: [String])
	init(segments: [String], representedObject: Any)
	init(representedObject: Any)
}

extension RowModel.Options: Initialization {
	init(subtitle: String) {
		self.subtitle = subtitle
		self.segments = nil
		self.representedObject = nil
	}
	
	init(subtitle: String, representedObject: Any) {
		self.subtitle = subtitle
		self.segments = nil
		self.representedObject = representedObject
	}
	
	init(segments: [String]) {
		self.subtitle = nil
		self.segments = segments
		self.representedObject = nil
	}
	
	init(segments: [String], representedObject: Any) {
		self.subtitle = nil
		self.segments = segments
		self.representedObject = representedObject
	}
	
	init(representedObject: Any) {
		self.subtitle = nil
		self.segments = nil
		self.representedObject = representedObject
	}
}
