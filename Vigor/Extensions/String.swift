//
//  String.swift
//  Vigor
//  File for vaildation of email using regular expression.
//  Created by Nathan Grasso on 4/18/23.
//

import Foundation

extension String{
    
    func isValidEmail() -> Bool{
        
        let regex = try! NSRegularExpression(pattern: "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$", options: .caseInsensitive)
        
        return regex.firstMatch(in: self, range: NSRange(location: 0, length: count)) != nil
    }
}
