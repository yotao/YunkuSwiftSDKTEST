//
//  SHA1.swift
//  SwiftDigest
//
//  Created by Brent Royal-Gordon on 8/26/14.
//  Copyright (c) 2014 Groundbreaking Software. All rights reserved.
//

import Foundation
import CommonCrypto

/// The SHA1 class implements the NSA's SHA-1 algorithm, standardized in
/// FIPS PUB 180-4, using CommonCrypto. 
/// 
/// Although SHA-1 has not yet been broken, breaking it is expected to be feasible 
/// within the next decade. You should probably not use it in new designs.
public struct SHA1: AlgorithmType {
    fileprivate var context = CC_SHA1_CTX()
    
    /// SHA1 should be initialized without any parameters.
    public init() {
        // Default OK
    }
    
    public mutating func append(_ data: UnsafeBufferPointer<UInt8>) {
        CC_SHA1_Update(&context, UnsafeRawPointer(data.baseAddress), CC_LONG(data.count))
    }
    
    public mutating func finish() -> [UInt8] {
        var data: [UInt8] = Array(repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        CC_SHA1_Final(&data, &context)
        
        return data
    }
}

private extension CC_SHA1_CTX {
    init() {
        self.init(h0: 0, h1: 0, h2: 0, h3: 0, h4: 0, Nl: 0, Nh: 0, data: (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), num: 0)
        CC_SHA1_Init(&self)
    }
}
