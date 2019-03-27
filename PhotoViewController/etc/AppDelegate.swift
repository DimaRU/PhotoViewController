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
        Photo(url: URL(string: "https://static.inaturalist.org/photos/28846648/medium.jpg?1545344394")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/3180282/medium.JPG?1458354592")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/5454866/medium.jpg?1478476770")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/4223/medium.jpg?1545378158")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/4224/medium.jpg?1545378162")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/1225282/medium.?1413324369")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/4222/medium.jpg?1545378154")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/7474/medium.jpg?1545386138")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/8721/medium.jpg?1444273506")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/10549/medium.jpg?1545356149")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/10548/medium.jpg?1444843740")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/10696/medium.jpg?1444279380")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/10839/medium.jpg?1545397677")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/10840/medium.jpg?1545397680")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/10698/medium.jpg?1444279392")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/10697/medium.jpg?1444279385")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/10843/medium.jpg?1545397685")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/19661/medium.jpg?1545404570")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/23799/medium.jpg?1545624689")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/25120/medium.jpg?1545370259")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/25121/medium.jpg?1545370262")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/25127/medium.jpg?1545370273")!),
        Photo(url: URL(string: "https://farm3.staticflickr.com/2803/4051715577_614367302d.jpg")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/25130/medium.jpg?1545370277")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/25185/medium.jpg?1444306692")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/24441/medium.jpg?1444305538")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/28280/medium.jpg?1545408495")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/29169/medium.jpg?1545373273")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/33334/medium.jpg?1444844344")!),
        Photo(url: URL(string: "https://static.inaturalist.org/photos/24457/medium.jpg?1444305648")!),
        ]
    
    let captions: [String] = [
        "caption 1",
        "caption 2",
        "caption 3",
        "caption 4",
        "caption 5",
        ]
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let cache = ImageCache.default
        cache.clearMemoryCache()
        cache.clearDiskCache { print("Done cache clearing") }
        
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

