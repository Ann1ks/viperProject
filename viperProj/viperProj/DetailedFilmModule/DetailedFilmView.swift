//
//  DetailedView.swift
//  viperProj
//
//  Created by OUT-Aniskin1-DV on 24.10.2021.
//

import UIKit

final class DetailedFilmViewImpl: UIViewController {
	private let filmNameLabel = UILabel()
	private let thumbnailImageView = UIImageView()
	private let ratingLabel = UILabel()
	private let yearLabel = UILabel()
	private let descriptionLabel = UILabel()

	var presenter: DetailedFilmPresenter
	
	init(presenter: DetailedFilmPresenter) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
		presenter.setData()
	}
	
	override func viewWillLayoutSubviews() {
		view.backgroundColor = .white
		
		filmNameLabel.frame = CGRect(
			x: view.frame.minX + 15,
			y: view.safeAreaLayoutGuide.layoutFrame.minY + 15,
			width: view.frame.width,
			height: 20
		)

		thumbnailImageView.frame = CGRect(
			x: filmNameLabel.frame.minX,
			y: filmNameLabel.frame.maxY + 15,
			width: view.frame.width / 2,
			height: view.frame.width / 2 * (16/9)
		)
		
		ratingLabel.frame = CGRect(
			x: thumbnailImageView.frame.minX,
			y: thumbnailImageView.frame.maxY + 15,
			width: filmNameLabel.frame.width,
			height: filmNameLabel.frame.height
		)
		ratingLabel.textColor = .gray
		
		yearLabel.frame = CGRect(
			x: ratingLabel.frame.minX,
			y: ratingLabel.frame.maxY + 15,
			width: ratingLabel.frame.width,
			height: ratingLabel.frame.height
		)
		yearLabel.textColor = .gray
		
		descriptionLabel.frame = CGRect(
			x: yearLabel.frame.minX,
			y: yearLabel.frame.maxY + 15,
			width: yearLabel.frame.width - yearLabel.frame.minX * 2,
			height: 300
		)
		descriptionLabel.numberOfLines = 0
		descriptionLabel.sizeToFit()
		descriptionLabel.lineBreakMode = .byWordWrapping
		descriptionLabel.textColor = .gray
	}
	
	private func setupView() {
		view.addSubview(thumbnailImageView)
		view.addSubview(filmNameLabel)
		view.addSubview(ratingLabel)
		view.addSubview(yearLabel)
		view.addSubview(descriptionLabel)
	}
	
	func updateView(model: DetailedFilmModel) {
		title = model.filmName
		filmNameLabel.text = model.filmName
		
		filmNameLabel.text = model.filmName.uppercased()
		ratingLabel.text = "Rating: \(model.rating)"
		yearLabel.text = String(describing: "Year: \(model.year)")
		thumbnailImageView.image = UIImage(named: model.thumbnailImageName)
		descriptionLabel.text = "Description: \(model.description)"
		viewWillLayoutSubviews()
	}
}
