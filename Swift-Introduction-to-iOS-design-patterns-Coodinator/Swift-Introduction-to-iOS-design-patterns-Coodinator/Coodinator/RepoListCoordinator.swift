//
//  RepoListCoordinator.swift
//  Swift-Introduction-to-iOS-design-patterns-Coodinator
//
//  Created by kazunori.aoki on 2021/10/13.
//

import UIKit

class RepoListCoordinator: Coordinator {
    
    let navigator: UINavigationController
    var repoListViewController: RepoListViewController?
    var repoDetailCoordinator: RepoDetailCoordinator?
    
    init(navigator: UINavigationController) {
        self.navigator = navigator
    }
    
    func start() {
        let viewController = RepoListViewController()
        viewController.delegate = self
        navigator.pushViewController(viewController, animated: true)
        self.repoListViewController = viewController
    }
}


// MARK: - RepoListViewControllerDelegate
extension RepoListCoordinator: RepoListViewControllerDelegate {
    func repoListViewControllerDidSelectRepo(_ repo: GitHubRepoModel) {
        let repoDetailCoordinator = RepoDetailCoordinator(navigator: self.navigator, model: repo)
        repoDetailCoordinator.start()
        self.repoDetailCoordinator = repoDetailCoordinator
    }
}
