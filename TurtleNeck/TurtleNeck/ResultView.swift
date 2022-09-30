//
//  ResultView.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/09/29.
//

import SwiftUI

struct ResultView: View {
    
    var body: some View {
        ProgressView("결과 분석중...")
            .tint(.orange)
            .padding()
            .progressViewStyle(.circular)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}