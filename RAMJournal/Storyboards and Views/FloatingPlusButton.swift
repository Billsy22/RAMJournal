//
//  FloatingPlusButton.swift
//  RAMJournal
//
//  Created by Taylor Bills on 7/22/19.
//  Copyright © 2019 Taylor Bills. All rights reserved.
//

import UIKit

class FloatingPlusButton: UIViewController {

    
    // MARK: -  Properties
    
    var floatingPlusButton: UIButton?
    // TODO: -  ADD IMAGE FOR BUTTON
//    var floatingPlusButtonImageName =
    static let floatingPlusButtonHeight: CGFloat = 75.0
    static let floatingPlusButtonWidth: CGFloat = 75.0
    static let floatingPlusButtonRoundFactor = FloatingPlusButton.floatingPlusButtonHeight/2
    let trailingValue: CGFloat = 15.0
    let leadingValue: CGFloat = 15.0
    
    
    // MARK: -  Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: -  UIMethods
    
    func createFloatingPlusButton() {
        floatingPlusButton = UIButton(type: .custom)
        floatingPlusButton?.translatesAutoresizingMaskIntoConstraints = false
        floatingPlusButton?.backgroundColor = .white
//        floatingPlusButton?.setImage(<#T##image: UIImage?##UIImage?#>, for: <#T##UIControl.State#>)
    }
}
