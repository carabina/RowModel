//
//  FeatureTableViewController.swift
//
//  Created by Willow Alexandra on 2016-12-03.
//  Copyright © 2016 Willow Alexandra. All rights reserved.
//

import UIKit

final class FeatureTableViewController: RowTableViewController {
	
	// MARK: Properties
	let titleLabel = UILabel(textStyle: .title1, color: .black)
	let subtitleLabel = UILabel(textStyle: .body, color: .lightGray)

	// MARK: View Controller Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15.0).isActive = true
		titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30.0).isActive = true
		
		view.addSubview(subtitleLabel)
		subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
		subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15.0).isActive = true
		subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2.0).isActive = true
		
		view.addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		tableView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 30.0).isActive = true
		tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		navigationController?.setNavigationBarHidden(true, animated: false)
	}
	
	// MARK: Selectors
	override func updateUI() {
		titleLabel.text = rowModel.title
		subtitleLabel.text = rowModel.options?.subtitle ?? String()
		dataSource = rowModel.rows
	}
	
}
