// https://github.com/Quick/Quick

import Quick
import Nimble
import RxTwift

class RxTwiftOAuthSpec: QuickSpec {
    override func spec() {
        describe("createBaseString") {
            let oauth = RxTwiftOAuth(
                consumerKey: "aaa",
                consumerSecret: "bbb",
                accessToken: "ccc",
                accessTokenSecret: "ddd"
            )

            it("returns Signature Base String") {
                let baseString = oauth.createBaseString("GET", url: "http://mihyaeru.com/abc/def", params: ["key": "value", "hoge": "fuga"])
                expect(baseString) == "GET&http%3A%2F%2Fmihyaeru%2Ecom%2Fabc%2Fdef&hoge%3Dfuga%26key%3Dvalue"
            }
        }
    }
}
