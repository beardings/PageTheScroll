//
//  ViewController.swift
//  PageTheScroll
//
//  Created by Nikolas Ponomarov on 22.08.17.
//  Copyright © 2017 Nikolas Ponomarov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView! // Делаем ссылку на использование скрола
    
    var images = [UIImageView]() // создаем масив изображений
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        var contentWidth: CGFloat = 0.0 // создаём переменную для размера прокручивания
        
        let scrollWidth = scrollView.frame.size.width
        
        // цыкл для добавления изображений и вывода этих изображений по центру экрана
        for x in 0...2 {
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            var newX: CGFloat = 0.0
            newX = scrollWidth / 2 + scrollWidth * CGFloat(x)
            
            contentWidth += newX
            
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x: newX - 75, y: (scrollView.frame.size.height / 2) - 75, width: 150, height: 150)
        }
        scrollView.clipsToBounds = false // отображение смены картинки не заисит теперь от понля скрола
        // прощадь прокручивания след экрана
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
    }
}

