//
//  FilmListInteractor.swift
//  viperProj
//
//  Created by OUT-Aniskin1-DV on 24.10.2021.
//

import Foundation


private enum Contants {
	static let requestURL = "https://run.mocky.io/v3/acded05c-9671-4de4-ba6d-00cb29ea6074"
	static let urlError = "wrong url"
	static let unknownError = "Unknown error"
}

protocol FilmListInteractor {
	func getFilms()
	func getRandomImageName() -> String 
}

final class FilmListInteractorImpl: FilmListInteractor {
	weak var presenter: FilmListPresenter?
	
	func getFilms() {
		guard let url = URL(string: Contants.requestURL) else {
			print(Contants.urlError)
			return
		}

		URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
			guard
				let data = data,
				error == nil
			else {
				guard let error = error else { return }
				self?.presenter?.interactorDidFetchFilms(with: .failure(error))
				return
			}

			do {
				let entities = try JSONDecoder().decode([FilmListModel].self, from: data)
				self?.presenter?.interactorDidFetchFilms(with: .success(entities))
			}
			catch {
				self?.presenter?.interactorDidFetchFilms(with: .failure(error))
			}
		}.resume()
	}
	
	func getRandomImageName() -> String {
		let imageNames = [
			"poster1",
			"poster2",
			"poster3",
		]
		guard let imageName = imageNames.randomElement() else { return String() }
		return imageName
	}
}
