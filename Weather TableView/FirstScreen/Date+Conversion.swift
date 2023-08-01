//
//  Date+Conversion.swift
//  Weather TableView
//
//  Created by MacOs on 19.07.2023.
//

import Foundation
extension Date {
   public func dateToString( dateFormat format : String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
