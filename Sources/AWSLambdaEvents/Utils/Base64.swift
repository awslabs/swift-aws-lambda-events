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

//===----------------------------------------------------------------------===//
// This is a vendored version from:
// https://github.com/fabianfett/swift-base64-kit

struct Base64 {}

// MARK: - Encoding -

extension Base64 {
    public struct EncodingOptions: OptionSet {
        public let rawValue: UInt
        public init(rawValue: UInt) { self.rawValue = rawValue }

        public static let base64UrlAlphabet = EncodingOptions(rawValue: UInt(1 << 0))
        public static let omitPaddingCharacter = EncodingOptions(rawValue: UInt(1 << 1))
    }

    @usableFromInline
    static let encodePaddingCharacter: UInt8 = 61

    @usableFromInline
    static let encoding0: [UInt8] = [
        UInt8(ascii: "A"), UInt8(ascii: "A"), UInt8(ascii: "A"), UInt8(ascii: "A"), UInt8(ascii: "B"), UInt8(ascii: "B"), UInt8(ascii: "B"), UInt8(ascii: "B"), UInt8(ascii: "C"), UInt8(ascii: "C"),
        UInt8(ascii: "C"), UInt8(ascii: "C"), UInt8(ascii: "D"), UInt8(ascii: "D"), UInt8(ascii: "D"), UInt8(ascii: "D"), UInt8(ascii: "E"), UInt8(ascii: "E"), UInt8(ascii: "E"), UInt8(ascii: "E"),
        UInt8(ascii: "F"), UInt8(ascii: "F"), UInt8(ascii: "F"), UInt8(ascii: "F"), UInt8(ascii: "G"), UInt8(ascii: "G"), UInt8(ascii: "G"), UInt8(ascii: "G"), UInt8(ascii: "H"), UInt8(ascii: "H"),
        UInt8(ascii: "H"), UInt8(ascii: "H"), UInt8(ascii: "I"), UInt8(ascii: "I"), UInt8(ascii: "I"), UInt8(ascii: "I"), UInt8(ascii: "J"), UInt8(ascii: "J"), UInt8(ascii: "J"), UInt8(ascii: "J"),
        UInt8(ascii: "K"), UInt8(ascii: "K"), UInt8(ascii: "K"), UInt8(ascii: "K"), UInt8(ascii: "L"), UInt8(ascii: "L"), UInt8(ascii: "L"), UInt8(ascii: "L"), UInt8(ascii: "M"), UInt8(ascii: "M"),
        UInt8(ascii: "M"), UInt8(ascii: "M"), UInt8(ascii: "N"), UInt8(ascii: "N"), UInt8(ascii: "N"), UInt8(ascii: "N"), UInt8(ascii: "O"), UInt8(ascii: "O"), UInt8(ascii: "O"), UInt8(ascii: "O"),
        UInt8(ascii: "P"), UInt8(ascii: "P"), UInt8(ascii: "P"), UInt8(ascii: "P"), UInt8(ascii: "Q"), UInt8(ascii: "Q"), UInt8(ascii: "Q"), UInt8(ascii: "Q"), UInt8(ascii: "R"), UInt8(ascii: "R"),
        UInt8(ascii: "R"), UInt8(ascii: "R"), UInt8(ascii: "S"), UInt8(ascii: "S"), UInt8(ascii: "S"), UInt8(ascii: "S"), UInt8(ascii: "T"), UInt8(ascii: "T"), UInt8(ascii: "T"), UInt8(ascii: "T"),
        UInt8(ascii: "U"), UInt8(ascii: "U"), UInt8(ascii: "U"), UInt8(ascii: "U"), UInt8(ascii: "V"), UInt8(ascii: "V"), UInt8(ascii: "V"), UInt8(ascii: "V"), UInt8(ascii: "W"), UInt8(ascii: "W"),
        UInt8(ascii: "W"), UInt8(ascii: "W"), UInt8(ascii: "X"), UInt8(ascii: "X"), UInt8(ascii: "X"), UInt8(ascii: "X"), UInt8(ascii: "Y"), UInt8(ascii: "Y"), UInt8(ascii: "Y"), UInt8(ascii: "Y"),
        UInt8(ascii: "Z"), UInt8(ascii: "Z"), UInt8(ascii: "Z"), UInt8(ascii: "Z"), UInt8(ascii: "a"), UInt8(ascii: "a"), UInt8(ascii: "a"), UInt8(ascii: "a"), UInt8(ascii: "b"), UInt8(ascii: "b"),
        UInt8(ascii: "b"), UInt8(ascii: "b"), UInt8(ascii: "c"), UInt8(ascii: "c"), UInt8(ascii: "c"), UInt8(ascii: "c"), UInt8(ascii: "d"), UInt8(ascii: "d"), UInt8(ascii: "d"), UInt8(ascii: "d"),
        UInt8(ascii: "e"), UInt8(ascii: "e"), UInt8(ascii: "e"), UInt8(ascii: "e"), UInt8(ascii: "f"), UInt8(ascii: "f"), UInt8(ascii: "f"), UInt8(ascii: "f"), UInt8(ascii: "g"), UInt8(ascii: "g"),
        UInt8(ascii: "g"), UInt8(ascii: "g"), UInt8(ascii: "h"), UInt8(ascii: "h"), UInt8(ascii: "h"), UInt8(ascii: "h"), UInt8(ascii: "i"), UInt8(ascii: "i"), UInt8(ascii: "i"), UInt8(ascii: "i"),
        UInt8(ascii: "j"), UInt8(ascii: "j"), UInt8(ascii: "j"), UInt8(ascii: "j"), UInt8(ascii: "k"), UInt8(ascii: "k"), UInt8(ascii: "k"), UInt8(ascii: "k"), UInt8(ascii: "l"), UInt8(ascii: "l"),
        UInt8(ascii: "l"), UInt8(ascii: "l"), UInt8(ascii: "m"), UInt8(ascii: "m"), UInt8(ascii: "m"), UInt8(ascii: "m"), UInt8(ascii: "n"), UInt8(ascii: "n"), UInt8(ascii: "n"), UInt8(ascii: "n"),
        UInt8(ascii: "o"), UInt8(ascii: "o"), UInt8(ascii: "o"), UInt8(ascii: "o"), UInt8(ascii: "p"), UInt8(ascii: "p"), UInt8(ascii: "p"), UInt8(ascii: "p"), UInt8(ascii: "q"), UInt8(ascii: "q"),
        UInt8(ascii: "q"), UInt8(ascii: "q"), UInt8(ascii: "r"), UInt8(ascii: "r"), UInt8(ascii: "r"), UInt8(ascii: "r"), UInt8(ascii: "s"), UInt8(ascii: "s"), UInt8(ascii: "s"), UInt8(ascii: "s"),
        UInt8(ascii: "t"), UInt8(ascii: "t"), UInt8(ascii: "t"), UInt8(ascii: "t"), UInt8(ascii: "u"), UInt8(ascii: "u"), UInt8(ascii: "u"), UInt8(ascii: "u"), UInt8(ascii: "v"), UInt8(ascii: "v"),
        UInt8(ascii: "v"), UInt8(ascii: "v"), UInt8(ascii: "w"), UInt8(ascii: "w"), UInt8(ascii: "w"), UInt8(ascii: "w"), UInt8(ascii: "x"), UInt8(ascii: "x"), UInt8(ascii: "x"), UInt8(ascii: "x"),
        UInt8(ascii: "y"), UInt8(ascii: "y"), UInt8(ascii: "y"), UInt8(ascii: "y"), UInt8(ascii: "z"), UInt8(ascii: "z"), UInt8(ascii: "z"), UInt8(ascii: "z"), UInt8(ascii: "0"), UInt8(ascii: "0"),
        UInt8(ascii: "0"), UInt8(ascii: "0"), UInt8(ascii: "1"), UInt8(ascii: "1"), UInt8(ascii: "1"), UInt8(ascii: "1"), UInt8(ascii: "2"), UInt8(ascii: "2"), UInt8(ascii: "2"), UInt8(ascii: "2"),
        UInt8(ascii: "3"), UInt8(ascii: "3"), UInt8(ascii: "3"), UInt8(ascii: "3"), UInt8(ascii: "4"), UInt8(ascii: "4"), UInt8(ascii: "4"), UInt8(ascii: "4"), UInt8(ascii: "5"), UInt8(ascii: "5"),
        UInt8(ascii: "5"), UInt8(ascii: "5"), UInt8(ascii: "6"), UInt8(ascii: "6"), UInt8(ascii: "6"), UInt8(ascii: "6"), UInt8(ascii: "7"), UInt8(ascii: "7"), UInt8(ascii: "7"), UInt8(ascii: "7"),
        UInt8(ascii: "8"), UInt8(ascii: "8"), UInt8(ascii: "8"), UInt8(ascii: "8"), UInt8(ascii: "9"), UInt8(ascii: "9"), UInt8(ascii: "9"), UInt8(ascii: "9"), UInt8(ascii: "+"), UInt8(ascii: "+"),
        UInt8(ascii: "+"), UInt8(ascii: "+"), UInt8(ascii: "/"), UInt8(ascii: "/"), UInt8(ascii: "/"), UInt8(ascii: "/"),
    ]

