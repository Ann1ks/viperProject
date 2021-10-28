//
//  File.swift
//  viperProj
//
//  Created by OUT-Aniskin1-DV on 24.10.2021.
//

import UIKit

private enum Contants {
	static let errorMsg = "Something went wrong"
}

protocol FilmListPresenter: AnyObject {
	func interactorDidFetchFilms(with result: Result<[FilmListModel], Error>)
	func pushDetailedFilmView(model: FilmTableCellModel)
	func getFilms()
	func getFilm(for row: Int) -> FilmTableCellModel? 
	func getFilmsCount() -> Int
}

final class FilmListPresenterImpl: FilmListPresenter {
	var router: FilmListRouter
	var interactor: FilmListInteractor

	weak var view: FilmListViewImpl?
	var films: [FilmListModel] = []
	var filmNames: [String] = []
	
	init(
		interactor: FilmListInteractorImpl,
		router: FilmListRouterImpl
	) {
		self.interactor = interactor
		self.router = router
	}

	func interactorDidFetchFilms(with result: Result<[FilmListModel], Error>) {
		switch result {
		case .success(let films):
			self.films = films
			view?.update()
		case .failure:
			view?.update(with: Contants.errorMsg)
		}
	}
	
	func pushDetailedFilmView(model: FilmTableCellModel) {
		router.pushDetailedFilmView(model: model)
	}
	
	func getFilms() {
		interactor.getFilms()
	}
	
	func getFilm(for row: Int) -> FilmTableCellModel? {
		let model = films[row]
		filmNames.append(interactor.getRandomImageName())
		let filmName = filmNames[row]
		
		return FilmTableCellModel(
			filmName: model.name,
			thumbnailImageName: filmName,
			rating: model.rating,
			year: model.year ?? 0,
			description: model.desc
		)
	}
	
	func getFilmsCount() -> Int {
		films.count
	}
}
