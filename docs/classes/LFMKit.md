**CLASS**

# `LFMKit`

```swift
public class LFMKit
```

## Properties
### `session`

```swift
public var session: LFMSession?
```

### `user`

```swift
public let user: LFMUser
```

### `track`

```swift
public var track: LFMTrack
```

### `auth`

```swift
public var auth: LFMAuth
```

## Methods
### `init(api_key:api_secret:)`

```swift
public init(api_key: String, api_secret: String)
```

Initialize the class.
- Parameters:
  - api_key: A Last.fm API key.
  - api_secret: A Last.fm API secret.

#### Parameters

| Name | Description |
| ---- | ----------- |
| api_key | A Last.fm API key. |
| api_secret | A Last.fm API secret. |

### `setSession(session:)`

```swift
public func setSession(session: LFMSession)
```

Sets the session.
- Parameter session: LFMResponseSession(name: String, key: String, subscriber: Int)

#### Parameters

| Name | Description |
| ---- | ----------- |
| session | LFMResponseSession(name: String, key: String, subscriber: Int) |