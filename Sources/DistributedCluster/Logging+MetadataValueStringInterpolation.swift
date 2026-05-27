//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift Distributed Actors open source project
//
// Copyright (c) 2018-2022 Apple Inc. and the Swift Distributed Actors project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of Swift Distributed Actors project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

import Logging

extension Logger.MetadataValue {
    static func metadata(from legacy: [String: Any]) -> Logger.Metadata {
        legacy.mapValues { value in
            if let metadataValue = value as? Logger.MetadataValue {
                return metadataValue
            } else {
                return .string(String(describing: value))
            }
        }
    }

    static func metadata(from legacy: [String: String]) -> Logger.Metadata {
        legacy.mapValues { .string($0) }
    }
}

extension Logger {
    public func trace(
        _ message: @autoclosure () -> Logger.Message,
        error: @autoclosure () -> (any Error)? = nil,
        metadata: @autoclosure () -> [String: String],
        source: @autoclosure () -> String? = nil,
        file: String = #fileID,
        function: String = #function,
        line: UInt = #line
    ) {
        self.trace(message(), error: error(), metadata: Logger.MetadataValue.metadata(from: metadata()), source: source(), file: file, function: function, line: line)
    }

    public func trace(
        _ message: @autoclosure () -> Logger.Message,
        error: @autoclosure () -> (any Error)? = nil,
        metadata: @autoclosure () -> [String: Any],
        source: @autoclosure () -> String? = nil,
        file: String = #fileID,
        function: String = #function,
        line: UInt = #line
    ) {
        self.trace(message(), error: error(), metadata: Logger.MetadataValue.metadata(from: metadata()), source: source(), file: file, function: function, line: line)
    }

    public func warning(
        _ message: @autoclosure () -> Logger.Message,
        error: @autoclosure () -> (any Error)? = nil,
        metadata: @autoclosure () -> [String: String],
        source: @autoclosure () -> String? = nil,
        file: String = #fileID,
        function: String = #function,
        line: UInt = #line
    ) {
        self.warning(message(), error: error(), metadata: Logger.MetadataValue.metadata(from: metadata()), source: source(), file: file, function: function, line: line)
    }

    public func warning(
        _ message: @autoclosure () -> Logger.Message,
        error: @autoclosure () -> (any Error)? = nil,
        metadata: @autoclosure () -> [String: Any],
        source: @autoclosure () -> String? = nil,
        file: String = #fileID,
        function: String = #function,
        line: UInt = #line
    ) {
        self.warning(message(), error: error(), metadata: Logger.MetadataValue.metadata(from: metadata()), source: source(), file: file, function: function, line: line)
    }
}
