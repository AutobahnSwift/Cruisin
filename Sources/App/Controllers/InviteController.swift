import Vapor
import Leaf

final class InviteController: RouteCollection {
    func boot(router: Router) throws {
        router.get(use: index)
        router.post(use: submit)
    }
    
    func index(_ req: Request) throws -> Future<View> {
        let context = IndexContent(title: "Hello",
                                   appIconUrl: "https://is3-ssl.mzstatic.com/image/thumb/Purple5/v4/10/66/f2/1066f26a-133d-d76e-28e5-fa88e1994000/pr_source.png/340x340bb-80.png",
                                   formToken: "")
        return try req.leaf().render("index", context)
    }

    func submit(_ req: Request) throws -> Future<View> {
        return try req.content.decode(SubmitContent.self).flatMap(to: View.self) { data in
            let context = IndexContent(title: "Submit",
                                       message: "Here is a message that should be shown",
                                       messageType: .success,
                                       formToken: "")
            // TODO: Remove me
            sleep(3)
            return try req.leaf().render("index", context)
        }
    }
}

extension Request {
    func leaf() throws -> LeafRenderer {
        return try self.make(LeafRenderer.self)
    }
}

enum MessageType: String, Codable {
    case success
    case warning
    case danger
}

struct IndexContent: Encodable {
    let title: String
    let message: String?
    let messageType: String?
    let appIconUrl: String?
    let formToken: String

    init(title: String,
         message: String? = nil,
         messageType: MessageType? = nil,
         appIconUrl: String? = nil,
         formToken: String
        ) {
        self.title = title
        self.message = message
        self.messageType = messageType?.rawValue
        self.appIconUrl = appIconUrl
        self.formToken = formToken
    }
}

struct SubmitContent: Content {
    static var defaultMediaType = MediaType.urlEncodedForm
    let firstName: String
    let lastName: String
    let email: String
}
