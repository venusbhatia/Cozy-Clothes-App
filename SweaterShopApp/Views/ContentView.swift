import SwiftUI
import FirebaseAnalytics
import FirebaseCore
import FirebaseInstallations
import Messages
import FirebaseMessaging

struct ContentView: View {
    
    //var fcmRegTokenMessage = UITextView()
    
    @State var index = 0
    var arrImage = ["collage1", "collage2", "collage3", "collage4"]
    var timer: Timer?
    
    @State private var selection: Int? = nil
    @State var show = false
    
    @StateObject var cartManager = CartManager()
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    fileprivate func ImageSlider() -> some View {
        var mutableSelf = self
        
        return VStack {
            PagingView(index: $index.animation(), maxIndex: self.arrImage.count - 1) {
                ForEach(self.arrImage, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: 210)
                }
            }
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.width, height: 210)
            
            .onAppear {
                    mutableSelf.timer = Timer.scheduledTimer(withTimeInterval: 7, repeats: true) { timer in
                        let nextIndex = (mutableSelf.index + 1) % mutableSelf.arrImage.count
                        withAnimation {
                            mutableSelf.index = nextIndex
                        }
                    }
                
                func application (_ application: UIApplication, didRegisterForemoteNotificationsWithDeviceToken deviceToken: Data) {
                    print (deviceToken.map ({String (format: "%02×", $0)}) . joined())
                }
                    
                    // Prepare promotion parameters
                    var promoParams: [String: Any] = [
                        AnalyticsParameterPromotionID: "T12345",
                        AnalyticsParameterPromotionName:"Summer Sale",
                        AnalyticsParameterCreativeName: "summer2020_promo.jpg",
                        AnalyticsParameterCreativeSlot: "featured_app_1",
                        AnalyticsParameterLocationID: "HERO_BANNER",
                    ]
                    
                    // Add items
                    promoParams[AnalyticsParameterItems] = [OrangeSweater, PinkSweater, BlueJeans, BlackJeans, WhiteJeans]
                    
                    // Log event when promotion is displayed
                    Analytics.logEvent(AnalyticsEventViewPromotion, parameters: promoParams)
                    
                    Analytics.logEvent(AnalyticsEventScreenView,
                                       parameters: [AnalyticsParameterScreenName: "HomeScreen",
                                                   AnalyticsParameterScreenClass: "screenClass"])
                    
                    // Log event when promotion is selected
                    //Analytics.logEvent(AnalyticsEventSelectPromotion, parameters: promoParams)
                    
                }
                    .onDisappear {
                        mutableSelf.timer?.invalidate()
                    }
            }
        }
        
        var body: some View {
            NavigationView {
                ScrollView {
                    VStack {
                        ImageSlider()
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(productList, id: \.id) { product in
                                ProductCard(product: product, cartManager: cartManager)
                                    .environmentObject(cartManager)
                            }
                        }
                    }
                    .padding()
                }
                .navigationTitle(Text("Tatvic E-Store")
                    .fontWeight(.bold))
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    NavigationLink {
                        CartView(product: productList[0])
                            .environmentObject(cartManager)
                    } label: {
                        CartButton(numberOfProducts: cartManager.products.count)
                    }
                }
                
            }
            .navigationViewStyle(StackNavigationViewStyle())
            
            .onAppear {
                
                // Add item indexes
                PinkSweater[AnalyticsParameterIndex] = 1
                BlueJeans[AnalyticsParameterIndex] = 2
                BlackJeans[AnalyticsParameterIndex] = 3
                WhiteJeans[AnalyticsParameterIndex] = 4
                OrangeSweater[AnalyticsParameterIndex] = 5
                RedwineSweater[AnalyticsParameterIndex] = 6
                SandSweater[AnalyticsParameterIndex] = 7
                SeaSweater[AnalyticsParameterIndex] = 8
                CreamSweater[AnalyticsParameterIndex] = 9
                BeigeSweater[AnalyticsParameterIndex] = 10
                GreySweater[AnalyticsParameterIndex] = 11
                MinkSweater[AnalyticsParameterIndex] = 12
                
                // Prepare ecommerce parameters
                var itemList: [String: Any] = [
                    AnalyticsParameterItemListID: "List1",
                    AnalyticsParameterItemListName: "Luxury Clothing",
                ]
                
                // Add items array
                itemList[AnalyticsParameterItems] = [PinkSweater, BlueJeans, BlackJeans, WhiteJeans, OrangeSweater, RedwineSweater, SandSweater, SeaSweater, CreamSweater, BeigeSweater, GreySweater, MinkSweater]
                
                // Log view item list event
                Analytics.logEvent(AnalyticsEventViewItemList, parameters: itemList)
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
