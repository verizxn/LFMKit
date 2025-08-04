**CLASS**

# `LFMUser`

```swift
public class LFMUser: LFMRequest
```

## Methods
### `getInfo(username:success:error:)`

```swift
public func getInfo(username: String, success: @escaping (LFMResponseUser) -> Void, error: ((LFMError) -> Void)? = nil)
```

Get information about a user profile.
- Parameters:
  - username: The user to fetch info for. Defaults to the authenticated user.
  - success: Success function (LFMResponseUser) -> Void
  - error: (Optional) Error function (LFMError) -> Void

#### Parameters

| Name | Description |
| ---- | ----------- |
| username | The user to fetch info for. Defaults to the authenticated user. |
| success | Success function (LFMResponseUser) -> Void |
| error | (Optional) Error function (LFMError) -> Void |

### `getRecentTracks(username:page:from:to:extended:limit:success:error:)`

```swift
public func getRecentTracks(username: String, page: Int? = nil, from: Int? = nil, to: Int? = nil, extended: Bool = false, limit: Int = 50, success: @escaping ([LFMResponseTrack]) -> Void, error: ((LFMError) -> Void)? = nil)
```

Get a list of the recent tracks listened to by this user.
- Parameters:
  - username: The last.fm username to fetch the recent tracks of.
  - page: The page number to fetch. Defaults to first page.
  - from: Beginning timestamp of a range - only display scrobbles after this time, in UNIX timestamp format (integer number of seconds since 00:00:00, January 1st 1970 UTC). This must be in the UTC time zone.
  - to: End timestamp of a range - only display scrobbles before this time, in UNIX timestamp format (integer number of seconds since 00:00:00, January 1st 1970 UTC). This must be in the UTC time zone.
  - extended: Includes extended data in each artist, and whether or not the user has loved each track.
  - limit: The number of results to fetch per page. Defaults to 50. Maximum is 200.
  - success: Success function ([LFMResponseTrack]) -> Void
  - error: (Optional) Error function (LFMError) -> Void

#### Parameters

| Name | Description |
| ---- | ----------- |
| username | The last.fm username to fetch the recent tracks of. |
| page | The page number to fetch. Defaults to first page. |
| from | Beginning timestamp of a range - only display scrobbles after this time, in UNIX timestamp format (integer number of seconds since 00:00:00, January 1st 1970 UTC). This must be in the UTC time zone. |
| to | End timestamp of a range - only display scrobbles before this time, in UNIX timestamp format (integer number of seconds since 00:00:00, January 1st 1970 UTC). This must be in the UTC time zone. |
| extended | Includes extended data in each artist, and whether or not the user has loved each track. |
| limit | The number of results to fetch per page. Defaults to 50. Maximum is 200. |
| success | Success function ([LFMResponseTrack]) -> Void |
| error | (Optional) Error function (LFMError) -> Void |

### `getFriends(username:success:error:)`

```swift
public func getFriends(username: String, success: @escaping ([LFMResponseUser]) -> Void, error: ((LFMError) -> Void)? = nil)
```

Get a list of the user's friends on Last.fm.
- Parameters:
  - username: The last.fm username to fetch the friends of.
  - success: Success function ([LFMResponseUser]) -> Void
  - error: (Optional) Error function (LFMError) -> Void

#### Parameters

| Name | Description |
| ---- | ----------- |
| username | The last.fm username to fetch the friends of. |
| success | Success function ([LFMResponseUser]) -> Void |
| error | (Optional) Error function (LFMError) -> Void |