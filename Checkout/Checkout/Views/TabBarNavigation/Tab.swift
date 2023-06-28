//
//  Tab.swift
//  Checkout
//
//  Created by Alan Morford on 4/24/23.
//

enum Tab: String {
    case scenarios
    case history
    case shopping
    case cart
    case settings
    case demo
    
    static var startingTab: Tab {
        return .demo
    }
}

extension Tab: Codable {
    
    enum Key: CodingKey {
        case rawValue
    }
    
    enum CodingError: Error {
        case unknownValue
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        let rawValue = try container.decode(String.self, forKey: .rawValue)
        switch rawValue {
        case "scenarios":
            self = .scenarios
        case "history":
            self = .history
        case "shopping":
            self = .shopping
        case "cart":
            self = .cart
        case "settings":
            self = .settings
        case "demo":
            self = .demo
        default:
            throw CodingError.unknownValue
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Key.self)
        switch self {
        case .scenarios:
            try container.encode("scenarios", forKey: .rawValue)
        case .history:
            try container.encode("history", forKey: .rawValue)
        case .shopping:
            try container.encode("shopping", forKey: .rawValue)
        case .cart:
            try container.encode("cart", forKey: .rawValue)
        case .settings:
            try container.encode("settings", forKey: .rawValue)
        case .demo:
            try container.encode("demo", forKey: .rawValue)
        }
    }
    
}
