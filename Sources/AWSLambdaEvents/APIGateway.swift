//===----------------------------------------------------------------------===//
//
// This source file is part of the SwiftAWSLambdaRuntime open source project
//
// Copyright (c) 2017-2022 Apple Inc. and the SwiftAWSLambdaRuntime project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of SwiftAWSLambdaRuntime project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

import HTTPTypes

import class Foundation.JSONEncoder

// https://docs.aws.amazon.com/lambda/latest/dg/services-apigateway.html
// https://docs.aws.amazon.com/apigateway/latest/developerguide/set-up-lambda-proxy-integrations.html

/// `APIGatewayRequest` contains data coming from the API Gateway.
public struct APIGatewayRequest: Codable {
    public struct Context: Codable {
        public struct Identity: Codable {
            public let cognitoIdentityPoolId: String?

            public let apiKey: String?
            public let userArn: String?
            public let cognitoAuthenticationType: String?
            public let caller: String?
            public let userAgent: String?
            public let user: String?

            public let cognitoAuthenticationProvider: String?
            public let sourceIp: String?
            public let accountId: String?
        }

        public struct Authorizer: Codable {
            public let claims: [String: String]?
        }

        public let resourceId: String
        public let apiId: String
        public let domainName: String?
        public let resourcePath: String
        public let httpMethod: String
        public let requestId: String
        public let accountId: String
        public let stage: String

        public let identity: Identity
        public let authorizer: Authorizer?
        public let extendedRequestId: String?
        public let path: String
    }

    public let resource: String
    public let path: String
    public let httpMethod: HTTPRequest.Method

    public let queryStringParameters: [String: String]?
    public let multiValueQueryStringParameters: [String: [String]]?
    public let headers: HTTPHeaders
    public let multiValueHeaders: HTTPMultiValueHeaders
    public let pathParameters: [String: String]?
    public let stageVariables: [String: String]?

    public let requestContext: Context
    public let body: String?
    public let isBase64Encoded: Bool
}

// MARK: - Response -

public struct APIGatewayResponse: Codable {
    public var statusCode: HTTPResponse.Status
    public var headers: HTTPHeaders?
    public var multiValueHeaders: HTTPMultiValueHeaders?
    public var body: String?
    public var isBase64Encoded: Bool?

    public init(
        statusCode: HTTPResponse.Status,
        headers: HTTPHeaders? = nil,
        multiValueHeaders: HTTPMultiValueHeaders? = nil,
        body: String? = nil,
        isBase64Encoded: Bool? = nil
    ) {
        self.statusCode = statusCode
        self.headers = headers
        self.multiValueHeaders = multiValueHeaders
        self.body = body
        self.isBase64Encoded = isBase64Encoded
    }
}

#if swift(>=5.6)
extension APIGatewayRequest: Sendable {}
extension APIGatewayRequest.Context: Sendable {}
extension APIGatewayRequest.Context.Identity: Sendable {}
extension APIGatewayRequest.Context.Authorizer: Sendable {}
extension APIGatewayResponse: Sendable {}
#endif
