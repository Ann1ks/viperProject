//
//  FilmListRouter.swift
//  viperProj
//
//  Created by OUT-Aniskin1-DV on 24.10.2021.
//

import UIKit

protocol FilmListRouter {
	func pushDetailedFilmView(model: FilmTableCellModel)
}

final class FilmListRouterImpl: FilmListRouter {

	weak var view: FilmListViewImpl?
	
	func pushDetailedFilmView(model: FilmTableCellModel) {
		let viewController = DetailedFilmAssembly.assemble(model: model)
		view?.navigationController?.pushViewController(viewController, animated: true)
	}
}
