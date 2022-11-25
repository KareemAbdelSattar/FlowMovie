//
//  ErrorHandling.swift
//  FlowMovie
//
//  Created by kareem chetoos on 25/11/2022.
//

import Foundation

class ErrorHandling {
    func checkForError(with error: NetworkError) -> String {
        switch error {
        case .noConnection:
            return "No internet connection"
        case .failed:
            return "Can't decode the data"
        case .dataIsNil:
            return "Data is empty"
        case .notAuthentication:
            return "Not authentication"
        case .invalidResponse:
            return "Invalid response"
        case .emptyResult:
            return "No popular movies"
        }
    }
}
