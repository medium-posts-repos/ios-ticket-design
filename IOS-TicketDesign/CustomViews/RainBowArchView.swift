//
//  RainBowArchView.swift
//  IOS-TicketDesign
//
//  Created by swornim-shah on 09/05/2023.
//

import UIKit

public final class RainBowArchView: BaseView {
    public override func setupViews() {}
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        toRainbowsArcLayer(radius: 10)
    }
}
