//
//  AutorizationViewController.swift
//  IosApp
//
//  Created by Roman on 25.04.2020.
//  Copyright © 2020 Roman. All rights reserved.
//

import UIKit

class AutorizationViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
        textPod(textfield: loginTextField)
        textPod(textfield: passwordTextField)
        extractedFunc()
     }
    
//    Подписывает наши поля на делегата
    func textPod(textfield: UITextField){
        textfield.delegate = self // подписываемся на наблюдателя
        textfield.clearButtonMode = UITextField.ViewMode.whileEditing // с помощью него добавляем кнопку удаления в текстовом поле
    }
     
//     Убирает клавиатуру после нажатия return
     func textFieldShouldReturn(_ textField: UITextField) -> Bool { // Спрашивает делегата, должно ли текстовое поле обрабатывать нажатие кнопки возврата.
        
        textField.resignFirstResponder()
         return true
    }
    
    // заставим текстовое поле смещаться вверх при использовании клавиатуры
    fileprivate func extractedFunc() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = -200 // смещаем наверх
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = 0.0 // возвращаем на место
        }
    }
    
    
}
