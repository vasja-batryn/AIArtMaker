//
//  PaywallPlansList.swift
//  AIArtMagicMaker
//
//  Created by Yurii Marhitych on 28.06.2023.
//

import SwiftUI

struct PaywallPlansList: View {
    
    // MARK: - Public Properties
    let plans: [PaywallPlan]
    @Binding var selectedPlan: PaywallPlan?
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 10) {
            ForEach(plans) { plan in
                PaywallPlanView(plan: plan, isSelected: selectedPlan == plan) {
                    selectedPlan = plan
                }
            }
        }
    }
}

struct PaywallPlansList_Previews: PreviewProvider {
    
    static var previews: some View {
        PaywallPlansList(
            plans: [],
            selectedPlan: .constant(
                PaywallPlan.init(
                    id: "",
                    price: "300",
                    period: "week",
                    pricePerWeek: nil,
                    priceValue: 0.0))
        )
        .preferredColorScheme(.dark)
    }
}
