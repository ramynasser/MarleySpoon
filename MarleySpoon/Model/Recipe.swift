//
//  Recipe.swift
//  MarleySpoon (iOS)
//
//  Created by Ramy Nasser on 07/09/2021.
//

import Contentful

public final class Recipe: EntryDecodable, FieldKeysQueryable, Identifiable {
    public static let contentTypeId: String = "recipe"

    public let id: String
    public let localeCode: String?
    public let updatedAt: Date?
    public let createdAt: Date?

    public let title: String?
    public let description: String?
    public let calories: Int?

    // Linked fields
    public var chef: Chef?
    public var photo: Asset?
    public var tags: [Tag]?

    public init(title: String?, description: String?, calories: Int?, chef: Chef?, tags: [Tag]) {
        self.title = title
        self.description = description
        self.calories = calories
        self.chef = chef
        self.tags = tags

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

        let fields = try decoder.contentfulFieldsContainer(keyedBy: Recipe.FieldKeys.self)

        title = try fields.decodeIfPresent(String.self, forKey: .title)
        description = try fields.decodeIfPresent(String.self, forKey: .description)
        calories = try fields.decodeIfPresent(Int.self, forKey: .calories)

        try fields.resolveLink(forKey: .chef, decoder: decoder) { [weak self] linkedChef in
            self?.chef = linkedChef as? Chef
        }

        try fields.resolveLink(forKey: .photo, decoder: decoder) { [weak self] photo in
            self?.photo = photo as? Asset
        }

        try fields.resolveLinksArray(forKey: .tags, decoder: decoder) { [weak self] tags in
            self?.tags = tags as? [Tag]
        }
    }

    public enum FieldKeys: String, CodingKey {
        case title, description, tags, chef, photo, calories, name
    }
}
