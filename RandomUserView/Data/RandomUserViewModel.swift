//
//  RandomUserViewModel.swift
//  RandomUserView1
//
//  Created by DalHyun Nam on 2023/04/16.
//

import Foundation
import Combine
import Alamofire

class RandomUserViewModel: ObservableObject {
    // MARK: - Properties
    var subscription = Set<AnyCancellable>()
    
    @Published var randomUsers = [RandomUser]()
    
    var baseUrl = "https://randomuser.me/api/?results=100"

    init() {
        print(#fileID,#function,#line, "")
        fetchRandomUsers()
    }
    
    func fetchRandomUsers() {
        print(#fileID,#function,#line, "")
        AF.request(baseUrl)
            .publishDecodable(type: RandomUserResponse.self)
            .compactMap{ $0.value }
            .map{ $0.results }
            .sink { completion in
                print("데이터스트림 완료")
            } receiveValue: { receivedValue in
                print("받은 값 : \(receivedValue.count)")
                self.randomUsers = receivedValue
            }.store(in: &subscription)
    }
    
}
