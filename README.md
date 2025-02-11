# LFMKit
Interact with Last.FM API in Swift.

Setup
----
**Install using Swift Package Manager**
```swift
dependencies: [
    .package(url: "https://github.com/verizxn/LFMKit", branch: "main")
],
```

Usage
---
- [Docs reference wiki](https://github.com/verizxn/LFMKit/wiki)
- [Last.FM API docs](https://www.last.fm/api)

Examples
---
- Authentication:
```swift
import UIKit
import AuthenticationServices

import LFMKit

class ExampleViewController: UIViewController, ASWebAuthenticationPresentationContextProviding {
    private let lfmsession = LFMKit(api_key: "API_KEY", api_secret: "API_SECRET")
    
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return ASPresentationAnchor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let svc = ASWebAuthenticationSession(url: lfmsession.auth.getLoginURL(callback: "myappcallback://"), callbackURLScheme: "myappcallback", completionHandler: { request, error in
            guard let url = request,
                  let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
                  let queries = components.queryItems,
                  let query = queries.first else {
                print("Error")
                return
            }
            
            if query.name == "token",
               let token = query.value {
                self.lfmsession.auth.getSession(token: token) { session in
                    print("Logged in as \(session.name)")
                    
                    // #TODO: Store safely the session
                } error: { error in
                    print(error.message)
                }
            } else {
                print("Missing token.")
            }
        })
        svc.presentationContextProvider = self
        svc.start()
    }
}
```

- Get recent tracks:
```swift
// #TODO: Retrieve the session from previous login
let session = LFMResponseSession(name: ..., key: ..., subscriber: ...)
lfmsession.setSession(session: session)

let username = lfmsession.session?.name ?? session.name
lfmsession.user.getRecentTracks(username: username, limit: 5) { tracks in
    for track in tracks {
        print("\(track.artist) - \(track.name)")
    }
}
```