    @usableFromInline
    static let encoding1: [UInt8] = [
        UInt8(ascii: "A"), UInt8(ascii: "B"), UInt8(ascii: "C"), UInt8(ascii: "D"), UInt8(ascii: "E"), UInt8(ascii: "F"), UInt8(ascii: "G"), UInt8(ascii: "H"), UInt8(ascii: "I"), UInt8(ascii: "J"),
        UInt8(ascii: "K"), UInt8(ascii: "L"), UInt8(ascii: "M"), UInt8(ascii: "N"), UInt8(ascii: "O"), UInt8(ascii: "P"), UInt8(ascii: "Q"), UInt8(ascii: "R"), UInt8(ascii: "S"), UInt8(ascii: "T"),
        UInt8(ascii: "U"), UInt8(ascii: "V"), UInt8(ascii: "W"), UInt8(ascii: "X"), UInt8(ascii: "Y"), UInt8(ascii: "Z"), UInt8(ascii: "a"), UInt8(ascii: "b"), UInt8(ascii: "c"), UInt8(ascii: "d"),
        UInt8(ascii: "e"), UInt8(ascii: "f"), UInt8(ascii: "g"), UInt8(ascii: "h"), UInt8(ascii: "i"), UInt8(ascii: "j"), UInt8(ascii: "k"), UInt8(ascii: "l"), UInt8(ascii: "m"), UInt8(ascii: "n"),
        UInt8(ascii: "o"), UInt8(ascii: "p"), UInt8(ascii: "q"), UInt8(ascii: "r"), UInt8(ascii: "s"), UInt8(ascii: "t"), UInt8(ascii: "u"), UInt8(ascii: "v"), UInt8(ascii: "w"), UInt8(ascii: "x"),
        UInt8(ascii: "y"), UInt8(ascii: "z"), UInt8(ascii: "0"), UInt8(ascii: "1"), UInt8(ascii: "2"), UInt8(ascii: "3"), UInt8(ascii: "4"), UInt8(ascii: "5"), UInt8(ascii: "6"), UInt8(ascii: "7"),
        UInt8(ascii: "8"), UInt8(ascii: "9"), UInt8(ascii: "+"), UInt8(ascii: "/"), UInt8(ascii: "A"), UInt8(ascii: "B"), UInt8(ascii: "C"), UInt8(ascii: "D"), UInt8(ascii: "E"), UInt8(ascii: "F"),
        UInt8(ascii: "G"), UInt8(ascii: "H"), UInt8(ascii: "I"), UInt8(ascii: "J"), UInt8(ascii: "K"), UInt8(ascii: "L"), UInt8(ascii: "M"), UInt8(ascii: "N"), UInt8(ascii: "O"), UInt8(ascii: "P"),
        UInt8(ascii: "Q"), UInt8(ascii: "R"), UInt8(ascii: "S"), UInt8(ascii: "T"), UInt8(ascii: "U"), UInt8(ascii: "V"), UInt8(ascii: "W"), UInt8(ascii: "X"), UInt8(ascii: "Y"), UInt8(ascii: "Z"),
        UInt8(ascii: "a"), UInt8(ascii: "b"), UInt8(ascii: "c"), UInt8(ascii: "d"), UInt8(ascii: "e"), UInt8(ascii: "f"), UInt8(ascii: "g"), UInt8(ascii: "h"), UInt8(ascii: "i"), UInt8(ascii: "j"),
        UInt8(ascii: "k"), UInt8(ascii: "l"), UInt8(ascii: "m"), UInt8(ascii: "n"), UInt8(ascii: "o"), UInt8(ascii: "p"), UInt8(ascii: "q"), UInt8(ascii: "r"), UInt8(ascii: "s"), UInt8(ascii: "t"),
        UInt8(ascii: "u"), UInt8(ascii: "v"), UInt8(ascii: "w"), UInt8(ascii: "x"), UInt8(ascii: "y"), UInt8(ascii: "z"), UInt8(ascii: "0"), UInt8(ascii: "1"), UInt8(ascii: "2"), UInt8(ascii: "3"),
        UInt8(ascii: "4"), UInt8(ascii: "5"), UInt8(ascii: "6"), UInt8(ascii: "7"), UInt8(ascii: "8"), UInt8(ascii: "9"), UInt8(ascii: "+"), UInt8(ascii: "/"), UInt8(ascii: "A"), UInt8(ascii: "B"),
        UInt8(ascii: "C"), UInt8(ascii: "D"), UInt8(ascii: "E"), UInt8(ascii: "F"), UInt8(ascii: "G"), UInt8(ascii: "H"), UInt8(ascii: "I"), UInt8(ascii: "J"), UInt8(ascii: "K"), UInt8(ascii: "L"),
        UInt8(ascii: "M"), UInt8(ascii: "N"), UInt8(ascii: "O"), UInt8(ascii: "P"), UInt8(ascii: "Q"), UInt8(ascii: "R"), UInt8(ascii: "S"), UInt8(ascii: "T"), UInt8(ascii: "U"), UInt8(ascii: "V"),
        UInt8(ascii: "W"), UInt8(ascii: "X"), UInt8(ascii: "Y"), UInt8(ascii: "Z"), UInt8(ascii: "a"), UInt8(ascii: "b"), UInt8(ascii: "c"), UInt8(ascii: "d"), UInt8(ascii: "e"), UInt8(ascii: "f"),
        UInt8(ascii: "g"), UInt8(ascii: "h"), UInt8(ascii: "i"), UInt8(ascii: "j"), UInt8(ascii: "k"), UInt8(ascii: "l"), UInt8(ascii: "m"), UInt8(ascii: "n"), UInt8(ascii: "o"), UInt8(ascii: "p"),
        UInt8(ascii: "q"), UInt8(ascii: "r"), UInt8(ascii: "s"), UInt8(ascii: "t"), UInt8(ascii: "u"), UInt8(ascii: "v"), UInt8(ascii: "w"), UInt8(ascii: "x"), UInt8(ascii: "y"), UInt8(ascii: "z"),
        UInt8(ascii: "0"), UInt8(ascii: "1"), UInt8(ascii: "2"), UInt8(ascii: "3"), UInt8(ascii: "4"), UInt8(ascii: "5"), UInt8(ascii: "6"), UInt8(ascii: "7"), UInt8(ascii: "8"), UInt8(ascii: "9"),
        UInt8(ascii: "+"), UInt8(ascii: "/"), UInt8(ascii: "A"), UInt8(ascii: "B"), UInt8(ascii: "C"), UInt8(ascii: "D"), UInt8(ascii: "E"), UInt8(ascii: "F"), UInt8(ascii: "G"), UInt8(ascii: "H"),
        UInt8(ascii: "I"), UInt8(ascii: "J"), UInt8(ascii: "K"), UInt8(ascii: "L"), UInt8(ascii: "M"), UInt8(ascii: "N"), UInt8(ascii: "O"), UInt8(ascii: "P"), UInt8(ascii: "Q"), UInt8(ascii: "R"),
        UInt8(ascii: "S"), UInt8(ascii: "T"), UInt8(ascii: "U"), UInt8(ascii: "V"), UInt8(ascii: "W"), UInt8(ascii: "X"), UInt8(ascii: "Y"), UInt8(ascii: "Z"), UInt8(ascii: "a"), UInt8(ascii: "b"),
        UInt8(ascii: "c"), UInt8(ascii: "d"), UInt8(ascii: "e"), UInt8(ascii: "f"), UInt8(ascii: "g"), UInt8(ascii: "h"), UInt8(ascii: "i"), UInt8(ascii: "j"), UInt8(ascii: "k"), UInt8(ascii: "l"),
        UInt8(ascii: "m"), UInt8(ascii: "n"), UInt8(ascii: "o"), UInt8(ascii: "p"), UInt8(ascii: "q"), UInt8(ascii: "r"), UInt8(ascii: "s"), UInt8(ascii: "t"), UInt8(ascii: "u"), UInt8(ascii: "v"),
        UInt8(ascii: "w"), UInt8(ascii: "x"), UInt8(ascii: "y"), UInt8(ascii: "z"), UInt8(ascii: "0"), UInt8(ascii: "1"), UInt8(ascii: "2"), UInt8(ascii: "3"), UInt8(ascii: "4"), UInt8(ascii: "5"),
        UInt8(ascii: "6"), UInt8(ascii: "7"), UInt8(ascii: "8"), UInt8(ascii: "9"), UInt8(ascii: "+"), UInt8(ascii: "/"),
    ]

