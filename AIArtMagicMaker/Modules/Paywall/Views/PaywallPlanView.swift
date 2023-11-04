//
//  PaywallPlanView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 27.06.2023.
//

import SwiftUI

struct PaywallPlanView: View {

    // MARK: - Public Properties
    let plan: PaywallPlan
    let isSelected: Bool
    let onTap: () -> Void

    // MARK: - Private Properties
    private var planPrice: String { plan.price ?? "$#.##" }
    private var planPeriod: String { plan.period ?? "####" }
    private let borderRadius: CGFloat = 16

    // MARK: - Body
    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 12) {
                (isSelected ? Image.checkmarkCircle : .circleIcon)
                    .resizableToFit(width: 28, height: 28)
                    .foregroundStyle(isSelected ? LinearGradient.primaryGradient : .paywallChackmarkInactive)

                Text("\(planPrice) / \(planPeriod.capitalized)")
                    .font(.system(size: 18, weight: .semibold))

                if let pricePerWeek = plan.pricePerWeek {
                    Text("(\(pricePerWeek) / Week)")
                        .font(.system(size: 14, weight: .regular))
                }

                Spacer()
            }
            .foregroundColor(.primaryText)
            .frame(height: 64)
            .padding(.leading, 24)
        }
        .background {
            RoundedRectangle(cornerRadius: borderRadius)
                .stroke(isSelected ? LinearGradient.pageIndicatorActive : LinearGradient.paywallItemInactive, lineWidth: 2)
                .foregroundColor(.clear)
        }
        .cornerRadius(borderRadius)
        .animation(.spring(), value: isSelected)
        .overlay(alignment: .topTrailing) {
            if plan.isYearly {
                Text("35% OFF")
                    .font(.system(size: 12, weight: .black))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)
                    .background(LinearGradient.pageIndicatorActive)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    .padding(.top, -18)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            }
        }
    }
}

struct PaywallPlanView_Previews: PreviewProvider {

    static var previews: some View {
        let planWeek = PaywallPlan(id: "", price: "$300", period: "week", pricePerWeek: nil, priceValue: 0.0)
        let planYearly = PaywallPlan(id: "", price: "$300", period: "year", pricePerWeek: nil, priceValue: 0.0)

        Group {
            PaywallPlanView(
                plan: planWeek,
                isSelected: true,
                onTap: {}
            )
            .previewDisplayName("Weekly")

            PaywallPlanView(
                plan: planYearly,
                isSelected: true,
                onTap: {}
            )
            .previewDisplayName("Selected Yearly")
        }
        .preferredColorScheme(.dark)
        .padding(.horizontal, 20)
    }
}
