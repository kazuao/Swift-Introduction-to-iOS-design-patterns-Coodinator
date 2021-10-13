//
//  RepoListTableViewCell.swift
//  Swift-Introduction-to-iOS-design-patterns-Coodinator
//
//  Created by kazunori.aoki on 2021/10/13.
//

import UIKit

class RepoListTableViewCell: UITableViewCell {

    // MARK: UI
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var starLabel: UILabel!
    
    
    // MARK: Public
    func set(model: GitHubRepoModel) {
        nameLabel.text = model.name
        starLabel.text = "🌟 \(model.star)"
    }
}
