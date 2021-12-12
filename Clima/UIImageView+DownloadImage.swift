//
//  UIImage+LoadImage.swift
//  Clima
//
//  Created by Anna Shanidze on 12.12.2021.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(code: String) {
        let session = URLSession.shared
        guard let url = URL(string: "http://openweathermap.org/img/wn/\(code)@2x.png") else { return }
        let downloadTask = session.downloadTask(with: url) { [weak self] url, response, error in
            if error == nil,
               let url = url,
               let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    if let weakSelf = self {
                        weakSelf.image = image
                    }
                }
            }
        }
        downloadTask.resume()
    }
}
