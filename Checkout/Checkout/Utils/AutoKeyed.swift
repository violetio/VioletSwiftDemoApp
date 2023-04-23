/**
    The protocol AutoKeyed provides more automatic support for data types with a Hashable Key by which the type will be Identified and Tracked.
    - `autoKey`, `autoTuple()` and `autoTuples()`: These work together make it automatic to turn an Array of any `AutoKeyed` based typed into a Dictionary automatically Keyed by the `autoKey`
    - `autoTuples()` then supports `autoDictionary()`: `Sequence<AutoKeyed_Type>.autoDictionary() -> [Key:AutoKeyed_Type]`
    - `allKeys()` provides an Array of the Keys in a Collection
    - `autoKeySet()` provides a Set of the Keys in a Collection
 */
public protocol AutoKeyed {
    associatedtype Key: Hashable
    typealias KeySet = Set<Key>

    var autoKey: Key { get }
    func autoTuple() -> (Key, Self)
}

extension AutoKeyed {
    public func autoTuple() -> (Key, Self) {
        return (autoKey, self)
    }
}

extension Sequence where Element: AutoKeyed {
    ///- `autoTuples()` produces an array of Tuples via autoTuple() returning a **[(Key,AutoKeyed_Type)]**
    public func autoTuples() -> [(Element.Key, Element)] {
        return self.map { $0.autoTuple() }
    }

    ///- `autoDictionary()` produces a `Dictionary<Key,AutoKeyed_Type>` from a Sequence<AutoKeyed_Type>
    public func autoDictionary() -> Dictionary<Element.Key, Element> {
        return Dictionary(uniqueKeysWithValues: autoTuples())
    }

    ///- `allKeys()` produces an Array<Key> containing all the autoKeys in a Sequence<AutoKeyed_Type>
    public func allKeys() -> [Element.Key] {
        return self.map { $0.autoKey }
    }

    ///- `autoKeySet()` produces an Set<Key> containing all the autoKeys in a Sequence<AutoKeyed_Type>
    public func autoKeySet() -> Element.KeySet {
        return Set(allKeys())
    }
}
