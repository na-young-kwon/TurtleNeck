//
//  PoseCore.swift
//  TurtleNeck
//
//  Created by 권나영 on 2022/11/22.
//

import SwiftUI
import ComposableArchitecture

struct PoseCore: ReducerProtocol {
    struct State: Equatable {
        @BindableState var selectedImage: UIImage?
        @BindableState var isImagePickerPresented = false
        var imageData: Data?
        var isPoseRequest = false
        var tempResult: String
    }

    enum Action: BindableAction, Equatable {
        case confirmButtonTapped
        case inputSelectedImage(UIImage?)
        case binding(BindingAction<State>)
        case showImagePicker
        case poseResponse(TaskResult<String>)
    }
    
    @Dependency (\.poseClient) var poseClient
    
    var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .confirmButtonTapped:
                state.isPoseRequest = true
                state.imageData = state.selectedImage?.jpegData(compressionQuality: 1)
                
                return .task { [imageData = state.imageData] in
                    await .poseResponse(TaskResult {
                        try await self.poseClient.fetch(imageData ?? Data())
                    })
                }
                
            case .inputSelectedImage(let image):
                state.selectedImage = image
                return .none
                
            case .binding:
                return .none
                
            case .showImagePicker:
                state.isImagePickerPresented.toggle()
                return .none
                
            case .poseResponse(.success(let response)):
                state.isPoseRequest = false
                state.tempResult = response
                return .none
                
            case .poseResponse(.failure):
                state.isPoseRequest = false
                return .none
            }
        }
    }
}
