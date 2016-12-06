//
//  RowTableViewCell.swift
//  IdeaTest
//
//  Created by Willow Alexandra on 2016-12-01.
//  Copyright © 2016 Craveit. All rights reserved.
//

import UIKit

final class RowTableViewCell: UITableViewCell {
	
	// MARK: Constants
	fileprivate static let thumbnailCornerRadius: CGFloat = 1.5
	
	// MARK: Properties
	fileprivate let thumbnailImageView = UIImageView()
	fileprivate let titleLabel = UILabel(textStyle: .callout, color: .black)
	fileprivate let subtitleLabel = UILabel(textStyle: .caption1, color: .lightGray)
	
	// MARK: Configuration
	var row: Row! {
		didSet {
			if let imageUrl = row.imageUrl {
				if let data = try? Data(contentsOf: imageUrl) {
					thumbnailImageView.image = UIImage(data: data)
				}
			}
			
			titleLabel.text = row.title
			subtitleLabel.text = row.subtitle
		}
	}
	
	// MARK: View Lifecycle
	override func layoutSubviews() {
		super.layoutSubviews()
		
		accessoryView?.tintColor = .clear
		
		if nil == row?.imageUrl && nil == row?.subtitle {
			self.addSubview(titleLabel)
			titleLabel.translatesAutoresizingMaskIntoConstraints = false
			titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
			titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12.0).isActive = true
			
			return
		}
		
		if nil == row?.imageUrl && nil != row?.subtitle {
			self.addSubview(titleLabel)
			titleLabel.translatesAutoresizingMaskIntoConstraints = false
			titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12.0).isActive = true
			self.titleLabelCenterY().isActive = true
			self.layoutSubtitleLabel()
			
			return
		}
		
		if nil != row?.imageUrl && nil == row?.subtitle {
			self.layoutThumbnailImageView()
			self.addSubview(titleLabel)
			titleLabel.translatesAutoresizingMaskIntoConstraints = false
			titleLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 12.0).isActive = true
			titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
			
			return
		}
		
		self.layoutThumbnailImageView()
		self.addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 12.0).isActive = true
		self.titleLabelCenterY().isActive = true
		self.layoutSubtitleLabel()
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		
		self.thumbnailImageView.image = nil
	}
	
	// MARK: Constraints
	fileprivate func titleLabelCenterY() -> NSLayoutConstraint {
		return NSLayoutConstraint(
			item: titleLabel,
			attribute: .centerY,
			relatedBy: .equal,
			toItem: self,
			attribute: .centerY,
			multiplier: 0.70,
			constant: 0.0
		)
	}
	
	fileprivate func layoutThumbnailImageView() {
		self.addSubview(thumbnailImageView)
		thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
		thumbnailImageView.layer.cornerRadius = RowTableViewCell.thumbnailCornerRadius
		thumbnailImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12.0).isActive = true
		thumbnailImageView.topAnchor.constraint(equalTo: topAnchor, constant: 6.0).isActive = true
		thumbnailImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
		thumbnailImageView.widthAnchor.constraint(equalTo: thumbnailImageView.heightAnchor).isActive = true
	}
	
	fileprivate func layoutSubtitleLabel() {
		self.addSubview(subtitleLabel)
		subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
		subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
		subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 1.0).isActive = true
	}
	
}
