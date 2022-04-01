//
//  UIImageView+Extension.swift
//  ExampleMVVM
//
//  Created by hooni on 4/1/22.
//

import UIKit

extension UIImageView {
    
    func loadFrom(urlSting: String, placeHolder: UIImage? = nil) {
        if let placeHolder = placeHolder {
            self.image = placeHolder
        }
        
        guard let url = URL(string: urlSting) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}
