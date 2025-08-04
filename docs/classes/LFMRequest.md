**CLASS**

# `LFMRequest`

```swift
public class LFMRequest
```

## Properties
### `session`

```swift
public var session: LFMSession!
```

## Methods
### `init(keys:)`

```swift
public init(keys: LFMKeys)
```

### `request(method:parameters:success:error:requiresSignature:type:)`

```swift
public func request(method: String, parameters: Parameters, success: @escaping (LFMResponse) -> Void, error: ((LFMError) -> Void)? = nil, requiresSignature: Bool = false, type: HTTPMethod = .get)
```
