//===----------------------------------------------------------------------===//
//
// This source file is part of the SwiftAWSLambdaRuntime open source project
//
// Copyright SwiftAWSLambdaRuntime project authors
// Copyright (c)Amazon.com, Inc. or its affiliates.
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of SwiftAWSLambdaRuntime project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

import HTTPTypes

#if canImport(FoundationEssentials)
import class FoundationEssentials.JSONEncoder
import struct FoundationEssentials.Data
#else
import class Foundation.JSONEncoder
import struct Foundation.Data
#endif

extension Encodable {
    fileprivate func string() throws -> String {
        let encoded = try JSONEncoder().encode(self)
        return String(decoding: encoded, as: UTF8.self)
    }
}

extension APIGatewayResponse {

    public init<Input: Encodable>(
        statusCode: HTTPResponse.Status,
        headers: HTTPHeaders? = nil,
        multiValueHeaders: HTTPMultiValueHeaders? = nil,
        encodableBody: Input
    ) throws {
        self.init(
            statusCode: statusCode,
            headers: headers,
            multiValueHeaders: multiValueHeaders,
            body: try encodableBody.string(),
            isBase64Encoded: nil
        )
    }
}

extension APIGatewayV2Response {

    public init<Input: Encodable>(
        statusCode: HTTPResponse.Status,
        headers: HTTPHeaders? = nil,
        encodableBody: Input,
        cookies: [String]? = nil
    ) throws {
        self.init(
            statusCode: statusCode,
            headers: headers,
            body: try encodableBody.string(),
            isBase64Encoded: nil,
            cookies: cookies
        )
    }
}