    @usableFromInline
    static let encoding0url: [UInt8] = [
        UInt8(ascii: "A"), UInt8(ascii: "A"), UInt8(ascii: "A"), UInt8(ascii: "A"), UInt8(ascii: "B"), UInt8(ascii: "B"), UInt8(ascii: "B"), UInt8(ascii: "B"), UInt8(ascii: "C"), UInt8(ascii: "C"),
        UInt8(ascii: "C"), UInt8(ascii: "C"), UInt8(ascii: "D"), UInt8(ascii: "D"), UInt8(ascii: "D"), UInt8(ascii: "D"), UInt8(ascii: "E"), UInt8(ascii: "E"), UInt8(ascii: "E"), UInt8(ascii: "E"),
        UInt8(ascii: "F"), UInt8(ascii: "F"), UInt8(ascii: "F"), UInt8(ascii: "F"), UInt8(ascii: "G"), UInt8(ascii: "G"), UInt8(ascii: "G"), UInt8(ascii: "G"), UInt8(ascii: "H"), UInt8(ascii: "H"),
        UInt8(ascii: "H"), UInt8(ascii: "H"), UInt8(ascii: "I"), UInt8(ascii: "I"), UInt8(ascii: "I"), UInt8(ascii: "I"), UInt8(ascii: "J"), UInt8(ascii: "J"), UInt8(ascii: "J"), UInt8(ascii: "J"),
        UInt8(ascii: "K"), UInt8(ascii: "K"), UInt8(ascii: "K"), UInt8(ascii: "K"), UInt8(ascii: "L"), UInt8(ascii: "L"), UInt8(ascii: "L"), UInt8(ascii: "L"), UInt8(ascii: "M"), UInt8(ascii: "M"),
        UInt8(ascii: "M"), UInt8(ascii: "M"), UInt8(ascii: "N"), UInt8(ascii: "N"), UInt8(ascii: "N"), UInt8(ascii: "N"), UInt8(ascii: "O"), UInt8(ascii: "O"), UInt8(ascii: "O"), UInt8(ascii: "O"),
        UInt8(ascii: "P"), UInt8(ascii: "P"), UInt8(ascii: "P"), UInt8(ascii: "P"), UInt8(ascii: "Q"), UInt8(ascii: "Q"), UInt8(ascii: "Q"), UInt8(ascii: "Q"), UInt8(ascii: "R"), UInt8(ascii: "R"),
        UInt8(ascii: "R"), UInt8(ascii: "R"), UInt8(ascii: "S"), UInt8(ascii: "S"), UInt8(ascii: "S"), UInt8(ascii: "S"), UInt8(ascii: "T"), UInt8(ascii: "T"), UInt8(ascii: "T"), UInt8(ascii: "T"),
        UInt8(ascii: "U"), UInt8(ascii: "U"), UInt8(ascii: "U"), UInt8(ascii: "U"), UInt8(ascii: "V"), UInt8(ascii: "V"), UInt8(ascii: "V"), UInt8(ascii: "V"), UInt8(ascii: "W"), UInt8(ascii: "W"),
        UInt8(ascii: "W"), UInt8(ascii: "W"), UInt8(ascii: "X"), UInt8(ascii: "X"), UInt8(ascii: "X"), UInt8(ascii: "X"), UInt8(ascii: "Y"), UInt8(ascii: "Y"), UInt8(ascii: "Y"), UInt8(ascii: "Y"),
        UInt8(ascii: "Z"), UInt8(ascii: "Z"), UInt8(ascii: "Z"), UInt8(ascii: "Z"), UInt8(ascii: "a"), UInt8(ascii: "a"), UInt8(ascii: "a"), UInt8(ascii: "a"), UInt8(ascii: "b"), UInt8(ascii: "b"),
        UInt8(ascii: "b"), UInt8(ascii: "b"), UInt8(ascii: "c"), UInt8(ascii: "c"), UInt8(ascii: "c"), UInt8(ascii: "c"), UInt8(ascii: "d"), UInt8(ascii: "d"), UInt8(ascii: "d"), UInt8(ascii: "d"),
        UInt8(ascii: "e"), UInt8(ascii: "e"), UInt8(ascii: "e"), UInt8(ascii: "e"), UInt8(ascii: "f"), UInt8(ascii: "f"), UInt8(ascii: "f"), UInt8(ascii: "f"), UInt8(ascii: "g"), UInt8(ascii: "g"),
        UInt8(ascii: "g"), UInt8(ascii: "g"), UInt8(ascii: "h"), UInt8(ascii: "h"), UInt8(ascii: "h"), UInt8(ascii: "h"), UInt8(ascii: "i"), UInt8(ascii: "i"), UInt8(ascii: "i"), UInt8(ascii: "i"),
        UInt8(ascii: "j"), UInt8(ascii: "j"), UInt8(ascii: "j"), UInt8(ascii: "j"), UInt8(ascii: "k"), UInt8(ascii: "k"), UInt8(ascii: "k"), UInt8(ascii: "k"), UInt8(ascii: "l"), UInt8(ascii: "l"),
        UInt8(ascii: "l"), UInt8(ascii: "l"), UInt8(ascii: "m"), UInt8(ascii: "m"), UInt8(ascii: "m"), UInt8(ascii: "m"), UInt8(ascii: "n"), UInt8(ascii: "n"), UInt8(ascii: "n"), UInt8(ascii: "n"),
        UInt8(ascii: "o"), UInt8(ascii: "o"), UInt8(ascii: "o"), UInt8(ascii: "o"), UInt8(ascii: "p"), UInt8(ascii: "p"), UInt8(ascii: "p"), UInt8(ascii: "p"), UInt8(ascii: "q"), UInt8(ascii: "q"),
        UInt8(ascii: "q"), UInt8(ascii: "q"), UInt8(ascii: "r"), UInt8(ascii: "r"), UInt8(ascii: "r"), UInt8(ascii: "r"), UInt8(ascii: "s"), UInt8(ascii: "s"), UInt8(ascii: "s"), UInt8(ascii: "s"),
        UInt8(ascii: "t"), UInt8(ascii: "t"), UInt8(ascii: "t"), UInt8(ascii: "t"), UInt8(ascii: "u"), UInt8(ascii: "u"), UInt8(ascii: "u"), UInt8(ascii: "u"), UInt8(ascii: "v"), UInt8(ascii: "v"),
        UInt8(ascii: "v"), UInt8(ascii: "v"), UInt8(ascii: "w"), UInt8(ascii: "w"), UInt8(ascii: "w"), UInt8(ascii: "w"), UInt8(ascii: "x"), UInt8(ascii: "x"), UInt8(ascii: "x"), UInt8(ascii: "x"),
        UInt8(ascii: "y"), UInt8(ascii: "y"), UInt8(ascii: "y"), UInt8(ascii: "y"), UInt8(ascii: "z"), UInt8(ascii: "z"), UInt8(ascii: "z"), UInt8(ascii: "z"), UInt8(ascii: "0"), UInt8(ascii: "0"),
        UInt8(ascii: "0"), UInt8(ascii: "0"), UInt8(ascii: "1"), UInt8(ascii: "1"), UInt8(ascii: "1"), UInt8(ascii: "1"), UInt8(ascii: "2"), UInt8(ascii: "2"), UInt8(ascii: "2"), UInt8(ascii: "2"),
        UInt8(ascii: "3"), UInt8(ascii: "3"), UInt8(ascii: "3"), UInt8(ascii: "3"), UInt8(ascii: "4"), UInt8(ascii: "4"), UInt8(ascii: "4"), UInt8(ascii: "4"), UInt8(ascii: "5"), UInt8(ascii: "5"),
        UInt8(ascii: "5"), UInt8(ascii: "5"), UInt8(ascii: "6"), UInt8(ascii: "6"), UInt8(ascii: "6"), UInt8(ascii: "6"), UInt8(ascii: "7"), UInt8(ascii: "7"), UInt8(ascii: "7"), UInt8(ascii: "7"),
        UInt8(ascii: "8"), UInt8(ascii: "8"), UInt8(ascii: "8"), UInt8(ascii: "8"), UInt8(ascii: "9"), UInt8(ascii: "9"), UInt8(ascii: "9"), UInt8(ascii: "9"), UInt8(ascii: "-"), UInt8(ascii: "-"),
        UInt8(ascii: "-"), UInt8(ascii: "-"), UInt8(ascii: "_"), UInt8(ascii: "_"), UInt8(ascii: "_"), UInt8(ascii: "_"),
    ]

