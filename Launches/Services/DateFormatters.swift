//
//  DateFormatterManager.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import Foundation

var isoFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyyMMdd'T'HHmmssZ"
    return formatter
}()

var displayFormatter: DateFormatter = {
    let template = "MMMM dd, yyyy HH:mm:ss"
    let formatString = DateFormatter.dateFormat(fromTemplate: template, options: 0, locale: Locale.current)
    let formatter = DateFormatter()
    formatter.dateFormat = formatString
    return formatter
}()
