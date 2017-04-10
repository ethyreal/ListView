//
//  Stackable.swift
//  ListViewExamples
//
//  Created by George Webster on 4/9/17.
//  Copyright © 2017 George Webster. All rights reserved.
//

import UIKit

protocol Stackable {

    func stackView() -> UIStackView?
    
    func makeStackView() -> UIStackView
    
    func addArrangedSubview(_ subview:UIView)
}


extension Stackable {

    func makeStackView() -> UIStackView {
        let stackView = UIStackView(frame:.zero)
        stackView.axis = .vertical
        return stackView
    }
}

extension Stackable where Self: UIViewController {
    
    func stackView() -> UIStackView? {
        return self.view as? UIStackView
    }

    func addArrangedSubview(_ subview:UIView) {
        
        self.stackView()?.addArrangedSubview(subview)
    }

}
