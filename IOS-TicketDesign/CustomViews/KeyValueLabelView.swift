//
//  KeyValueLabelView.swift
//  IOS-TicketDesign
//
//  Created by swornim-shah on 09/05/2023.
//

import UIKit

public class KeyValueLabelView: BaseView {
        
    lazy public var plainContainerView: UIView = UIView()
    
    lazy public var keyTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        return label
    }()
    
    lazy public var valueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkText
        return label
    }()
    
    public convenience init(key:String?, value: String?) {
        self.init()
        self.keyTitleLabel.text = key
        self.valueLabel.text = value
    }
    
    public convenience init(key:String?, value: NSAttributedString?) {
        self.init()
        self.keyTitleLabel.text = key
        self.valueLabel.attributedText = value
    }
    
    public override func setupViews() {
        addSubview(plainContainerView)
        plainContainerView.fillSuperview()
        
        let rightContainer = UIView()
        rightContainer.stack(
            valueLabel
        )
        
        let leftContainer = UIView()
        leftContainer.stack(
            keyTitleLabel
        )
        
        let middleContainer = UIView()
        
        plainContainerView.addSubViews(leftContainer,middleContainer, rightContainer)
        
        NSLayoutConstraint.activate([
            middleContainer.topAnchor.constraint(equalTo: plainContainerView.topAnchor),
            middleContainer.centerXAnchor.constraint(equalTo: plainContainerView.centerXAnchor),
            middleContainer.widthAnchor.constraint(equalToConstant: 16),
            
            leftContainer.leadingAnchor.constraint(equalTo: plainContainerView.leadingAnchor),
            leftContainer.trailingAnchor.constraint(equalTo: middleContainer.leadingAnchor),
            leftContainer.topAnchor.constraint(equalTo: plainContainerView.topAnchor),
            leftContainer.bottomAnchor.constraint(equalTo: plainContainerView.bottomAnchor),
            
            rightContainer.leadingAnchor.constraint(equalTo: middleContainer.trailingAnchor),
            rightContainer.trailingAnchor.constraint(equalTo: plainContainerView.trailingAnchor),
            rightContainer.topAnchor.constraint(equalTo: plainContainerView.topAnchor),
            rightContainer.bottomAnchor.constraint(equalTo: plainContainerView.bottomAnchor)
        ])
    }
}
