//
//  VSpinnerModel.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 19.12.20.
//

import Foundation

// MARK:- V Spinner Model
/// Enum of models that describe UI
public enum VSpinnerModel {
    case continous(_ model: VSpinnerModelContinous = .init())
    case dashed(_ model: VSpinnerModelDashed = .init())
    
    public static let `default`: Self = .continous()
}
