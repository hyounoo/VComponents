//
//  VMenuDemoView.swift
//  VComponentsDemo
//
//  Created by Vakhtang Kontridze on 2/1/21.
//

import SwiftUI
import VComponents

// MARK:- V Menu Demo View
struct VMenuDemoView: View {
    // MARK: Properties
    static let navigationBarTitle: String = "Menu"
    
    @State private var state: VMenuState = .enabled
}

// MARK:- Body
extension VMenuDemoView {
    var body: some View {
        VBaseView(title: Self.navigationBarTitle, content: {
            DemoView(component: component, settings: settings)
        })
    }
    
    private func component() -> some View {
        VMenu(
            preset: .secondary(),
            state: state,
            rows: [
                .withSystemIcon(action: {}, title: "One", name: "swift"),
                .withAssetIcon(action: {}, title: "Two", name: "Favorites"),
                .standard(action: {}, title: "Three"),
                .standard(action: {}, title: "Four"),
                .menu(title: "Five...", rows: [
                    .standard(action: {}, title: "One"),
                    .standard(action: {}, title: "Two"),
                    .standard(action: {}, title: "Three"),
                    .menu(title: "Four...", rows: [
                        .standard(action: {}, title: "One"),
                        .standard(action: {}, title: "Two"),
                    ])
                ])
            ],
            title: "Present"
        )
    }
    
    @ViewBuilder private func settings() -> some View {
        VSegmentedPicker(selection: $state, headerTitle: "State")
    }
}

// MARK:- Helpers
//extension VMenuState: VPickableTitledItem {
//}

// MARK:- Preview
struct VMenuDemoView_Previews: PreviewProvider {
    static var previews: some View {
        VMenuDemoView()
    }
}
