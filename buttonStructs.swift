//
//  buttonStructs.swift
//  pointsCountdown
//
//  Created by Aimee Arost on 1/23/22.
//

import Foundation
import SwiftUI


public struct SelectedButtonStyle: ButtonStyle {

    @Binding var isSelected: Bool

    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 20, height: 20)
            .clipShape(Circle())
            .background(isSelected ? Color.black : Color.green)
            .cornerRadius(10.0)
    }
}

public struct SelectedButtonStyle2: ButtonStyle {

    @Binding var isSelected2: Bool

    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 20, height: 20)
            .clipShape(Circle())
            .background(isSelected2 ? Color.black : Color.green)
            .cornerRadius(10.0)
    }
}

public struct SelectedButtonStyle3: ButtonStyle {

    @Binding var isSelected3: Bool

    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 20, height: 20)
            .clipShape(Circle())
            .background(isSelected3 ? Color.black : Color.green)
            .cornerRadius(10.0)
    }
}



