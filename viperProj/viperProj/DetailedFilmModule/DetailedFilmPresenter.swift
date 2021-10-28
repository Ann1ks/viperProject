//
//  DetailedFilmPresenter.swift
//  viperProj
//
//  Created by OUT-Aniskin1-DV on 24.10.2021.
//

import Foundation

protocol DetailedFilmPresenter: AnyObject {
	func setData()
}

final class DetailedFilmPresenterImpl: DetailedFilmPresenter {
	weak var view: DetailedFilmViewImpl?
	var interactor: DetailedFilmInteractor
	let model: FilmTableCellModel

	init(
		interactor: DetailedFilmInteractor,
		model: FilmTableCellModel
	) {
		self.interactor = interactor
		self.model = model
	}

	func setData() {
		guard let model = interactor.getData(model: model) else { return }
		view?.updateView(model: model)
	}
}
