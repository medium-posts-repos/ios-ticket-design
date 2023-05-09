//
//  ExpandCollapseView.swift
//  IOS-TicketDesign
//
//  Created by swornim-shah on 09/05/2023.
//


import UIKit

public class ExpandCollapseArchView: BaseView {
    
    public var buttonImage: UIImage? = nil {
        didSet {
            buttonImageView.image = buttonImage
        }
    }
    
    public final let buttonLabel: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(.required, for: .horizontal)
        label.sizeToFit()
        return label
    }()
    
    public final let buttonImageView: UIImageView = {
        let view = UIImageView(image: nil, contentMode: .scaleAspectFit)
        view.tintColor = .lightGray
        return view
    }()
    
    public lazy var actionButton: UIView = {
        let view = UIView(backgroundColor: .white)
        view.setBorder(radius: 16)
        view.hstack(
            buttonLabel,
            buttonImageView,
            spacing: 8
        ).padLeft(12).padRight(12).padBottom(8).padTop(8)
        
        return view
    }()
    
    public final let expandCollapse = ArchDashLineView()
        
    public override func setupViews() {
        
        addSubViews(expandCollapse, actionButton)
        NSLayoutConstraint.activate([
            expandCollapse.leadingAnchor.constraint(equalTo: leadingAnchor),
            expandCollapse.trailingAnchor.constraint(equalTo: trailingAnchor),
            expandCollapse.topAnchor.constraint(equalTo: topAnchor),
            expandCollapse.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            actionButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            actionButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
