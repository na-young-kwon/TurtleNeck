//
//  PhotoGuideView.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/12/20.
//

import SwiftUI

struct PhotoGuideView: View {
    let action: () -> Void
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.3).ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("사진 촬영 가이드 및 유의사항")
                    Spacer()
                    Button("x") {
                        action()
                    }
                }
                .font(.title3)
                .foregroundColor(.black)
                
                HStack {
                    Image("Pose1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Image("Pose2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("* 정확하게 보이도록 밝고 선명하게 촬영해주세요.")
                    Text("* 자세를 정확하게 분석하기 위해 좌측 혹은 우측을 보고 촬영해주세요.")
                    Text("요구 사항에 충족하지 않는 사진은 정확성에 영향을 미칠 수 있습니다.")
                        .foregroundColor(.red)
                }
                .font(.caption)
                
                Button(action: action) {
                    Text("확인")
                        .foregroundColor(.white)
                        .font(.body)
                        .frame(height: 35)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 30).fill(.black).opacity(0.8)
                        )
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical)
            .background(.white)
            .cornerRadius(10)
            .padding()
        }
    }
}

struct PhotoGuideView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoGuideView { }
    }
}