    @usableFromInline
    static let encoding1url: [UInt8] = [
        UInt8(ascii: "A"), UInt8(ascii: "B"), UInt8(ascii: "C"), UInt8(ascii: "D"), UInt8(ascii: "E"), UInt8(ascii: "F"), UInt8(ascii: "G"), UInt8(ascii: "H"), UInt8(ascii: "I"), UInt8(ascii: "J"),
        UInt8(ascii: "K"), UInt8(ascii: "L"), UInt8(ascii: "M"), UInt8(ascii: "N"), UInt8(ascii: "O"), UInt8(ascii: "P"), UInt8(ascii: "Q"), UInt8(ascii: "R"), UInt8(ascii: "S"), UInt8(ascii: "T"),
        UInt8(ascii: "U"), UInt8(ascii: "V"), UInt8(ascii: "W"), UInt8(ascii: "X"), UInt8(ascii: "Y"), UInt8(ascii: "Z"), UInt8(ascii: "a"), UInt8(ascii: "b"), UInt8(ascii: "c"), UInt8(ascii: "d"),
        UInt8(ascii: "e"), UInt8(ascii: "f"), UInt8(ascii: "g"), UInt8(ascii: "h"), UInt8(ascii: "i"), UInt8(ascii: "j"), UInt8(ascii: "k"), UInt8(ascii: "l"), UInt8(ascii: "m"), UInt8(ascii: "n"),
        UInt8(ascii: "o"), UInt8(ascii: "p"), UInt8(ascii: "q"), UInt8(ascii: "r"), UInt8(ascii: "s"), UInt8(ascii: "t"), UInt8(ascii: "u"), UInt8(ascii: "v"), UInt8(ascii: "w"), UInt8(ascii: "x"),
        UInt8(ascii: "y"), UInt8(ascii: "z"), UInt8(ascii: "0"), UInt8(ascii: "1"), UInt8(ascii: "2"), UInt8(ascii: "3"), UInt8(ascii: "4"), UInt8(ascii: "5"), UInt8(ascii: "6"), UInt8(ascii: "7"),
        UInt8(ascii: "8"), UInt8(ascii: "9"), UInt8(ascii: "-"), UInt8(ascii: "_"), UInt8(ascii: "A"), UInt8(ascii: "B"), UInt8(ascii: "C"), UInt8(ascii: "D"), UInt8(ascii: "E"), UInt8(ascii: "F"),
        UInt8(ascii: "G"), UInt8(ascii: "H"), UInt8(ascii: "I"), UInt8(ascii: "J"), UInt8(ascii: "K"), UInt8(ascii: "L"), UInt8(ascii: "M"), UInt8(ascii: "N"), UInt8(ascii: "O"), UInt8(ascii: "P"),
        UInt8(ascii: "Q"), UInt8(ascii: "R"), UInt8(ascii: "S"), UInt8(ascii: "T"), UInt8(ascii: "U"), UInt8(ascii: "V"), UInt8(ascii: "W"), UInt8(ascii: "X"), UInt8(ascii: "Y"), UInt8(ascii: "Z"),
        UInt8(ascii: "a"), UInt8(ascii: "b"), UInt8(ascii: "c"), UInt8(ascii: "d"), UInt8(ascii: "e"), UInt8(ascii: "f"), UInt8(ascii: "g"), UInt8(ascii: "h"), UInt8(ascii: "i"), UInt8(ascii: "j"),
        UInt8(ascii: "k"), UInt8(ascii: "l"), UInt8(ascii: "m"), UInt8(ascii: "n"), UInt8(ascii: "o"), UInt8(ascii: "p"), UInt8(ascii: "q"), UInt8(ascii: "r"), UInt8(ascii: "s"), UInt8(ascii: "t"),
        UInt8(ascii: "u"), UInt8(ascii: "v"), UInt8(ascii: "w"), UInt8(ascii: "x"), UInt8(ascii: "y"), UInt8(ascii: "z"), UInt8(ascii: "0"), UInt8(ascii: "1"), UInt8(ascii: "2"), UInt8(ascii: "3"),
        UInt8(ascii: "4"), UInt8(ascii: "5"), UInt8(ascii: "6"), UInt8(ascii: "7"), UInt8(ascii: "8"), UInt8(ascii: "9"), UInt8(ascii: "-"), UInt8(ascii: "_"), UInt8(ascii: "A"), UInt8(ascii: "B"),
        UInt8(ascii: "C"), UInt8(ascii: "D"), UInt8(ascii: "E"), UInt8(ascii: "F"), UInt8(ascii: "G"), UInt8(ascii: "H"), UInt8(ascii: "I"), UInt8(ascii: "J"), UInt8(ascii: "K"), UInt8(ascii: "L"),
        UInt8(ascii: "M"), UInt8(ascii: "N"), UInt8(ascii: "O"), UInt8(ascii: "P"), UInt8(ascii: "Q"), UInt8(ascii: "R"), UInt8(ascii: "S"), UInt8(ascii: "T"), UInt8(ascii: "U"), UInt8(ascii: "V"),
        UInt8(ascii: "W"), UInt8(ascii: "X"), UInt8(ascii: "Y"), UInt8(ascii: "Z"), UInt8(ascii: "a"), UInt8(ascii: "b"), UInt8(ascii: "c"), UInt8(ascii: "d"), UInt8(ascii: "e"), UInt8(ascii: "f"),
        UInt8(ascii: "g"), UInt8(ascii: "h"), UInt8(ascii: "i"), UInt8(ascii: "j"), UInt8(ascii: "k"), UInt8(ascii: "l"), UInt8(ascii: "m"), UInt8(ascii: "n"), UInt8(ascii: "o"), UInt8(ascii: "p"),
        UInt8(ascii: "q"), UInt8(ascii: "r"), UInt8(ascii: "s"), UInt8(ascii: "t"), UInt8(ascii: "u"), UInt8(ascii: "v"), UInt8(ascii: "w"), UInt8(ascii: "x"), UInt8(ascii: "y"), UInt8(ascii: "z"),
        UInt8(ascii: "0"), UInt8(ascii: "1"), UInt8(ascii: "2"), UInt8(ascii: "3"), UInt8(ascii: "4"), UInt8(ascii: "5"), UInt8(ascii: "6"), UInt8(ascii: "7"), UInt8(ascii: "8"), UInt8(ascii: "9"),
        UInt8(ascii: "-"), UInt8(ascii: "_"), UInt8(ascii: "A"), UInt8(ascii: "B"), UInt8(ascii: "C"), UInt8(ascii: "D"), UInt8(ascii: "E"), UInt8(ascii: "F"), UInt8(ascii: "G"), UInt8(ascii: "H"),
        UInt8(ascii: "I"), UInt8(ascii: "J"), UInt8(ascii: "K"), UInt8(ascii: "L"), UInt8(ascii: "M"), UInt8(ascii: "N"), UInt8(ascii: "O"), UInt8(ascii: "P"), UInt8(ascii: "Q"), UInt8(ascii: "R"),
        UInt8(ascii: "S"), UInt8(ascii: "T"), UInt8(ascii: "U"), UInt8(ascii: "V"), UInt8(ascii: "W"), UInt8(ascii: "X"), UInt8(ascii: "Y"), UInt8(ascii: "Z"), UInt8(ascii: "a"), UInt8(ascii: "b"),
        UInt8(ascii: "c"), UInt8(ascii: "d"), UInt8(ascii: "e"), UInt8(ascii: "f"), UInt8(ascii: "g"), UInt8(ascii: "h"), UInt8(ascii: "i"), UInt8(ascii: "j"), UInt8(ascii: "k"), UInt8(ascii: "l"),
        UInt8(ascii: "m"), UInt8(ascii: "n"), UInt8(ascii: "o"), UInt8(ascii: "p"), UInt8(ascii: "q"), UInt8(ascii: "r"), UInt8(ascii: "s"), UInt8(ascii: "t"), UInt8(ascii: "u"), UInt8(ascii: "v"),
        UInt8(ascii: "w"), UInt8(ascii: "x"), UInt8(ascii: "y"), UInt8(ascii: "z"), UInt8(ascii: "0"), UInt8(ascii: "1"), UInt8(ascii: "2"), UInt8(ascii: "3"), UInt8(ascii: "4"), UInt8(ascii: "5"),
        UInt8(ascii: "6"), UInt8(ascii: "7"), UInt8(ascii: "8"), UInt8(ascii: "9"), UInt8(ascii: "-"), UInt8(ascii: "_"),
    ]

