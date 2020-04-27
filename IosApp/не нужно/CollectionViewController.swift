//
//  CollectionViewController.swift
//  IosApp
//
//  Created by Roman on 26.04.2020.
//  Copyright © 2020 Roman. All rights reserved.
//

import UIKit

//class CollectionViewController: UIViewController {
//
//    var images = [UIImage]() // Пустой массив с картинками
//    let countCells = 3 // количество ячеек в ряду
//    let offSet : CGFloat = 2.0 // Размер отступа
//
//    @IBOutlet weak var collectionView: UICollectionView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
////        Протокол объясняющий как именно нашей коллекции брать данные и как заполнять их
//        collectionView.dataSource = self
////        протокол действия
//        collectionView.delegate = self
////        Делаем перебор всех картинок по названию
//        for i in 0...7{
//            let image = UIImage(named: "image\(i)")! // порядковый номер совпадает с нумерацией массивов
//            images.append(image) // добавляем картинки в массив
//        }
//    }
//
//
//
//}
//
//// Apple рекомендует подписываться на протоколы именно расширениями
//extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{ // последний помогает вычислять размер ячейки
////    Эти методы обязательные для выполнения, Xcode сам подсказывает их заполнять
////    Количество элементов в секции
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return images.count
//    }
////    местоположение конкретной ячейки cellForItemAt по индеку indexPath
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////        создаем ячейку, с помощью переиспользования ячейки(когда она выходит за края экрана, она используется заново)
////         предварительно ставим идентификатор в ячейке в сториборд
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellImage", for: indexPath) as! ImageCollectionViewCell // ассоциируем с новым классом
//
////      вставляем imageView, для этого предварительно надо создать класс для ячейки в новом файле
//
//        let image = images[indexPath.item]
//
//        cell.photoView.image = image
//
//        return cell
//    }
//
////    Функция вычисляющая размер для элемента по ключу
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let frameCV = collectionView.frame // записываем в константу размеры collectionView
//
//        let widthCell = frameCV.width / CGFloat(countCells) // ширину ячейки делаем в 2 раза меньше чем ширина collectionView
//        let heightCell = widthCell // а высота равна ширине
//
//        // чтобы это сработало, надо в сториборде установить EstimateSize в  none, в размерах collectionView
//
//        // чтобы добавить отступы, надо завести констану и чусть ее при вычислении
//        let spacing = CGFloat(countCells + 1) * offSet / CGFloat(countCells) // количество ячеек +1 и умножаем на размер отступа и делим на количество ячеек
//
//        return CGSize(width: widthCell - spacing, height: heightCell - (offSet*2))
//    }
//
//
//}
