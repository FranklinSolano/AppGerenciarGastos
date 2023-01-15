//
//  GetCurrentEmail.swift
//  AppGerenciarGastos
//
//  Created by Franklin  Stilhano on 1/15/23.
//

import Foundation
import FirebaseAuth

struct GetCurrentUserEmail{
    
    
    static var getCurrentUserEmail: String {
        if let user = Auth.auth().currentUser {
            if let email = user.email {
                let emailFormatted = email.replacingOccurrences(of: ".", with: "-").replacingOccurrences(of: "@", with: "-")
                return emailFormatted
            }
        }
        return ""
    }
}
