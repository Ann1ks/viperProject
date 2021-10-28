//
//  DetailedViewInteractor.swift
//  viperProj
//
//  Created by OUT-Aniskin1-DV on 24.10.2021.
//

import Foundation

protocol DetailedFilmInteractor: AnyObject {
	func getData(model: FilmTableCellModel) -> DetailedFilmModel? 
}

final class DetailedFilmInteractorImpl: DetailedFilmInteractor {
	weak var presenter: DetailedFilmPresenter?

	func getData(model: FilmTableCellModel) -> DetailedFilmModel? {
		return DetailedFilmModel(
			filmName: model.filmName,
			thumbnailImageName: model.thumbnailImageName,
			rating: model.rating,
			year: model.year,
			description: model.description
		)
	}
}
