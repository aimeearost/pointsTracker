//
//  pointsCountdownApp.swift
//  pointsCountdown
//
//  Created by Aimee Arost on 1/23/22.
//

import SwiftUI

@main
struct pointsCountdownApp: App {
    var body: some Scene {
        WindowGroup {
            
            let everyDayPointsCounter = EveryDayPointsCounter()
            ContentView().environmentObject(everyDayPointsCounter)
            
        }
    }
}
