//
//  PhotoCollectionViewCell.swift
//  PhotoViewController
//
//  Created by Dmitriy Borovikov on 16/03/2019.
//  Copyright © 2019 Dmitriy Borovikov. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var blurredImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var captionBar: UIView!
    var image: UIImage? {
        set {
            imageView.image = newValue
            blurredImageView.image = newValue
        }
        get {
            return imageView.image
        }
    }
    var caption: String? {
        get {
            return captionLabel.text
        }
        set {
            captionLabel.text = newValue
            if newValue == nil {
                captionLabel.isHidden = true
                captionBar.isHidden = true
            }
        }
    }
    
    func setup(image: UIImage?, caption: String?, contentMode: UIView.ContentMode) {
        imageView.contentMode = contentMode
        self.image = image
        self.caption = caption
    }
}
