//
//  Crypto.swift
//  Pods
//
//  Created by Mihyaeru on 3/13/16.
//
//

import Foundation

public class Crypto {
    public static func sha1(message: String) -> String {
        var hash = Hash()
        for chunk in Message(message).chunks {
            var w = Array<UInt32>(count: 80, repeatedValue: 0)
            for i in 0..<80 {
                switch i {
                case 0...15: w[i] = chunk[uint32: i]
                default:     w[i] = (w[i-3] ^ w[i-8] ^ w[i-14] ^ w[i-16]).rotateLeft(1)
                }
            }

            var (a, b, c, d, e) = hash.values
            var f, k: UInt32
            for i in 0..<80 {
                switch i {
                case 0...19:
                    f = (b & c) | ((~b) & d)
                    k = 0x5a827999
                case 20...39:
                    f = b ^ c ^ d
                    k = 0x6ed9eba1
                case 40...59:
                    f = (b & c) | (b & d) | (c & d)
                    k = 0x8f1bbcdc
                default:
                    f = b ^ c ^ d
                    k = 0xca62c1d6
                }
                let temp = a.rotateLeft(5) &+ f &+ e &+ k &+ w[i]
                (a, b, c, d, e) = (temp, a, b.rotateLeft(30), c, d)
            }

            hash.add((a, b, c, d, e))
        }

        return hash.result.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
    }
}

private struct Hash {
    private var hashes: [UInt32] = [0x67452301, 0xefcdab89, 0x98badcfe, 0x10325476, 0xc3d2e1f0]

    private var values: (UInt32, UInt32, UInt32, UInt32, UInt32) {
        return (self.hashes[0], self.hashes[1], self.hashes[2], self.hashes[3], self.hashes[4])
    }

    private mutating func add(values: (UInt32, UInt32, UInt32, UInt32, UInt32)) {
        self.hashes[0] = self.hashes[0] &+ values.0
        self.hashes[1] = self.hashes[1] &+ values.1
        self.hashes[2] = self.hashes[2] &+ values.2
        self.hashes[3] = self.hashes[3] &+ values.3
        self.hashes[4] = self.hashes[4] &+ values.4
    }

    // 160 bit number
    private var result: NSData {
        var index = 0
        var bytes = Array<UInt8>(count: 20, repeatedValue: 0)
        for h in self.hashes {
            bytes[index++] = UInt8(h >> 24 & 0xff)
            bytes[index++] = UInt8(h >> 16 & 0xff)
            bytes[index++] = UInt8(h >> 8  & 0xff)
            bytes[index++] = UInt8(h       & 0xff)
        }
        return NSData(bytes: bytes)
    }
}

private struct Message {
    private var bytes: [UInt8]

    init(_ string: String) {
        self.bytes = Array(string.utf8)
        let messageLength = UInt64(self.bytes.count * 8)

        self.bytes += [0x80]
        let size = 56 - (self.bytes.count % 64)
        self.bytes += Array<UInt8>(count: size < 0 ? size + 64 : size, repeatedValue: 0)
        self.bytes += messageLength.bytes()
    }

    private var chunks: AnyGenerator<Chunk> {
        var s = 0
        return anyGenerator { () -> Chunk? in
            if s >= self.bytes.count { return nil }
            let (start, end) = (s, s + 64)
            s = end
            return Chunk(bytes: Array(self.bytes[start..<end]))
        }
    }
}

private struct Chunk {
    private let bytes: [UInt8]  // 64byte = 512bit

    private subscript(uint32 index: Int) -> UInt32 {
        let i = index * 4
        var value: UInt32 = 0
        value += UInt32(self.bytes[i])     << 24
        value += UInt32(self.bytes[i + 1]) << 16
        value += UInt32(self.bytes[i + 2]) << 8
        value += UInt32(self.bytes[i + 3])
        return value
    }
}

// only works when n < 32
private extension UInt32 {
    private func rotateLeft(n: UInt32) -> UInt32 {
        return (self << n) | (self >> (32 - n))
    }
}
