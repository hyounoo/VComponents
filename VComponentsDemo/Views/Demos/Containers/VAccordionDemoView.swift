//
//  VAccordionDemoView.swift
//  VComponentsDemo
//
//  Created by Vakhtang Kontridze on 1/11/21.
//

import SwiftUI
import VComponents

// MARK:- V Accordion Demo View
struct VAccordionDemoView: View {
    // MARK: Properties
    static let navigationBarTitle: String = "Accordion"
    
    @State private var accordionState: VAccordionState = .expanded
    @State private var layoutType: BaseListLayoutTypeHelper = .default
    @State private var rowCount: Int = 5
    @State private var expandCollapseOnHeaderTap: Bool = true
    
    private var model: VAccordionModel {
        var model: VAccordionModel = .init()
        
        model.misc.expandCollapseOnHeaderTap = expandCollapseOnHeaderTap
        
        return model
    }
}

// MARK:- Body
extension VAccordionDemoView {
    var body: some View {
        VBaseView(title: Self.navigationBarTitle, content: {
            DemoView(
                type: layoutType.demoViewComponentContentType,
                hasLayer: false,
                component: component,
                settings: settings
            )
        })
    }
    
    private func component() -> some View {
            VAccordion(
                model: model,
                layout: layoutType.accordionlayoutType,
                state: $accordionState,
                headerTitle: "Lorem ipsum dolor sit amet",
                data: VBaseListDemoViewDataSource.rows(count: rowCount),
                rowContent: { VBaseListDemoViewDataSource.rowContent(title: $0.title, color: $0.color) }
            )
            .ifLet(
                layoutType.height,
                ifTransform: { (view, height) in
                    Group(content: {
                        view
                            .frame(height: height, alignment: .top)
                    })
                        .frame(maxHeight: .infinity, alignment: .top)
                },
                elseTransform: { view in
                    view
                        .frame(maxHeight: .infinity, alignment: .top)
                }
            )
    }
    
    @ViewBuilder private func settings() -> some View {
        VSegmentedPicker(selection: $accordionState, headerTitle: "State")
        
        VSegmentedPicker(selection: $layoutType, headerTitle: "Layout", footerTitle: layoutType.description)
            .frame(height: 110, alignment: .top)
        
        Stepper("Rows", value: $rowCount, in: 0...20)
        
        ToggleSettingView(isOn: $expandCollapseOnHeaderTap, title: "Expand/Collapse on Header Tap")
    }
}

// MARK:- Helpers
extension VAccordionState: VPickableTitledItem {
    public var pickerTitle: String {
        switch self {
        case .collapsed: return "Collapsed"
        case .expanded: return "Expanded"
        case .disabled: return "Disabled"
        }
    }
}

private extension BaseListLayoutTypeHelper {
    var accordionlayoutType: VAccordionLayoutType {
        switch self {
        case .fixed: return .fixed
        case .flexible: return .flexible
        case .constrained: return .flexible
        }
    }
}

// MARK:- Preview
struct VAccordionDemoView_Previews: PreviewProvider {
    static var previews: some View {
        VAccordionDemoView()
    }
}
