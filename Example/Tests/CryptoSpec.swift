//
//  Crypto.swift
//  RxTwift
//
//  Created by Mihyaeru on 3/13/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import RxTwift

class CryptoSpec: QuickSpec {
    override func spec() {
        describe("sha1") {
            it("empty") {
                expect(Crypto.sha1("")) == "2jmj7l5rSw0yVb/vlWAYkK/YBwk="
            }

            it("hoge") {
                let hash = Crypto.sha1("The quick brown fox jumps over the lazy dog")
                expect(hash) == "L9ThxnotKPzthJ7hu3bnORuT6xI="
            }

            it("fuga") {
                let hash = Crypto.sha1("The quick brown fox jumps over the lazy cog")
                expect(hash) == "3p8sf9JeGzr60+haC9F9mxANtLM="
            }
        }

        describe("hmacSha1") {
            it("empty") {
                expect(Crypto.hmacSha1(key: "", message: "")) == "+9sdGxiqbAgyS31ktx+3Y3BpDh0="
            }

            it("string wrapper") {
                let key = "key"
                let message = "The quick brown fox jumps over the lazy dog"
                expect(Crypto.hmacSha1(key: key, message: message)) == "3nybhbi3iqa8ino29wqQcBydtNk="
            }

            // from https://www.ipa.go.jp/security/rfc/RFC2202JA.html
            context("IPA tests") {
                it("case 1") {
                    let key = Array<UInt8>(count: 20, repeatedValue: 0x0b)
                    let message = "Hi There".utf8Array
                    let hmac: [UInt8] = [0xb6, 0x17, 0x31, 0x86, 0x55, 0x05, 0x72, 0x64, 0xe2, 0x8b, 0xc0, 0xb6, 0xfb, 0x37, 0x8c, 0x8e, 0xf1, 0x46, 0xbe, 0x00]
                    expect(Crypto.hmacSha1(key: key, message: message)) == hmac
                }

                it("case 2") {
                    let key = "Jefe".utf8Array
                    let message = "what do ya want for nothing?".utf8Array
                    let hmac: [UInt8] = [0xef, 0xfc, 0xdf, 0x6a, 0xe5, 0xeb, 0x2f, 0xa2, 0xd2, 0x74, 0x16, 0xd5, 0xf1, 0x84, 0xdf, 0x9c, 0x25, 0x9a, 0x7c, 0x79]
                    expect(Crypto.hmacSha1(key: key, message: message)) == hmac
                }

                it("case 3") {
                    let key = Array<UInt8>(count: 20, repeatedValue: 0xaa)
                    let message = Array<UInt8>(count: 50, repeatedValue: 0xdd)
                    let hmac: [UInt8] = [0x12, 0x5d, 0x73, 0x42, 0xb9, 0xac, 0x11, 0xcd, 0x91, 0xa3, 0x9a, 0xf4, 0x8a, 0xa1, 0x7b, 0x4f, 0x63, 0xf1, 0x75, 0xd3]
                    expect(Crypto.hmacSha1(key: key, message: message)) == hmac
                }

                it("case 4") {
                    let key: [UInt8] = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19]
                    let message = Array<UInt8>(count: 50, repeatedValue: 0xcd)
                    let hmac: [UInt8] = [0x4c, 0x90, 0x07, 0xf4, 0x02, 0x62, 0x50, 0xc6, 0xbc, 0x84, 0x14, 0xf9, 0xbf, 0x50, 0xc8, 0x6c, 0x2d, 0x72, 0x35, 0xda]
                    expect(Crypto.hmacSha1(key: key, message: message)) == hmac
                }

                it("case 5") {
                    let key = Array<UInt8>(count: 20, repeatedValue: 0x0c)
                    let message = "Test With Truncation".utf8Array
                    let hmac: [UInt8] = [0x4c, 0x1a, 0x03, 0x42, 0x4b, 0x55, 0xe0, 0x7f, 0xe7, 0xf2, 0x7b, 0xe1, 0xd5, 0x8b, 0xb9, 0x32, 0x4a, 0x9a, 0x5a, 0x04]
                    expect(Crypto.hmacSha1(key: key, message: message)) == hmac
                }

                it("case 6") {
                    let key = Array<UInt8>(count: 80, repeatedValue: 0xaa)
                    let message = "Test Using Larger Than Block-Size Key - Hash Key First".utf8Array
                    let hmac: [UInt8] = [0xaa, 0x4a, 0xe5, 0xe1, 0x52, 0x72, 0xd0, 0x0e, 0x95, 0x70, 0x56, 0x37, 0xce, 0x8a, 0x3b, 0x55, 0xed, 0x40, 0x21, 0x12]
                    expect(Crypto.hmacSha1(key: key, message: message)) == hmac
                }

                it("case 7") {
                    let key = Array<UInt8>(count: 80, repeatedValue: 0xaa)
                    let message = "Test Using Larger Than Block-Size Key and Larger Than One Block-Size Data".utf8Array
                    let hmac: [UInt8] = [0xe8, 0xe9, 0x9d, 0x0f, 0x45, 0x23, 0x7d, 0x78, 0x6d, 0x6b, 0xba, 0xa7, 0x96, 0x5c, 0x78, 0x08, 0xbb, 0xff, 0x1a, 0x91]
                    expect(Crypto.hmacSha1(key: key, message: message)) == hmac
                }
            }
        }
    }
}

private extension String {
    private var utf8Array: [UInt8] {
        return Array(self.utf8)
    }
}
