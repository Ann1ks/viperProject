//
//  FilmTableViewCell.swift
//  viperProj
//
//  Created by OUT-Aniskin1-DV on 24.10.2021.
//

import UIKit

private enum Contants {
	static let filmNameLabelNumberOfLines = 1
	static let aspectRatio: CGFloat = 16/9
}

final class FilmTableViewCell: UITableViewCell {
	private let filmNameLabel = UILabel()
	private let thumbnailImageView = UIImageView()
	private let ratingLabel = UILabel()
	private let yearLabel = UILabel()
	
	private func setupCell() {
		thumbnailImageView.frame = CGRect(
			x: frame.minX + 10,
			y: frame.minY + 5,
			width: frame.width / 3 ,
			height: frame.width / 3 * Contants.aspectRatio
		)

		filmNameLabel.frame = CGRect(
			x: thumbnailImageView.frame.maxX + 5,
			y: frame.minY + 5,
			width: frame.width,
			height: 20
		)
		
		ratingLabel.frame = CGRect(
			x: filmNameLabel.frame.minX,
			y: filmNameLabel.frame.maxY + 10,
			width: filmNameLabel.frame.width,
			height: filmNameLabel.frame.height
		)
		ratingLabel.textColor = .gray
		
		yearLabel.frame = CGRect(
			x: ratingLabel.frame.minX,
			y: ratingLabel.frame.maxY + 10,
			width: ratingLabel.frame.width,
			height: ratingLabel.frame.height
		)
		yearLabel.textColor = .gray

		addSubview(thumbnailImageView)
		addSubview(filmNameLabel)
		addSubview(ratingLabel)
		addSubview(yearLabel)
	}

	func bind(model: FilmTableCellModel) {
		filmNameLabel.text = model.filmName.uppercased()
		ratingLabel.text = "Rating: \(model.rating)"
		yearLabel.text = String(describing: "Year: \(model.year)")
		thumbnailImageView.image = UIImage(named: model.thumbnailImageName)
		setupCell()
	}
}
