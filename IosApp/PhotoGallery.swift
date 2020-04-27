//
//  PhotoGallery.swift
//  IosApp
//
//  Created by Roman on 26.04.2020.
//  Copyright © 2020 Roman. All rights reserved.
//

import Foundation
import UIKit

class PhotoGallery{
    var images = [UIImage]() // Пустой массив с картинками
    
       
    init() {
        setupGalery()
    }
    
    func setupGalery() {
        for i in 0...7{
            let image = UIImage(named: "image\(i)")! // порядковый номер совпадает с нумерацией массивов
            images.append(image) // добавляем картинки в массив
        }
    }
}
