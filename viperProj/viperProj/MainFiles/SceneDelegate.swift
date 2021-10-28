//
//  SceneDelegate.swift
//  viperProj
//
//  Created by OUT-Aniskin1-DV on 24.10.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	var window: UIWindow?

	func scene(
		_ scene: UIScene,
		willConnectTo session: UISceneSession,
		options connectionOptions: UIScene.ConnectionOptions
	) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		
		let rootVC = FilmListAssemblyImpl.assemble()
		let window = UIWindow(windowScene: windowScene)
		let navController = UINavigationController(rootViewController: rootVC)
		window.rootViewController = navController
		self.window = window
		window.makeKeyAndVisible()
	}
}
