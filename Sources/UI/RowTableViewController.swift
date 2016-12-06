//
//  RowTableViewController.swift
//  Craveit
//
//  Created by Willow Alexandra on 2016-12-05.
//  Copyright © 2016 Craveit. All rights reserved.
//

import UIKit

class RowTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	// MARK: Constants
	fileprivate static let selectionColor = UIColor(red: 0.925, green: 0.925, blue: 0.925, alpha: 1.0)
	fileprivate static let reuseIdentifier = "RowTableViewCell"
	fileprivate static let rowHeight: CGFloat = 60.0
	
	// MARK: Properties
	let tableView = UITableView()
	var dataSource: [Row] = []
	var rowModel: RowModel! {
		didSet {
			self.updateUI()
		}
	}
	
	// MARK: Closures
	var viewWillAppear: ((Bool) -> Void)?
	var viewDidAppear: ((Bool) -> Void)?
	var viewWillDisappear: ((Bool) -> Void)?
	var viewDidDisappear: ((Bool) -> Void)?
	var didSelectRowAt: ((Row) -> Void)?
	
	// MARK: Initialization
	convenience init(rowModel: RowModel) {
		self.init()
		
		self.rowModel = rowModel
	}
	
	// MARK: View Controller Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.updateUI()
		
		view.backgroundColor = .white
		tableView.register(RowTableViewCell.self, forCellReuseIdentifier: FeatureTableViewController.reuseIdentifier)
		tableView.estimatedRowHeight = FeatureTableViewController.rowHeight
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.tableFooterView = UIView()
		tableView.dataSource = self
		tableView.delegate = self
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		viewWillAppear?(animated)
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		viewDidAppear?(animated)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
		viewWillDisappear?(animated)
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		
		viewDidDisappear?(animated)
	}
	
	// MARK: Selectors
	func updateUI() {
		
	}
	
	// MARK: Table View Data Source
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dataSource.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let reuseIdentifier = RowTableViewController.reuseIdentifier
		let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! RowTableViewCell
		cell.row = dataSource[indexPath.row]
		
		return cell
	}
	
	// MARK: Table View Delegate
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		didSelectRowAt?(dataSource[indexPath.row])
	}
	
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		let selectedBackgroundView = UIView()
		selectedBackgroundView.backgroundColor = RowTableViewController.selectionColor
		cell.selectedBackgroundView = selectedBackgroundView
		cell.accessoryType = .disclosureIndicator
		cell.separatorInset = .zero
		cell.layoutMargins = .zero
	}
	
}
