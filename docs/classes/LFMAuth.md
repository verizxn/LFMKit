**CLASS**

# `LFMAuth`

```swift
public class LFMAuth: LFMRequest
```

## Methods
### `getLoginURL(callback:)`

```swift
public func getLoginURL(callback: String) -> URL
```

Get login url to authenticate the user.
- Parameter callback: Your application callback.
- Returns: Returns URL.

#### Parameters

| Name | Description |
| ---- | ----------- |
| callback | Your application callback. |

### `getSession(token:success:error:)`

```swift
public func getSession(token: String, success: @escaping (LFMSession) -> Void, error: ((LFMError) -> Void)? = nil)
```

Fetch a session key for a user. The third step in the authentication process.
- Parameters:
  - token: A 32-character ASCII hexadecimal MD5 hash returned by step 1 of the authentication process (following the granting of permissions to the application by the user).
  - success: Success function (LFMSession) -> Void
  - error: (Optional) Error function (LFMError) -> Void

#### Parameters

| Name | Description |
| ---- | ----------- |
| token | A 32-character ASCII hexadecimal MD5 hash returned by step 1 of the authentication process (following the granting of permissions to the application by the user). |
| success | Success function (LFMSession) -> Void |
| error | (Optional) Error function (LFMError) -> Void |