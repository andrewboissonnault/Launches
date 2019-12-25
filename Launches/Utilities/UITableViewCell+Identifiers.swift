//
//  UITableViewCell+Identifiers.swift
//  Launches
//
//  Created by Andrew Boissonnault on 12/23/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import UIKit

extension UITableView {
    func dequeueReusableCell(identifier: CellIdentifiers, for indexPath: IndexPath) -> UITableViewCell {
        return self.dequeueReusableCell(withIdentifier: identifier.rawValue, for: indexPath)
    }
}
