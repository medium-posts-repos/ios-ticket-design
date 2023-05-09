//
//  CornerShadowView.swift
//  IOS-TicketDesign
//
//  Created by swornim-shah on 09/05/2023.
//

open class CorneredShadowView: BaseView {
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 16
    }
    
}
