//
//  PickerView.swift
//  AIArtMagicMaker
//
//  Created by Vasja Batryn on 19.07.2023.
//

import SwiftUI

struct PickerView: View {

    // MARK: - Public Properties
    let types: [GenerationType]
    @Binding var selectedTab: GenerationType

    // MARK: - Private Properties
    @Namespace private var animation

    // MARK: - Body
    var body: some View {
        HStack(spacing: 0) {
            ForEach(types) { tab in
                Text(tab.rawValue)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(selectedTab == tab ? Color.black : .white)
                    .opacity(selectedTab == tab ? 1 : 0.7)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity)
                    .background {
                        if selectedTab == tab {
                            Capsule()
                                .fill(Color.primaryText)
                                .matchedGeometryEffect(id: "tab", in: animation)
                        }
                    }
                    .onTapGesture {
                        withAnimation {
                            selectedTab = tab
                        }
                    }
            }
        }
        .padding(4)
        .background(
            Capsule()
                .fill(Color.secondaryBackground)
        )
    }
}

struct PickerView_Previews: PreviewProvider {
    
    static var previews: some View {
        PickerView(types: GenerationType.allCases, selectedTab: .constant(.fromImage))
            .preferredColorScheme(.dark)
    }
}