    @inlinable
    public static func encodeToBytes<Buffer: Collection>(bytes: Buffer, options: EncodingOptions = [])
        -> [UInt8] where Buffer.Element == UInt8
    {
        let newCapacity = ((bytes.count + 2) / 3) * 4

        if let result = bytes.withContiguousStorageIfAvailable({ input -> [UInt8] in
            [UInt8](unsafeUninitializedCapacity: newCapacity) { buffer, length in
                Self._encodeChromium(input: input, buffer: buffer, length: &length, options: options)
            }
        }) {
            return result
        }

        return self.encodeToBytes(bytes: Array(bytes), options: options)
    }

    @inlinable
    public static func encodeToString<Buffer: Collection>(bytes: Buffer, options: EncodingOptions = [])
        -> String where Buffer.Element == UInt8
    {
        let newCapacity = ((bytes.count + 2) / 3) * 4

        #if swift(>=5.3)
        if #available(OSX 11.0, iOS 14.0, tvOS 14.0, watchOS 7.0, *) {
            if let result = bytes.withContiguousStorageIfAvailable({ input -> String in
                String(unsafeUninitializedCapacity: newCapacity) { buffer -> Int in
                    var length = newCapacity
                    Self._encodeChromium(input: input, buffer: buffer, length: &length, options: options)
                    return length
                }
            }) {
                return result
            }

            return self.encodeToString(bytes: Array(bytes), options: options)
        } else {
            let bytes: [UInt8] = self.encodeToBytes(bytes: bytes, options: options)
            return String(decoding: bytes, as: Unicode.UTF8.self)
        }
        #else
        let bytes: [UInt8] = self.encodeBytes(bytes: bytes, options: options)
        return String(decoding: bytes, as: Unicode.UTF8.self)
        #endif
    }

    @inlinable
    static func _encodeChromium(input: UnsafeBufferPointer<UInt8>, buffer: UnsafeMutableBufferPointer<UInt8>, length: inout Int, options: EncodingOptions) {
        let omitPaddingCharacter = options.contains(.omitPaddingCharacter)

        Self.withUnsafeEncodingTablesAsBufferPointers(options: options) { e0, e1 in
            let to = input.count / 3 * 3
            var outIndex = 0
            for index in stride(from: 0, to: to, by: 3) {
                let i1 = input[index]
                let i2 = input[index + 1]
                let i3 = input[index + 2]
                buffer[outIndex] = e0[Int(i1)]
                buffer[outIndex + 1] = e1[Int(((i1 & 0x03) << 4) | ((i2 >> 4) & 0x0F))]
                buffer[outIndex + 2] = e1[Int(((i2 & 0x0F) << 2) | ((i3 >> 6) & 0x03))]
                buffer[outIndex + 3] = e1[Int(i3)]
                outIndex += 4
            }

            if to < input.count {
                let index = to

                let i1 = input[index]
                let i2 = index + 1 < input.count ? input[index + 1] : nil
                let i3 = index + 2 < input.count ? input[index + 2] : nil

                buffer[outIndex] = e0[Int(i1)]

                if let i2 = i2, let i3 = i3 {
                    buffer[outIndex + 1] = e1[Int(((i1 & 0x03) << 4) | ((i2 >> 4) & 0x0F))]
                    buffer[outIndex + 2] = e1[Int(((i2 & 0x0F) << 2) | ((i3 >> 6) & 0x03))]
                    buffer[outIndex + 3] = e1[Int(i3)]
                    outIndex += 4
                } else if let i2 = i2 {
                    buffer[outIndex + 1] = e1[Int(((i1 & 0x03) << 4) | ((i2 >> 4) & 0x0F))]
                    buffer[outIndex + 2] = e1[Int((i2 & 0x0F) << 2)]
                    outIndex += 3
                    if !omitPaddingCharacter {
                        buffer[outIndex] = Self.encodePaddingCharacter
                        outIndex += 1
                    }
                } else {
                    buffer[outIndex + 1] = e1[Int((i1 & 0x03) << 4)]
                    outIndex += 2
                    if !omitPaddingCharacter {
                        buffer[outIndex] = Self.encodePaddingCharacter
                        buffer[outIndex + 1] = Self.encodePaddingCharacter
                        outIndex += 2
                    }
                }
            }

            length = outIndex
        }
    }

    @inlinable
    static func withUnsafeEncodingTablesAsBufferPointers<R>(options: Base64.EncodingOptions, _ body: (UnsafeBufferPointer<UInt8>, UnsafeBufferPointer<UInt8>) throws -> R) rethrows -> R {
        let encoding0 = options.contains(.base64UrlAlphabet) ? Self.encoding0url : Self.encoding0
        let encoding1 = options.contains(.base64UrlAlphabet) ? Self.encoding1url : Self.encoding1

        assert(encoding0.count == 256)
        assert(encoding1.count == 256)

        return try encoding0.withUnsafeBufferPointer { e0 -> R in
            try encoding1.withUnsafeBufferPointer { e1 -> R in
                try body(e0, e1)
            }
        }
    }
}

