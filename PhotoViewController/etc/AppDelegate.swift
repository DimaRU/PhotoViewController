//
//  AppDelegate.swift
//  PhotoViewController
//
//  Created by Dmitriy Borovikov on 15/03/2019.
//  Copyright © 2019 Dmitriy Borovikov. All rights reserved.
//

import UIKit
import Kingfisher

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    let photos: [Photo] = [
        Photo(url: URL(string: "https://static.inaturalist.org/photos/99279/medium.jpg?1545393634")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/17415659/medium.jpg?1525460504")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/17415663/medium.jpg?1525460506")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/17415666/medium.jpg?1525460508")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/17415667/medium.jpg?1525460510")!),
        ]
    
    let captions: [String] = [
        "caption 1",
        "caption 2",
        "caption 3",
        "caption 4",
        "caption 5",
        ]
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        let cache = ImageCache.default
//        cache.clearMemoryCache()
//        cache.clearDiskCache { print("Done cache clearing") }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainViewController = PhotoViewController.instantiate()
        mainViewController.photos = photos
        mainViewController.captions = captions
        let navigationController = UINavigationController(rootViewController: mainViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }

}

