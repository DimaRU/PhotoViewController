//
//  Photo.swift
//  PhotoViewController
//
//  Created by Dmitriy Borovikov on 20/03/2019.
//  Copyright © 2019 Dmitriy Borovikov. All rights reserved.
//

import Foundation

struct Photo {
    let url: URL
}

extension Photo {
    func replaceUrl(_ with: String) -> URL {
        let urlString = url.absoluteString.replacingOccurrences(of: "medium", with: with)
        return URL(string: urlString)!
    }
    
    var squareUrl: URL { return replaceUrl("square") }
    var mediumUrl: URL { return url }
    var smallUrl: URL { return replaceUrl("small") }
    var thumbUrl: URL { return replaceUrl("thumb") }
    var largeUrl: URL { return replaceUrl("large") }
    var original: URL { return replaceUrl("original") }
}
