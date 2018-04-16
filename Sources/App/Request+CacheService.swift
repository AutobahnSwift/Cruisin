import Vapor

extension Request {
    /// Returns the current session or creates one. `nil` if no session exists.
    func cache() throws -> CacheService {
        return try make(CacheService.self, for: Request.self)
    }
}

