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
        var message: [UInt8] = Array(message.utf8)
        let messageLength = UInt64(message.count * 8)
        var hashes: [UInt32] = [0x67452301, 0xEFCDAB89, 0x98BADCFE, 0x10325476, 0xC3D2E1F0]

        // Pre-processing
        message += [0x80]
        let size = 56 - (message.count % 64)
        message += Array<UInt8>(count: size < 0 ? size + 64 : size, repeatedValue: 0)
        message += messageLength.bytes()

        // Process the message in successive 512-bit chunks:
        var index = 0
        while index < message.count {
            var w = Array<UInt32>(count: 80, repeatedValue: 0)
            for var i = 0; i < 16; i++ {
                let hoge = index + i * 4
                w[i] += UInt32(message[hoge])     << 24
                w[i] += UInt32(message[hoge + 1]) << 16
                w[i] += UInt32(message[hoge + 2]) << 8
                w[i] += UInt32(message[hoge + 3])
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

            index += 64
        }

        // Produce the final hash value (big-endian) as a 160 bit number:
        index = 0
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

// only works when n < 32
private extension UInt32 {
    private func rotateLeft(n: UInt32) -> UInt32 {
        return (self << n) | (self >> (32 - n))
    }
}
