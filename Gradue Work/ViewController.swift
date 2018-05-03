//
//  ViewController.swift
//  Gradue Work
//
//  Created by Арман Каштан on 18.04.2018.
//  Copyright © 2018 Arman Smagulov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var faculTable: UITableView!
    @IBOutlet weak var aboutTextField: UITextView!
    
    //Массив с факультетами
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadDataAbout()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func loadDataAbout() {
        
        //Создаем обьект Изображения Логотипа
        let imageMain = UIImage(named: "main-logo")
        
        //Создаем объект Объект Прикрепленной информации
        let attachment = NSTextAttachment()
        
        guard let img = imageMain else { return }
        guard let mainSize = aboutTextField?.contentSize else { return }
        
        // Ресайзим изображение
        attachment.image = resizeImage(imageM: img, targetSize: mainSize)
        
        //Ложим изображение в новую переменную
        let attString = NSAttributedString(attachment: attachment)
        //И загружаем изображение в TextView в начало блока
        aboutTextField?.textStorage.insert(attString, at: aboutTextField.selectedRange.location)
        
        // Объявляем наш текст
        let textMain = "Алматинский университет энергетики и связи создан 10 января 1997 г. на базе Алматинского Энергетического Института \n Является первым негосударственным техническим вузом со статусом некоммерческой организации. Обучение ведется на казахском и русском языках. В 2013 году начато обучение на английском языке пока по двум специальностям: «Радиотехника, электроника и телекоммуникации» и «Электроэнергетика». \n Контакты: \n Адрес: Алматы, ул. А. Байтурсынова 126 \n Телефон: +7(727) 292 07 72 \n Факс: +7(727) 292 50 57 \n Электронная почта: aipet@aipet.kz"
        
        // Добавляем наш текст в TextView
        aboutTextField?.textStorage.append(NSAttributedString(string: textMain))
        
        
        
    }
    
    // Функция ресайза изображения (its magic)
    func resizeImage(imageM:UIImage, targetSize:CGSize) -> UIImage? {
        let originalSize = imageM.size
        
        let widthRatio = targetSize.width / originalSize.width
        let heightRatio = targetSize.height / originalSize.height
        
        let ratio = min(widthRatio, heightRatio)
        
        let newSize = CGSize(width: originalSize.width * ratio, height: originalSize.height * ratio)
        
        // preparing rect for new image size
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, UIScreen.main.scale)
        imageM.draw(in: rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


