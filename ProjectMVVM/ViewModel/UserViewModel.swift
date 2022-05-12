
import Foundation

class UserViewModel{

    let appId = "626c31c5df0af1efad6b2d4c"

    let URL_API = "https://dummyapi.io/data/v1/user/60d0fe4f5311236168a109ca"
    
    var user : User? = nil

    func getDataFromAPI() async {
        do {
            // creamos nuestra url con su header
            var request = URLRequest(url: HelperString.getURLFromString(url: URL_API)!)
            request.httpMethod = "GET"
            request.addValue(appId, forHTTPHeaderField: "app-id")
            
            // cuando URLRequest siempre data(for: URLRequest)
            // cuando usamo URL siempre data(from: URL)
            let (data, _) = try await URLSession.shared.data(for: request)
                        
            if let decoder = try? JSONDecoder().decode(User.self, from: data) {
                DispatchQueue.main.async(execute: {
                    self.user = decoder
                })
            }
        } catch {
            print("error")
        }
    }
}
