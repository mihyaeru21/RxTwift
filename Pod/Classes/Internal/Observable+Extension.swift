//
//  Observable+Extension.swift
//  Pods
//
//  Created by Mihyaeru on 2/28/16.
//
//

import Foundation
import RxSwift
import Argo

internal extension Observable where Element: SequenceType {
    internal func flatMapSequence() -> Observable<Element.Generator.Element> {
        return self.flatMap { (sequence: Element) -> Observable<Element.Generator.Element> in
            return Observable<Element.Generator.Element>.create { (observer: AnyObserver<Element.Generator.Element>) -> Disposable in
                for element in sequence {
                    observer.onNext(element)
                }
                observer.onCompleted()
                return AnonymousDisposable {}
            }
        }
    }
}

internal extension Observable {
    internal func decode<T: Decodable where T == T.DecodedType>() -> Observable<T> {
        return self.map { (raw: Element) -> T in
            let json = try self.decodeToJSON(raw)
            let decoded: Decoded<T> = Argo.decode(json)
            switch decoded {
            case .Success(let value): return value
            case .Failure(let error): throw error
            }
        }
    }

    internal func decode<T: Decodable where T == T.DecodedType>() -> Observable<[T]> {
        return self.map { (raw: Element) -> [T] in
            let json = try self.decodeToJSON(raw)
            let decoded: Decoded<[T]> = Argo.decode(json)
            switch decoded {
            case .Success(let values): return values
            case .Failure(let error): throw error
            }
        }
    }

    private func decodeToJSON(raw: Element) throws -> AnyObject {
        if let data = raw as? NSData {
            return try NSJSONSerialization.JSONObjectWithData(data, options: [])
        }
        throw NSError(domain: "FIXME: make error", code: 0, userInfo: nil)
    }
}
