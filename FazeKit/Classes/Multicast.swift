//
//  Multicast.swift
//  Pods
//
//  Created by swoolcock on 10/11/2016.
//
//

import Foundation

open class Multicast {
    fileprivate var blocks: [() -> ()] = []
    fileprivate var selectors: [(WeakRef, Selector)] = []
    
    public init() {
    }
    
    public func clear() {
        self.blocks.removeAll()
        self.selectors.removeAll()
    }
    
    public func clearBlocks() {
        self.blocks.removeAll()
    }
    
    public func clearSelectors() {
        self.selectors.removeAll()
    }
    
    public func invoke(delaySeconds: Double? = nil) {
        if let delaySeconds = delaySeconds {
            DispatchQueue.main.asyncAfter(deadline: .now() + delaySeconds) {
                for block in self.blocks {
                    block()
                }
                for pairs in self.selectors {
                    pairs.0.value?.perform(pairs.1)
                }
            }
        } else {
            for block in self.blocks {
                block()
            }
            for pairs in self.selectors {
                pairs.0.value?.perform(pairs.1)
            }
        }
    }
}

public func +=(lhs: inout Multicast, rhs: @escaping () -> ()) {
    lhs.blocks.append(rhs)
}

public func +=(lhs: inout Multicast, rhs: (AnyObject, Selector)) {
    if !(rhs.0.responds(to: rhs.1)) {
        // error: doesn't respond to selector!
    } else {
        lhs.selectors.append((WeakRef(value: rhs.0), rhs.1))
    }
}

public func -=(lhs: inout Multicast, rhs: (AnyObject, Selector)) {
    if let index = lhs.selectors.index(where: { $0.0.value === rhs.0 && $0.1 == rhs.1 }) {
        lhs.selectors.remove(at: index)
    }
}

public func -=(lhs: inout Multicast, rhs: AnyObject) {
    lhs.selectors = lhs.selectors.filter { $0.0.value !== rhs }
}

fileprivate struct WeakRef {
    weak var value: AnyObject?
}
