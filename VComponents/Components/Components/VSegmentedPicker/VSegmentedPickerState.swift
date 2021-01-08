//
//  VSegmentedPickerState.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 1/7/21.
//

import Foundation

// MARK:- V Segmented Picker State
public enum VSegmentedPickerState: Int, CaseIterable {
    case enabled
    case disabled
    
    var isDisabled: Bool {
        switch self {
        case .enabled: return false
        case .disabled: return true
        }
    }
}

// MARK:- V Segmented Picker Row State
enum VSegmentedPickerRowState {
    case enabled
    case pressed
    case disabled
    
    init(isEnabled: Bool, isPressed: Bool) {
        if isPressed && isEnabled {
            self = .pressed
        } else {
            switch isEnabled {
            case true: self = .enabled
            case false: self = .disabled
            }
        }
    }
}
