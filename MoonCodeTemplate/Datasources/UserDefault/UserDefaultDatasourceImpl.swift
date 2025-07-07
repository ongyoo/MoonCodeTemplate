//
//  UserDefaultDatasourceImpl.swift
//  MoonCodeTemplate
//
//  Created by Komsit Chusangthong on 8/7/2568 BE.
//

import Foundation

struct UserDefaultDatasourceImpl: UserDefaultDatasource {

    private let userDefault = UserDefaults.standard

    func set(value: String, key: String) {
        userDefault.set(value, forKey: key)
    }

    func get(key: String) -> String? {
        return userDefault.object(forKey: key) as? String
    }
}
