//
//  ChartView.swift
//  pointsCountdown
//
//  Created by Aimee Arost on 6/20/22.
//

import SwiftUI
import SwiftUICharts



struct ChartView: View {

    var weightView = WeightView()

    @State var weightArray: [Double] =  []


    var body: some View {
        VStack {


            LineView(data: weightArray, title: "Weight History")
                .padding(25)
        }.onAppear() {
            weightArray = (weightView.items7.map{$0.weightDouble}).reversed()
            print("weightArray: \(weightArray)")
        }

    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}



