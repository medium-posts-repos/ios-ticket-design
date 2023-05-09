//
//  ArchDashlineView.swift
//  IOS-TicketDesign
//
//  Created by swornim-shah on 09/05/2023.
//

import UIKit

public class ArchDashLineView: BaseView {
    public override func setupViews() {}
              
    public override func layoutSubviews() {
        super.layoutSubviews()
        toArchDashline(radius: 10, fillColor: .white)
    }
}
