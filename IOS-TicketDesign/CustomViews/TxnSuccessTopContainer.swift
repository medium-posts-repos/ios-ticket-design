//
//  TxnSuccessTopContainer.swift
//  IOS-TicketDesign
//
//  Created by swornim-shah on 09/05/2023.
//

import UIKit

public class TxnSuccessTopContainer: BaseView {

    private final let mainContainer: CorneredShadowView = {
        let view = CorneredShadowView(backgroundColor: .white)
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    private final let txnAmountDescLabel: UILabel = {
        let label = UILabel()
        label.text = "Dear Swornim, you have successfully transfered NPR. 1.00 from AC 381###07079 to AC 371###06874."
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    public final let successTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private var topImageView: UIImageView = {
        let view = UIImageView(image: .init(named: "female_character_valid")) // Replace your congratulation image (Confetti)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    public override func setupViews() {
        stack(mainContainer)
        mainContainer.fillSuperview()
        mainContainer.stack(
                UIView().withHeight(24),
                topImageView.withHeight(80),
                UIView().withHeight(12),
                UIView().stack(successTitleLabel).padLeft(16).padRight(16).padBottom(12),
                UIView().stack(txnAmountDescLabel)
            ).padLeft(14).padRight(14)
    }
}
