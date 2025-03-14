//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension TestSpec {

    /** Has path and operation parameters */
    public enum GetMultipleParams {

        public static let service = APIService<Response>(id: "getMultipleParams", tag: "", method: "GET", path: "/multiple-path-params{petID}", hasBody: false, securityRequirements: [SecurityRequirement(type: "test_auth", isRequired: true, scopes: ["read"])])

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** The id of the pet */
                public var petId: String

                /** The id of the pet */
                public var userId: String

                public init(petId: String, userId: String) {
                    self.petId = petId
                    self.userId = userId
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: GetMultipleParams.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(petId: String, userId: String) {
                let options = Options(petId: petId, userId: userId)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "petId" + "}", with: "\(self.options.petId)").replacingOccurrences(of: "{" + "userId" + "}", with: "\(self.options.userId)")
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = Void

            /** Invalid input */
            case status405

            public var success: Void? {
                switch self {
                default: return nil
                }
            }

            public var response: Any {
                switch self {
                default: return ()
                }
            }

            public var statusCode: Int {
                switch self {
                case .status405: return 405
                }
            }

            public var successful: Bool {
                switch self {
                case .status405: return false
                }
            }

            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                case 405: self = .status405
                default: throw APIClientError.unexpectedStatusCode(statusCode: statusCode, data: data)
                }
            }

            public var description: String {
                return "\(statusCode) \(successful ? "success" : "failure")"
            }

            public var debugDescription: String {
                var string = description
                let responseString = "\(response)"
                if responseString != "()" {
                    string += "\n\(responseString)"
                }
                return string
            }
        }
    }
}
