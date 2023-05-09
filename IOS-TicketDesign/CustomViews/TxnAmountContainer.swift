//
//  TxnAmountContainer.swift
//  IOS-TicketDesign
//
//  Created by swornim-shah on 09/05/2023.
//

import UIKit

public final class TxnAmountContainer: BaseView {
    
    public final let amountTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    public final let amountDescLabel: UILabel = {
        let label = UILabel()
        label.fontSize = 24
        label.textAlignment = .center
        return label
    }()
    
    public override func setupViews() {
        let mainContainer = UIView(backgroundColor: .white)
        mainContainer.stack(
            amountTitleLabel,
            amountDescLabel,
            spacing: 6,
            alignment: .center
        ).padTop(24).padBottom(28)
        
        stack(mainContainer)
    }
}
