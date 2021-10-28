//
//  FilmListModel.swift
//  viperProj
//
//  Created by OUT-Aniskin1-DV on 24.10.2021.
//

import Foundation

struct FilmListModel: Decodable {
	let actors: [String]
	let desc: String
	let directors: [String]
	let genre: [String]
	let image_url: String
	let thumb_url: String
	let name: String
	let rating: Double
	let year: Int?
}
