//
//  FilmListAssembly.swift
//  viperProj
//
//  Created by OUT-Aniskin1-DV on 25.10.2021.
//

import UIKit

final class FilmListAssemblyImpl {
	static func assemble() -> UIViewController {
		let router = FilmListRouterImpl()
		let interactor = FilmListInteractorImpl()
		let presenter = FilmListPresenterImpl(interactor: interactor, router: router)
		
		let view = FilmListViewImpl(presenter: presenter)

		router.view = view
		presenter.view = view
		interactor.presenter = presenter

		return view
	}
}
