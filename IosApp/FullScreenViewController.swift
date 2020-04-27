//
//  FullScreenViewController.swift
//  IosApp
//
//  Created by Roman on 27.04.2020.
//  Copyright © 2020 Roman. All rights reserved.
//

import UIKit

class FullScreenViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var photoGallery: PhotoGallery!
    var countCells = 1
    let identifire = "FullScreenCell"
    var indexPath: IndexPath!
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "FullScreenCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifire)
        
        collectionView.performBatchUpdates(nil) { (result) in
            self.collectionView.scrollToItem(at: self.indexPath, at: .centeredHorizontally, animated: false)
        }
    }
    


}
extension FullScreenViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{ // последний помогает вычислять размер ячейки
//    Эти методы обязательные для выполнения, Xcode сам подсказывает их заполнять
//    Количество элементов в секции
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoGallery.images.count
    }
    
    
//    местоположение конкретной ячейки cellForItemAt по индеку indexPath
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        создаем ячейку, с помощью переиспользования ячейки(когда она выходит за края экрана, она используется заново)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifire, for: indexPath) as! FullScreenCollectionViewCell // ассоциируем с новым классом
        
        cell.photoView.image = photoGallery.images[indexPath.item] // добавляем в ячеку изображение из файла photoGallery
        return cell
    }
    
    
    
//    Функция вычисляющая размер для элемента по ключу
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCV = collectionView.frame // записываем в константу размеры collectionView
        
        let widthCell = frameCV.width / CGFloat(countCells) // ширину ячейки делаем в 2 раза меньше чем ширина collectionView
        let heightCell = widthCell // а высота равна ширине
        
        // чтобы это сработало, надо в сториборде установить EstimateSize в  none, в размерах collectionView
        
        return CGSize(width: widthCell, height: heightCell)
    }
    
    
}


