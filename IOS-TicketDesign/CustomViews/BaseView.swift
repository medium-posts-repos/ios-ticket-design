//
//  BaseView.swift
//  IOS-TicketDesign
//
//  Created by swornim-shah on 09/05/2023.
//

import UIKit

open class BaseView: UIView {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }

    public func setupViews() {
        
    }
}
