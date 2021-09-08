//
//  Chef.swift
//  MarleySpoon (iOS)
//
//  Created by Ramy Nasser on 08/09/2021.
//

import Contentful

public final class Chef: EntryDecodable, FieldKeysQueryable {
    public static let contentTypeId: String = "chef"

    public let id: String
    public let localeCode: String?
    public let updatedAt: Date?
    public let createdAt: Date?

    public let name: String?

    // for creating test objects
    public init(name: String) {
        self.name = name
        id = ""
        localeCode = "en-US"
        createdAt = Date()
        updatedAt = Date()
    }

    public required init(from decoder: Decoder) throws {
        let sys = try decoder.sys()
        id = sys.id
        localeCode = sys.locale
        updatedAt = sys.updatedAt
        createdAt = sys.createdAt

        let fields = try decoder.contentfulFieldsContainer(keyedBy: Chef.FieldKeys.self)

        name = try fields.decodeIfPresent(String.self, forKey: .name)
    }

    public enum FieldKeys: String, CodingKey {
        case name
    }
}
