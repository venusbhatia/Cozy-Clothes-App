import SwiftUI
import WebKit
import Firebase
import FirebaseAnalytics

struct ShopWebView: View {
    @State private var showWebView = false
    private let urlString: String = "https://fir-website-for-webview.web.app"

    var body: some View {
        VStack(spacing: 10) {

            WebView(url: URL(string: urlString)!)
        }
    }
}

struct WebView: UIViewRepresentable {

    var url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

struct ShopWebView_Previews: PreviewProvider {
    static var previews: some View {
        ShopWebView()
    }
}

func userContentController(_ userContentController: WKUserContentController,
                         didReceive message: WKScriptMessage) {
  guard let body = message.body as? [String: Any] else { return }
  guard let command = body["command"] as? String else { return }
  guard let name = body["name"] as? String else { return }

  if command == "setUserProperty" {
    guard let value = body["value"] as? String else { return }
    Analytics.setUserProperty(value, forName: name)
  } else if command == "logEvent" {
    guard let params = body["parameters"] as? [String: NSObject] else { return }
    Analytics.logEvent(name, parameters: params)
  }
}



//struct ShopWebView: View {
//    @State private var showWebView = false
//    private let urlString: String = ""
//
//    var body: some View {
//        VStack(spacing: 10) {
//
//            WebView(url: URL(string: urlString)!)
//        }
//    }
//}
//
//struct WebView: UIViewRepresentable {
//    var url: URL
//    func makeUIView(context: Context) -> WKWebView {
//        let webView = WKWebView()
//        webView.configuration.userContentController.add(context.coordinator, name: "firebase")
//        return webView
//    }
//
//    func updateUIView(_ webView: WKWebView, context: Context) {
//        let request = URLRequest(url: url)
//        webView.load(request)
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator()
//    }
//
//    class Coordinator: NSObject, WKScriptMessageHandler {
//        func userContentController(_ userContentController: WKUserContentController,
//                                   didReceive message: WKScriptMessage) {
//            guard let body = message.body as? [String: Any] else { return }
//            guard let command = body["command"] as? String else { return }
//            guard let name = body["name"] as? String else { return }
//
//            if command == "setUserProperty" {
//                guard let value = body["value"] as? String else { return }
//                Analytics.setUserProperty(value, forName: name)
//            } else if command == "logEvent" {
//                guard let params = body["parameters"] as? [String: NSObject] else { return }
//                Analytics.logEvent(name, parameters: params)
//            }
//        }
//    }
//}
