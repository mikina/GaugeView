import SwiftUI

struct ContentView: View {
    @State var loading = 50.0

    var body: some View {
        VStack {
            Gauge(value: loading, in: 50...200) {
                Text("Loading")
            } currentValueLabel: {
                Text("\(loading)")
            } minimumValueLabel: {
                Text("50")
                    .font(.system(size: 10))
            } maximumValueLabel: {
                Text("200")
                    .font(.system(size: 10))
            }
            .gaugeStyle(.accessoryCircular)
            .tint(Gradient(colors: [.green, .yellow, .orange, .red]))

            Gauge(value: loading, in: 50...200) {
                Text("Loading")
            } currentValueLabel: {
                Text("\(loading)")
            } minimumValueLabel: {
                Text("50")
                    .font(.system(size: 10))
            } maximumValueLabel: {
                Text("200")
                    .font(.system(size: 10))
            }
            .gaugeStyle(.accessoryCircularCapacity)
            .tint(.green)

            Gauge(value: loading, in: 50...200) {
                Text("Loading")
            } currentValueLabel: {
                Text("\(loading)")
            } minimumValueLabel: {
                Text("50")
                    .font(.system(size: 10))
            } maximumValueLabel: {
                Text("200")
                    .font(.system(size: 10))
            }
            .gaugeStyle(.linearCapacity)
            .tint(Gradient(colors: [.blue, .green]))

            ProgressView(value: loading, total: 200) {
                Text("Loading")
            } currentValueLabel: {
                Text("\(loading)")
            }

            Spacer()
        }
        .padding()
        .onAppear {
            Task {
                for i in 50...150 {
                    loading = Double(i)

                    try await Task.sleep(for: .milliseconds(20))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
