import SwiftUI

struct ContentView: View {

    @State var isNight: Bool = false

    var body: some View {
        ZStack {
            BackgroundGradient(
                topColor: isNight ? .black : .blue,
                bottomColor: isNight ? .gray : Color("lightBlue"))

            VStack {
                CityLabel(cityName: "Kabul, IEA")
                FrontalWeatherHighlight(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: 28)
                HStack(spacing: 20) {
                    WeatherDayView(
                        dayOfWeek: "Sat", imageName: "cloud.sun.fill",
                        temperature: 33)
                    WeatherDayView(
                        dayOfWeek: "Sun", imageName: "sun.max.fill",
                        temperature: 38)
                    WeatherDayView(
                        dayOfWeek: "Mon", imageName: "wind.snow",
                        temperature: 19)
                    WeatherDayView(
                        dayOfWeek: "Tue", imageName: "sunset.fill",
                        temperature: 22)
                    WeatherDayView(
                        dayOfWeek: "Wed", imageName: "snow",
                        temperature: 12)
                }
                Spacer()
                Button {
                    isNight = !isNight
                } label: {
                    ButtonContent(
                        title: "Change Day Time", textColor: isNight ? .black : .blue,
                        backgroundColor: .white
                    )
                }
                Spacer()
            }
        }
    }
}

struct ButtonContent: View {
    let title: String
    let textColor: Color
    let backgroundColor: Color

    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .font(
                .system(size: 20, weight: .bold, design: .default)
            )
            .foregroundColor(textColor)
            .cornerRadius(10.0)
    }
}

struct WeatherDayView: View {
    let dayOfWeek: String
    let imageName: String
    let temperature: Int

    var body: some View {
        VStack(spacing: 0) {
            Text(dayOfWeek.uppercased())
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28))
                .foregroundColor(.white)
        }
    }
}

#Preview {
    ContentView()
}

struct BackgroundGradient: View {
    let topColor: Color
    let bottomColor: Color

    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [topColor, bottomColor]),
            startPoint: .topLeading, endPoint: .bottomTrailing
        ).ignoresSafeArea(.all)
    }
}

struct CityLabel: View {
    let cityName: String
    var body: some View {
        Text(cityName)
            .font(
                .system(size: 32, weight: .semibold, design: .default)
            )
            .foregroundColor(.white)
            .padding()
    }
}

struct FrontalWeatherHighlight: View {
    let imageName: String
    let temp: Int

    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temp)°")
                .font(.system(size: 70, weight: .bold))
                .foregroundColor(.white)
        }.padding(.bottom, 40)
    }

}
