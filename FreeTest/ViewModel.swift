//
//  ViewModel.swift
//  LesHabituesTest
//
//  Created by Mathias Erligmann on 10/03/2022.
//

import Foundation
import Alamofire

class ViewModel {
    
    var launches: [Launch]?
    
    func fetchLaunches(completion: @escaping () -> Void) {
        AF.request("https://api.spacexdata.com/v4/launches").responseDecodable(of: [Launch].self) { response in
            debugPrint(response)
            switch response.result {
            case .success(let launches):
                self.launches = launches
                self.launches?.sorted(by: { $0.date_unix > $1.date_unix })
                completion()
            case .failure(let error):
                break
            }
        }
    }
}
