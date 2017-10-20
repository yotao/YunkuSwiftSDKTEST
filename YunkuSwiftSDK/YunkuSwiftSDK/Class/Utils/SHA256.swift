//
//  SHA256.swift
//  SwiftDigest
//
//  Created by Brent Royal-Gordon on 8/25/14.
//  Copyright (c) 2014 Groundbreaking Software. All rights reserved.
//

import Foundation
import CommonCrypto

/// The SHA256 class implements the NSA's SHA-256 algorithm, standardized in
/// FIPS PUB 180-4, using CommonCrypto. 
public struct SHA256: AlgorithmType {
    fileprivate var context = CC_SHA256_CTX()
    
    /// SHA256 should be initialized without any parameters.
    public init() {
        // Default OK
    }
    
    public mutating func append(_ data: UnsafeBufferPointer<UInt8>) {
        CC_SHA256_Update(&context, UnsafeRawPointer(data.baseAddress), CC_LONG(data.count))
    }
    
    public mutating func finish() -> [UInt8] {
        var data: [UInt8] = Array(repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        CC_SHA256_Final(&data, &context)
        
        return data
    }
}

private extension CC_SHA256_CTX {
    init() {
        self.init(count: (0, 0), hash: (0, 0, 0, 0, 0, 0, 0, 0), wbuf: (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0))
        CC_SHA256_Init(&self)
    }
}
