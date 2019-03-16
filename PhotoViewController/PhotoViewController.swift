//
//  PhotoViewController.swift
//  PhotoViewController
//
//  Created by Dmitriy Borovikov on 15/03/2019.
//  Copyright © 2019 Dmitriy Borovikov. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var pageControlConstraint: NSLayoutConstraint!
    
    public var photos: [URL] = [
        URL(string: "https://static.inaturalist.org/photos/99279/medium.jpg?1545393634")!,
        URL(string: "https://static.inaturalist.org/photos/17415659/medium.jpg?1525460504")!,
        URL(string: "https://static.inaturalist.org/photos/17415663/medium.jpg?1525460506")!,
        URL(string: "https://static.inaturalist.org/photos/17415666/medium.jpg?1525460508")!,
        URL(string: "https://static.inaturalist.org/photos/17415667/medium.jpg?1525460510")!,
    ]
    
    public var captions: [String] = [
        "caption 1",
        "caption 2",
        "caption 3",
        "caption 4",
        "caption 5",
    ]
    
    public var imageContentMode = UIView.ContentMode.scaleAspectFit
    

    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = photos.count
        if captions.isEmpty {
            pageControlConstraint.constant = 0
        }
    }
    
    func makeImage(for url: URL) -> UIImage? {
        guard let photo = try? Data(contentsOf: url) else { return nil }
        guard let photoImage = UIImage(data: photo) else { return nil }
        return photoImage
    }
    
    var scollViewIsDragging = false
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        scollViewIsDragging = true
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        scollViewIsDragging = false
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scollViewIsDragging else { return }
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint) {
            pageControl.currentPage = visibleIndexPath.row
        }
    }
    
    @IBAction func setPage(_ sender: UIPageControl) {
        let indexPath = IndexPath(item: sender.currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: [.centeredVertically, .centeredHorizontally], animated: true)
    }
}

extension PhotoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        let caption = captions.count > indexPath.row ? captions[indexPath.row] : nil
        cell.setup(image: makeImage(for: photos[indexPath.row]),
                   caption: caption,
                   contentMode: imageContentMode)
        return cell
    }
}

extension PhotoViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected: \(indexPath.row)")
    }
}

extension PhotoViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
    }
}

extension PhotoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}
