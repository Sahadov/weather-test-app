//
//  String.swift
//  WeatherAppTest
//
//  Created by Dmitry Volkov on 28/05/2025.
//

import Foundation

extension String {
    func formattedDateToRussian(style: String = "d MMMM") -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        inputFormatter.locale = Locale(identifier: "en_US_POSIX")

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = style
        outputFormatter.locale = Locale(identifier: "ru_RU")

        guard let date = inputFormatter.date(from: self) else {
            return nil
        }

        return outputFormatter.string(from: date)
    }
}
