//
//  ReceiptConfirmationView.swift
//  IOS-TicketDesign
//
//  Created by swornim-shah on 09/05/2023.
//

import UIKit

public struct Option: Codable {
    public var label: String?
    public var value: String?
    
    public init(label: String, value: String) {
        self.label = label
        self.value = value
    }
    
    public init() {
        
    }
}

public class ReceiptConfirmationView: BaseView {
    
    public var options: [Option] = [] {
        didSet {
            options.forEach {
                let view = KeyValueLabelView(key: $0.label, value: $0.value)
                view.valueLabel.textAlignment = .right
                
                receiptStack.addArrangedSubview(
                    UIView().stack(
                        view,
                        UIView().withHeight(14)
                    ).padLeft(16).padRight(8)
                )
            }
        }
    }
    
    private lazy var receiptStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        return view
    }()
    
    public override func setupViews() {
        backgroundColor = .white
        stack(receiptStack).padTop(12).padBottom(8)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
    }
}
