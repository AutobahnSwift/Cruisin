import Vapor

protocol CacheService: Service {
    subscript(_ key: String) -> String? { get set }
}

final class InMemoryCacheService: CacheService {
    private var data = [String: String]()
    subscript(_ key: String) -> String? {
        get {
            return data[key]
        }
        set {
            data[key] = newValue
        }
    }
}
