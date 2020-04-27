//
//  ProfileViewController.swift
//  IosApp
//
//  Created by Roman on 24.04.2020.
//  Copyright © 2020 Roman. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let photoGallery = PhotoGallery() // ссылка на класс с фотками
    let identifire = "PhotoCollectionViewCell" // идентификатор для xib файла, его название
    let countCells = 3 // количество ячеек в ряду
    let offSet : CGFloat = 2.0 // Размер отступа
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatarImage.layer.cornerRadius = 65   // задаем закругление(половина от размера UIImage)
        avatarImage.layer.borderColor = UIColor.gray.cgColor //            Рамочка для фото серая
        avatarImage.layer.borderWidth = 3.0 //        толщина рамочки
        collectionView.dataSource = self     //        Протокол объясняющий как именно нашей коллекции брать данные и как заполнять их
        collectionView.delegate = self         //        протокол действия
        
        collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifire) // регистрируе наш xib файл с ячейкой
    }


}
extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{ // последний помогает вычислять размер ячейки
//    Эти методы обязательные для выполнения, Xcode сам подсказывает их заполнять
//    Количество элементов в секции
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoGallery.images.count
    }
    
    
//    местоположение конкретной ячейки cellForItemAt по индеку indexPath
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        создаем ячейку, с помощью переиспользования ячейки(когда она выходит за края экрана, она используется заново)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifire, for: indexPath) as! PhotoCollectionViewCell // ассоциируем с новым классом
        
        cell.photoView.image = photoGallery.images[indexPath.item] // добавляем в ячеку изображение из файла photoGallery
        return cell
    }
    
    
    
//    Функция вычисляющая размер для элемента по ключу
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCV = collectionView.frame // записываем в константу размеры collectionView
        
        let widthCell = frameCV.width / CGFloat(countCells) // ширину ячейки делаем в 2 раза меньше чем ширина collectionView
        let heightCell = widthCell // а высота равна ширине
        
        // чтобы это сработало, надо в сториборде установить EstimateSize в  none, в размерах collectionView
        
        // чтобы добавить отступы, надо завести констану и чусть ее при вычислении
        let spacing = CGFloat(countCells + 1) * offSet / CGFloat(countCells) // количество ячеек +1 и умножаем на размер отступа и делим на количество ячеек
        
        return CGSize(width: widthCell - spacing, height: heightCell - (offSet*2))
    }
    
    
    // когда выбираем ячейку, тут будет происходить какое-либо действие
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "FullScreenViewController") as! FullScreenViewController
        
        vc.photoGallery = photoGallery
        vc.indexPath = indexPath
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

