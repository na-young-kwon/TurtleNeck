//
//  ResultDescriptionView.swift
//  TurtleNeck
//
//  Created by Sunwoo on 2022/12/30.
//

import SwiftUI

struct ResultDescriptionView: View {
    let score: Int
    let degree: Double
    let result: Result
    let validity: Double
    
    var body: some View {
        VStack (spacing: 10){
            HStack {
                Text("Date")
                    .foregroundColor(Color(.systemGray4))
                Spacer()
                Text(Date(), style: .date)
                    .foregroundColor(.deepBlue)
                    .bold()
            }
            HStack {
                Text("Grade")
                    .foregroundColor(Color(.systemGray4))
                Spacer()
                Text("\(result.star)")
                    .foregroundColor(.deepBlue)
                    .bold()
            }
            HStack {
                Text("Degree")
                    .foregroundColor(Color(.systemGray4))
                Spacer()
                Text("\(String(Int(degree)))º")
                    .foregroundColor(.deepBlue)
                    .bold()
            }
            HStack {
                Text("Data Validity")
                    .foregroundColor(Color(.systemGray4))
                Spacer()
                Text("\(String(validity))%")
                    .foregroundColor(.deepBlue)
                    .bold()
            }
            HStack {
                Text("Total Score")
                    .foregroundColor(Color(.systemGray4))
                Spacer()
                Text("\(score)")
                    .foregroundColor(.deepBlue)
                    .bold()
            }
            HStack {
                Text("Provided by")
                    .foregroundColor(Color(.systemGray4))
                Spacer()
                Text("Turtle Neck")
                    .foregroundColor(.deepBlue)
                    .bold()
            }
        }
        .font(.footnote)
        .padding()
    }
}

struct ResultDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ResultDescriptionView(score: 50, degree: 30, result: .veryGood, validity: 66.6)
    }
}
