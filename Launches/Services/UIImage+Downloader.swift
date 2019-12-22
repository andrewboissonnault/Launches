//
//  UIImage+Downloader.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import UIKit

private let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    func setImageFromURL(_ url : URL) {
        DispatchQueue.global().async {
            if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
                self.setImageMain(cachedImage)
            }
            else {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data, error == nil else { return }
                    if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                        return
                    }
                    if let image = UIImage(data: data) {
                        imageCache.setObject(image, forKey: url.absoluteString as NSString)
                        self.setImageMain(image)
                    }
                    }.resume()
            }
        }
    }
    
    private func setImageMain(_ image : UIImage?) {
        DispatchQueue.main.async {
            self.image = image
        }
    }
}

