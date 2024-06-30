//
//  ImageNetwork.swift
//  Lyfe
//
//  Created by 고세림 on 6/18/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation

protocol ImageNetworkInterface {
    func uploadUrl(completion: @escaping (Result<UploadUrlResponseDTO, NetworkError>) -> Void)
    func uploadImage(_ url: String, data: Data, completion: @escaping (Bool) -> Void)
}

final class ImageNetwork: NetworkService, ImageNetworkInterface {
    func uploadUrl(completion: @escaping (Result<UploadUrlResponseDTO, NetworkError>) -> Void) {
        let endpoint = APIEndpoint.imageUploadUrl()
        
        request(endpoint, method: .get) { (result: Result<UploadUrlResponseDTO, NetworkError>) in
            completion(result)
        }
    }
    
    func uploadImage(_ url: String, data: Data, completion: @escaping (Bool) -> Void) {
        upload(url, method: .put, data: data) { result in
            completion(result)
        }
    }
}
