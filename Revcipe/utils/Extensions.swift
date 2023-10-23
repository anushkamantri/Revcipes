//
//  File.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import Foundation
import SwiftUI

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        do  {
            let json = try JSONSerialization.jsonObject(with: data) as? [String:Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}

extension UIColor {
    static let lakeBlue = UIColor(red: 0.37, green:0.65, blue:0.98, alpha: 1)
}
