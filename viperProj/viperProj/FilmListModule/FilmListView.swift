//
//  FilmLishView.swift
//  viperProj
//
//  Created by OUT-Aniskin1-DV on 24.10.2021.
//

import UIKit

private enum Contants {
	static let cellIdentifier = "filmCell"
	static let cellHeight: CGFloat = 200
}

final class FilmListViewImpl: UIViewController  {
	private let tableView: UITableView = {
		let table = UITableView()
		table.register(FilmTableViewCell.self, forCellReuseIdentifier: Contants.cellIdentifier)
		return table
	}()

	var presenter: FilmListPresenter
	
	init(presenter: FilmListPresenter) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Top 250 films"
		presenter.getFilms()
		setupTableView()
	}
	
	private func setupTableView() {
		tableView.delegate = self
		tableView.dataSource = self
		tableView.frame = view.frame
		view.addSubview(tableView)
	}
	
	func update() {
		DispatchQueue.main.async { [weak self] in
			guard let self = self else { return }
			self.tableView.reloadData()
		}
	}

	func update(with error: String) {
		print(error)
	}
}

extension FilmListViewImpl: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return presenter.getFilmsCount()
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cellModel = presenter.getFilm(for: indexPath.row) else { return UITableViewCell() }
		let cell = FilmTableViewCell()
		cell.bind(model: cellModel)
		return cell
	}
}

extension FilmListViewImpl: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		presenter.pushDetailedFilmView(model: presenter.getFilm(for: indexPath.row)!)
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		Contants.cellHeight
	}
}
