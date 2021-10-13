//
//  RepoDetailViewController.swift
//  Swift-Introduction-to-iOS-design-patterns-Coodinator
//
//  Created by kazunori.aoki on 2021/10/13.
//

import UIKit
import WebKit

class RepoDetailViewController: UIViewController {

    // MARK: UI
    @IBOutlet weak var wkWebView: WKWebView!
    
    
    // MARK: Variable
    var repoURL: URL?
    
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = repoURL {
            let request = URLRequest(url: url)
            wkWebView.load(request)
        }
    }
}
