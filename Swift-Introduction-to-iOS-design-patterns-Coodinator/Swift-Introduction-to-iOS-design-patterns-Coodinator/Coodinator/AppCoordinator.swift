//
//  AppCoordinator.swift
//  Swift-Introduction-to-iOS-design-patterns-Coodinator
//
//  Created by kazunori.aoki on 2021/10/13.
//

import UIKit
import UserNotifications
import CoreSpotlight

class AppCoordinator: Coordinator {
    
    let window: UIWindow
    let rootViewController: UITabBarController
    let launchType: LaunchType?
    
    var repoListCoordinator: RepoListCoordinator
    
    enum LaunchType {
        case normal
        case notification(UNNotificationRequest)
        case userActivity(NSUserActivity)
        case openURL(URL)
        case shortcutItem(UIApplicationShortcutItem)
    }
    
    init(window: UIWindow, launchType: LaunchType? = nil) {
        self.window = window
        rootViewController = .init()
        self.launchType = launchType
        
        let repoNavigationController = UINavigationController()
        self.repoListCoordinator = RepoListCoordinator(navigator: repoNavigationController)
        rootViewController.viewControllers = [repoNavigationController]
    }
    
    func start() {
        window.rootViewController = rootViewController
        
        defer {
            window.makeKeyAndVisible()
        }
        
        guard let launchType = launchType else {
            repoListCoordinator.start()
            return
        }

        switch launchType {
        case .normal:
            break
            
        case .notification(let request):
            if request.trigger is UNPushNotificationTrigger {
                // TODO: remote notification
            } else if request.trigger is UNTimeIntervalNotificationTrigger {
                // TODO: local notification
            }
            
        case .userActivity(let userActivity):
            switch userActivity.activityType {
            case NSUserActivityTypeBrowsingWeb: // universal links
                break
                
            case CSSearchableItemActionType: // core spotlight
                break
                
            case CSQueryContinuationActionType: // core spotlight( incremental search)
                break
                
            default:
                fatalError("Unreachable userActivity: \(userActivity.activityType)")
            }
            
        case .openURL(let url):
            if url.scheme == "coordinator-example-widget" {
                _ = url.lastPathComponent
                break
                
            } else if url.scheme == "adjustSchemeExample" {
                // TODO: replace your adjust url scheme
                break
                
            } else if url.scheme == "FirebaseDynamicLinksExample" {
                // TODO: handle your FDL
                break
            }
            
        case .shortcutItem(let shortcutItem):
            break
        }
    }
}
