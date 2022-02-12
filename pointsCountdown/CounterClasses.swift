//
//  CounterClasses.swift
//  pointsCountdown
//
//  Created by Aimee Arost on 2/11/22.
//

import Foundation
import SwiftUI

class EveryDayPointsCounter: ObservableObject {

    @AppStorage("everyDayPointsCounterValue") var everyDayPointsCounterValue: Int = 0
    @AppStorage("weekPointsCounterValue") var weekPointsCounterValue: Int = 0

//    func increment() {
//        DispatchQueue.main.async {
//            self.everyDayPointsCounterValue += 1
//        }
//    }
}
