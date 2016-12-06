//
//  PlainTableViewController.swift
//
//  Created by Willow Alexandra on 2016-12-01.
//  Copyright © 2016 Willow Alexandra. All rights reserved.
//

import UIKit

final class PlainTableViewController: RowTableViewController {
	
	// MARK: Properties
	let segmentedControl = UISegmentedControl()
	
	// MARK: Closures
	var didSelectSegment: ((Int) -> Void)?
	var didActivateUndefinedAction: ((Any) -> Void)?
	
	// MARK: View Controller Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		
		guard let segments = rowModel.options?.segments else {
			tableView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
			return
		}
		
		for index in 0 ..< segments.count {
			let segment = segments[index]
			segmentedControl.insertSegment(withTitle: segment, at: index, animated: false)
		}
		
		segmentedControl.addTarget(self, action: #selector(segmentedControlValueDidChange), for: .valueChanged)
		
		
		let containerView = UIView()
		containerView.backgroundColor = UIColor(red: 0.976, green: 0.976, blue: 0.976, alpha: 1.0)
		containerView.translatesAutoresizingMaskIntoConstraints = false
		
		view.addSubview(containerView)
		containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		containerView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
		containerView.heightAnchor.constraint(equalToConstant: 45.0).isActive = true
		
		containerView.addSubview(segmentedControl)
		segmentedControl.translatesAutoresizingMaskIntoConstraints = false
		segmentedControl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8.0).isActive = true
		segmentedControl.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8.0).isActive = true
		segmentedControl.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8.0).isActive = true
		segmentedControl.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8.0).isActive = true
		
		tableView.topAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		navigationController?.setNavigationBarHidden(false, animated: false)
	}
	
	// MARK: Selectors
	override func updateUI() {
		title = rowModel.title
		dataSource = rowModel.rows
		tableView.reloadData()
	}
	
	@objc fileprivate func segmentedControlValueDidChange(sender: UISegmentedControl) {
		didSelectSegment?(sender.selectedSegmentIndex)
	}
	
	@objc func undefinedActionDidActivate(sender: AnyObject) {
		didActivateUndefinedAction?(sender)
	}
	
}
