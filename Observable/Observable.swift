//
//  Observable.swift
//  Observable
//
//  Created by ByungHoon Ann on 2022/12/14.
//

import Foundation

class Observable<T> {
    
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    func subscribe(listener: @escaping (T) -> Void) {
        listener(value)
        self.listener = listener
    }
    
 
}
