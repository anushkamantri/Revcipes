//
//  Errors.swift
//  Revcipe
//
//  Created by Lucy Liu on 10/20/23.
//

protocol ErrorWithMessage: Error {
    var message: String { get }
}

enum AuthError: ErrorWithMessage {
    case NotLoggedInError(String)
    var message: String {
        switch self {
        case .NotLoggedInError(let message):
            return message
        }
    }
    
    
}

enum AddItemError: ErrorWithMessage {
    case InvalidItemError(String)
    case ItemExistedError(String)
    
    var message: String {
        switch self {
        case .InvalidItemError(let message):
            return message
        case .ItemExistedError(let message):
            return message
        }
    }
}
