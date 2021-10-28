//
//  DetailedFilmAssembly.swift
//  viperProj
//
//  Created by OUT-Aniskin1-DV on 25.10.2021.
//

import UIKit

final class DetailedFilmAssembly {
	static func assemble(model: FilmTableCellModel) -> UIViewController {
		let interactor = DetailedFilmInteractorImpl()
		let presenter = DetailedFilmPresenterImpl(interactor: interactor, model: model)

		let view = DetailedFilmViewImpl(presenter: presenter)

		presenter.view = view
		interactor.presenter = presenter

		return view
	}
}
