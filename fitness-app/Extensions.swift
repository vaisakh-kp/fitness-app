//
//  ViewController.swift
//  fitness-app
//
//  Created by Asista Mac Mini on 12/06/21.
//

import UIKit

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}



extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}


struct Device {
    
    // Screen height.
    static var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    // Screen width.
    static var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
}
