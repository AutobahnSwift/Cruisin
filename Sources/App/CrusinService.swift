import Foundation
import Vapor

enum CruisinError: Error {
    case missingRequiredData
}

class CruisinService {
    let appId: String
    let user: String
    let password: String
    let testerGroupNames: [String]

    init() throws {
        guard let appId = Environment.get("ITC_APP_ID"),
            let user = Environment.get("ITC_USER"),
            let password = Environment.get("ITC_PASSWORD"),
            let testerGroupNames = Environment.get("ITC_APP_TESTER_GROUPS") else {
                throw CruisinError.missingRequiredData
        }
        self.appId = appId
        self.user = user
        self.password = password
        self.testerGroupNames = testerGroupNames.split(separator: ",").map(String.init)
    }

    func addTester(email: String, firstName: String, lastName: String) {

    }

    private func createTester(email: String, firstName: String, lastName: String) {

    }

    private func findAppTester(email: String, app: String) {
        
    }
}
