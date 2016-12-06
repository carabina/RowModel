//
//  RowModel.swift
//
//  Created by Willow Alexandra on 2016-12-01.
//  Copyright © 2016 Willow Alexandra. All rights reserved.
//

import Foundation

struct RowModel {
	let title: String
	let rows: [Row]
	let options: RowModel.Options?
}

fileprivate protocol Initialization {
	init(title: String)
	init(title: String, rows: [Row])
	init(title: String, options: RowModel.Options)
	init(title: String, rows: [Row], options: RowModel.Options)
}

extension RowModel: Initialization {
	init(title: String) {
		self.title = title
		self.rows = []
		self.options = nil
	}
	
	init(title: String, rows: [Row]) {
		self.title = title
		self.rows = rows
		self.options = nil
	}
	
	init(title: String, options: RowModel.Options) {
		self.title = title
		self.rows = []
		self.options = options
	}
	
	init(title: String, rows: [Row], options: RowModel.Options) {
		self.title = title
		self.rows = rows
		self.options = options
	}
}

fileprivate protocol Update {
	func regenerate(withRows rows: [Row]) -> RowModel
}

extension RowModel: Update {
	func regenerate(withRows rows: [Row]) -> RowModel {
		return RowModel(title: self.title, rows: rows, options: self.options)
	}
}
