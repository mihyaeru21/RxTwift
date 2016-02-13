// https://github.com/Quick/Quick

import Quick
import Nimble
import RxTwift

class RxTwiftOAuthSpec: QuickSpec {
    override func spec() {
        describe("createAuthorizationHeaderElement") {
            class TestRandom: RxTwiftRandomProtocol {
                var nonce: String { return "kllo9940pd9333jh" }
            }
            class TestTimestamp: RxTwiftTimestampProtocol {
                var current: Int { return 1191242096 }
            }

            let oauth = RxTwiftOAuth(
                consumerKey: "dpf43f3p2l4k3l03",
                consumerSecret: "kd94hf93k423kf44",
                accessToken: "nnch734d00sl2jdk",
                accessTokenSecret: "pfkkdhi9sl3r4s00",
                random: TestRandom(),
                timestamp: TestTimestamp()
            )

            it("returns Authorization Header") {
                let element = oauth.createAuthorizationHeaderElement("GET", url: "http://photos.example.net/photos", params: ["size": "original", "file": "vacation.jpg"])
                expect(element!.key) == "Authorization"
                expect(element!.value) == "OAuth oauth_consumer_key=\"dpf43f3p2l4k3l03\", oauth_nonce=\"kllo9940pd9333jh\", oauth_signature=\"tR3%2BTy81lMeYAr%2FFid0kMTYa%2FWM%3D\", oauth_signature_method=\"HMAC-SHA1\", oauth_timestamp=\"1191242096\", oauth_token=\"nnch734d00sl2jdk\", oauth_version=\"1.0\""
            }
        }
    }
}
