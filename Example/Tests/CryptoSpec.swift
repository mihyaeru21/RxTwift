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
                let hash = Crypto.sha1("")
                expect(hash) == "2jmj7l5rSw0yVb/vlWAYkK/YBwk="
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
    }
}