// MARK: - Decode -

extension Base64 {
    struct DecodingOptions: OptionSet {
        let rawValue: UInt
        init(rawValue: UInt) { self.rawValue = rawValue }

        static let base64UrlAlphabet = DecodingOptions(rawValue: UInt(1 << 0))
    }

    enum DecodingError: Error, Equatable {
        case invalidLength
        case invalidCharacter(UInt8)
        case unexpectedPaddingCharacter
        case unexpectedEnd
    }

    @inlinable
    static func decode<Buffer: Collection>(
        encoded: Buffer,
        options: DecodingOptions = []
    ) throws -> [UInt8] where Buffer.Element == UInt8 {
        let alphabet =
            options.contains(.base64UrlAlphabet)
            ? Base64.urlAlphabet
            : Base64.defaultAlphabet

        // In Base64 4 encoded bytes, become 3 decoded bytes. We pad to the
        // nearest multiple of three.
        let inputLength = encoded.count
        guard inputLength > 0 else { return [] }
        guard inputLength % 4 == 0 else {
            throw DecodingError.invalidLength
        }

        let inputBlocks = (inputLength + 3) / 4
        let fullQualified = inputBlocks - 1
        let outputLength = ((encoded.count + 3) / 4) * 3
        var iterator = encoded.makeIterator()
        var outputBytes = [UInt8]()
        outputBytes.reserveCapacity(outputLength)

        // fast loop. we don't expect any padding in here.
        for _ in 0..<fullQualified {
            let firstValue: UInt8 = try iterator.nextValue(alphabet: alphabet)
            let secondValue: UInt8 = try iterator.nextValue(alphabet: alphabet)
            let thirdValue: UInt8 = try iterator.nextValue(alphabet: alphabet)
            let forthValue: UInt8 = try iterator.nextValue(alphabet: alphabet)

            outputBytes.append((firstValue << 2) | (secondValue >> 4))
            outputBytes.append((secondValue << 4) | (thirdValue >> 2))
            outputBytes.append((thirdValue << 6) | forthValue)
        }

        // last 4 bytes. we expect padding characters in three and four
        let firstValue: UInt8 = try iterator.nextValue(alphabet: alphabet)
        let secondValue: UInt8 = try iterator.nextValue(alphabet: alphabet)
        let thirdValue: UInt8? = try iterator.nextValueOrEmpty(alphabet: alphabet)
        let forthValue: UInt8? = try iterator.nextValueOrEmpty(alphabet: alphabet)

        outputBytes.append((firstValue << 2) | (secondValue >> 4))
        if let thirdValue = thirdValue {
            outputBytes.append((secondValue << 4) | (thirdValue >> 2))

            if let forthValue = forthValue {
                outputBytes.append((thirdValue << 6) | forthValue)
            }
        }

        return outputBytes
    }

