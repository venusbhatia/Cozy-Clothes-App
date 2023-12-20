import SwiftUI
import FirebaseAnalytics
import FirebaseInstallations
import FirebaseCore
import FirebaseRemoteConfig
import FirebaseRemoteConfigSwift

struct MainTabView: View {

    @State var selected = 0
    @StateObject var cartManager = CartManager()
    @State private var showsNewUI = false

    var remoteConfig = RemoteConfig.remoteConfig()
    let settings = RemoteConfigSettings()

    var body: some View {
        ZStack {
            Color.red
            .edgesIgnoringSafeArea(.all)

            TabView(selection: $selected) {
                ContentView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }.tag(0)

                Shopping()
                    .tabItem {
                        Image(systemName: "tshirt.fill")
                        Text("Shop")
                    }.tag(1)

                ProfileView()
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Profile")
                    }.tag(2)
                
                ShopWebView()
                    .tabItem {
                        Image(systemName: "network")
                        Text("Shop")
                    }.tag(3)
            }
            .colorScheme(showsNewUI ? .dark : .light)
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear {
           
            settings.minimumFetchInterval = 0
            remoteConfig.configSettings = settings

            remoteConfig.setDefaults(fromPlist: "RemoteConfigDefaults")

            remoteConfig.fetch { (status, error) -> Void in
              if status == .success {
                print("Config fetched!")
                self.remoteConfig.activate { changed, error in
                  if let error = error {
                    print("Error: \(error.localizedDescription)")
                  }
                }
              } else {
                print("Config not fetched")
                print("Error: \(error?.localizedDescription ?? "No error available.")")
              }
              self.showsNewUI = self.remoteConfig["showsNewUI"].boolValue ?? false
            }

            remoteConfig.addOnConfigUpdateListener { configUpdate, error in
              guard let configUpdate = configUpdate, error == nil else {
                print("Error listening for config updates: \(error.debugDescription)")
                return
              }

              print("Updated keys: \(configUpdate.updatedKeys)")

              self.remoteConfig.activate { changed, error in
                if let error = error {
                  print("Error: \(error.localizedDescription)")
                  return
                }
                DispatchQueue.main.async {
                  self.showsNewUI = self.remoteConfig["showsNewUI"].boolValue ?? false
                }
              }
            }
            
        }
    }
}

struct MainTabView_Previews: PreviewProvider {

    static var previews: some View {
        MainTabView()
    }
}
