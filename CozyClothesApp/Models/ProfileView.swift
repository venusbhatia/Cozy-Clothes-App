import SwiftUI
import Combine
import FirebaseAnalytics
import FirebaseInstallations
import FirebaseCore

struct ProfileView: View {

    @State var selection: Int? = nil
    let arrProfile = ProfileModel.all()

    fileprivate func NavigationBarView() -> some View {
        return HStack {
            Text("")
        }
        .frame(width: UIScreen.main.bounds.width, height: 45)
        .overlay(
            Text("Profile View")
                .font(.custom(Constants.AppFont.semiBoldFont, size: 25))
                .padding(.horizontal, 10)
                .foregroundColor(.accentColor)
            , alignment: .center)
    }

    var body: some View { 
        NavigationView {
            VStack(alignment: .leading) {
                NavigationBarView()
                HStack {
                    Image("banner2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                        .padding(.leading, 15)
                    VStack(alignment: .leading) {
                        Text("Cozy Clothes")
                            .font(.headline)
                            .bold()
                        Text("cozy@clothes.com")
                            .font(.caption)
                            .foregroundColor(.accentColor)
                    }.padding(.horizontal, 5)
                    Spacer()
                }.padding(.vertical, 10)

                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(spacing: 10) {
                        ForEach(self.arrProfile, id: \.id) { profile in
                            ProfileRow(profile: profile)
                        }
                    }
                    .padding(.horizontal, 15)
                })

                Spacer()
            }
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct ProfileRow: View {

    let profile: ProfileModel

    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(5)
            VStack(alignment: .leading) {
                Text(profile.title)
                    .font(.subheadline)
                    .foregroundColor(.accentColor)
                    .bold()
                    .padding(.bottom, 1)
                Text(profile.subtitle)
                    .font(.caption)
                    .foregroundColor(.accentColor)
            }
            .padding(15)
            Spacer()
        }
    }
}