    @inlinable
    static func decode(encoded: String, options: DecodingOptions = []) throws -> [UInt8] {
        // A string can be backed by a contiguous storage (pure swift string)
        // or a nsstring (bridged string from objc). We only get a pointer
        // to the contiguous storage, if the input string is a swift string.
        // Therefore to transform the nsstring backed input into a swift
        // string we concat the input with nothing, causing a copy on write
        // into a swift string.
        let decoded = try encoded.utf8.withContiguousStorageIfAvailable { pointer in
            try self.decode(encoded: pointer, options: options)
        }

        if decoded != nil {
            return decoded!
        }

        return try self.decode(encoded: encoded + "", options: options)
    }

    // MARK: Internal

    @usableFromInline
    static let defaultAlphabet: [UInt8] = [
        //     0    1    2    3    4    5    6    7    8    9
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  //  0
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  //  1
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  //  2
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  //  3
        255, 255, 255, 62, 255, 255, 255, 63, 52, 53,  //  4
        54, 55, 56, 57, 58, 59, 60, 61, 255, 255,  //  5
        255, 254, 255, 255, 255, 0, 1, 2, 3, 4,  //  6
        5, 6, 7, 8, 9, 10, 11, 12, 13, 14,  //  7
        15, 16, 17, 18, 19, 20, 21, 22, 23, 24,  //  8
        25, 255, 255, 255, 255, 255, 255, 26, 27, 28,  //  9
        29, 30, 31, 32, 33, 34, 35, 36, 37, 38,  // 10
        39, 40, 41, 42, 43, 44, 45, 46, 47, 48,  // 11
        49, 50, 51, 255, 255, 255, 255, 255, 255, 255,  // 12
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  // 13
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  // 14
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  // 15
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  // 16
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  // 17
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  // 18
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  // 19
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  // 20
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  // 21
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  // 22
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  // 23
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  // 24
        255, 255, 255, 255, 255,  // 25
    ]

