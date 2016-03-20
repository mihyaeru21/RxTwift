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
        var hashes: [UInt32] = [0x67452301, 0xEFCDAB89, 0x98BADCFE, 0x10325476, 0xC3D2E1F0]

        // Process the message in successive 512-bit chunks:
        for chunk in Message(message).chunks {
            // break chunk into sixteen 32-bit big-endian words
            var w = Array<UInt32>(count: 80, repeatedValue: 0)
            for var i = 0; i < 16; i++ {
                w[i] = chunk[uint32: i]
            }

            // Extend the sixteen 32-bit words into eighty 32-bit words:
            for var i = 16; i < 80; i++ {
                w[i] = (w[i - 3] ^ w[i - 8] ^ w[i - 14] ^ w[i - 16]).rotateLeft(1)
            }

            // Main loop:
            var (a, b, c, d, e) = (hashes[0], hashes[1], hashes[2], hashes[3], hashes[4])
            var f, k: UInt32
            for var i = 0; i < 80; i++ {
                switch i {
                case 0...19:
                    f = (b & c) | ((~b) & d)
                    k = 0x5A827999
                case 20...39:
                    f = b ^ c ^ d
                    k = 0x6ED9EBA1
                case 40...59:
                    f = (b & c) | (b & d) | (c & d)
                    k = 0x8F1BBCDC
                default:
                    f = b ^ c ^ d
                    k = 0xCA62C1D6
                }

                let temp = a.rotateLeft(5) &+ f &+ e &+ k &+ w[i]
                e = d
                d = c
                c = b.rotateLeft(30)
                b = a
                a = temp
            }

            // Add this chunk's hash to result so far:
            hashes[0] = hashes[0] &+ a
            hashes[1] = hashes[1] &+ b
            hashes[2] = hashes[2] &+ c
            hashes[3] = hashes[3] &+ d
            hashes[4] = hashes[4] &+ e
        }

        // Produce the final hash value (big-endian) as a 160 bit number:
        var index = 0
        var bytes = Array<UInt8>(count: 20, repeatedValue: 0)
        for h in hashes {
            bytes[index++] = UInt8(h >> 24 & 0xff)
            bytes[index++] = UInt8(h >> 16 & 0xff)
            bytes[index++] = UInt8(h >> 8  & 0xff)
            bytes[index++] = UInt8(h       & 0xff)
        }

        return NSData(bytes: bytes).base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
    }
}

private struct Message {
    private var bytes: [UInt8]

    init(_ string: String) {
        self.bytes = Array(string.utf8)
        let messageLength = UInt64(self.bytes.count * 8)

        // Pre-processing
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
