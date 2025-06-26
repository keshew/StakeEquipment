import SwiftUI

struct StakeGuideView: View {
    @StateObject var stakeGuideModel =  StakeGuideViewModel()
    @State private var isSharePresented = false
    
    var body: some View {
        ZStack {
            Color(red: 22/255, green: 42/255, blue: 57/255).ignoresSafeArea()
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack {
                    Text("Care Guide")
                        .PoppinsBold(size: 24)
                    
                    VStack(spacing: 20) {
                        ForEach(Array(stakeGuideModel.arrayOfGallery.enumerated()), id: \.element.id) { index, item in
                            Rectangle()
                                .fill(Color(red: 25/255, green: 49/255, blue: 72/255))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color(red: 28/255, green: 62/255, blue: 99/255), lineWidth: 3)
                                        .overlay {
                                            VStack {
                                                HStack {
                                                    Text(stakeGuideModel.arrayOfGallery[index].title)
                                                        .PoppinsBold(size: 18)
                                                    
                                                    Spacer()
                                                    
                                                    Image(stakeGuideModel.arrayOfGallery[index].image)
                                                        .resizable()
                                                        .frame(width: 40, height: 40)
                                                }
                                                
                                                Spacer()
                                                
                                                Text(stakeGuideModel.arrayOfGallery[index].text)
                                                    .Poppins(size: 16, color: Color(red: 183/255, green: 191/255, blue: 199/255))
                                                
                                                Spacer()
                                                
                                                HStack {
                                                    Image(systemName: item.isDone ? "bookmark.fill" : "bookmark")
                                                        .font(.system(size: 18))
                                                        .foregroundStyle(Color(red: 45/255, green: 115/255, blue: 211/255))
                                                        .onTapGesture {
                                                            stakeGuideModel.toggleDone(for: index)
                                                        }
                                                    
                                                    Text("Save")
                                                        .Poppins(size: 16, color: Color(red: 45/255, green: 115/255, blue: 211/255))
                                                    
                                                    Spacer()
                                                    
                                                    Image("share")
                                                        .resizable()
                                                        .frame(width: 18, height: 20)
                                                    
                                                    Text("Share")
                                                        .Poppins(size: 16, color: Color(red: 45/255, green: 115/255, blue: 211/255))
                                                        .onTapGesture {
                                                            stakeGuideModel.pickedGallery = stakeGuideModel.arrayOfGallery[index]
                                                            isSharePresented = true
                                                        }
                                                }
                                            }
                                            .padding()
                                            
                                            
                                        }
                                }
                                .frame(height: 216)
                                .cornerRadius(16)
                                .padding(.horizontal)
                        }
                    }
                    
                    Color.clear.frame(height: 80)
                }
                .padding(.top)
            }
        }
        .sheet(isPresented: $isSharePresented) {
            ShareSheet(items: [stakeGuideModel.pickedGallery.text])
        }
    }
}

#Preview {
    StakeGuideView()
}

struct ShareSheet: UIViewControllerRepresentable {
    var items: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: items, applicationActivities: nil)
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