    @usableFromInline
    static let urlAlphabet: [UInt8] = [
        //     0    1    2    3    4    5    6    7    8    9
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  //  0
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  //  1
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  //  2
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  //  3
        255, 255, 255, 255, 255, 62, 255, 255, 52, 53,  //  4
        54, 55, 56, 57, 58, 59, 60, 61, 255, 255,  //  5
        255, 254, 255, 255, 255, 0, 1, 2, 3, 4,  //  6
        5, 6, 7, 8, 9, 10, 11, 12, 13, 14,  //  7
        15, 16, 17, 18, 19, 20, 21, 22, 23, 24,  //  8
        25, 255, 255, 255, 255, 63, 255, 26, 27, 28,  //  9
        29, 30, 31, 32, 33, 34, 35, 36, 37, 38,  // 10
        39, 40, 41, 42, 43, 44, 45, 46, 47, 48,  // 11
        49, 50, 51, 255, 255, 255, 255, 255, 255, 255,  // 12
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  // 13
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  // 14
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  // 15
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  // 16
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  // 17
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  // 18
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  // 19
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  // 20
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  // 21
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  // 22
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  // 23
        255, 255, 255, 255, 255, 255, 255, 255, 255, 255,  // 24
        255, 255, 255, 255, 255,  // 25
    ]

    @usableFromInline
    static let paddingCharacter: UInt8 = 254
}

extension IteratorProtocol where Self.Element == UInt8 {
    mutating func nextValue(alphabet: [UInt8]) throws -> UInt8 {
        let ascii = self.next()!

        let value = alphabet[Int(ascii)]

        if value < 64 {
            return value
        }

        if value == Base64.paddingCharacter {
            throw Base64.DecodingError.unexpectedPaddingCharacter
        }

        throw Base64.DecodingError.invalidCharacter(ascii)
    }

    mutating func nextValueOrEmpty(alphabet: [UInt8]) throws -> UInt8? {
        let ascii = self.next()!

        let value = alphabet[Int(ascii)]

        if value < 64 {
            return value
        }

        if value == Base64.paddingCharacter {
            return nil
        }

        throw Base64.DecodingError.invalidCharacter(ascii)
    }
}

// MARK: - Extensions -

extension String {
    func base64decoded(options: Base64.DecodingOptions = []) throws -> [UInt8] {
        // In Base64, 3 bytes become 4 output characters, and we pad to the nearest multiple
        // of four.
        try Base64.decode(encoded: self, options: options)
    }
}
