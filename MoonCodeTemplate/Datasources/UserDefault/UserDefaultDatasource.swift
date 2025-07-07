//
//  UserDefaultDatasource.swift
//  MoonCodeTemplate
//
//  Created by Komsit Chusangthong on 8/7/2568 BE.
//

import Foundation

protocol UserDefaultDatasource {
    func set(value: String, key: String)
    func get(key: String) -> String?
}
