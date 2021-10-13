//
//  RepoDetailCoordinator.swift
//  Swift-Introduction-to-iOS-design-patterns-Coodinator
//
//  Created by kazunori.aoki on 2021/10/13.
//

import UIKit

class RepoDetailCoordinator: Coordinator {
    
    let navigator: UINavigationController
    let model: GitHubRepoModel
    var repoDetailViewContorller: RepoDetailViewController?
    
    init(navigator: UINavigationController, model: GitHubRepoModel) {
        self.navigator = navigator
        self.model = model
    }
    
    func start() {
        let viewController = RepoDetailViewController()
        viewController.repoURL = model.url
        self.navigator.pushViewController(viewController, animated: true)
        self.repoDetailViewContorller = viewController
    }
}
