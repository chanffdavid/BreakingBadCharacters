import Foundation
import Alamofire

// MARK: Network Manager
enum services :String{
    case characters
    case episodes
    case quotes
    case deaths
}

class BreakingBadApi {
    
    var parameters = Parameters()
    var headers = HTTPHeaders()
    var method: HTTPMethod!
    let baseurl = "https://breakingbadapi.com/api/"
    var url = ""
    var encoding: ParameterEncoding! = JSONEncoding.default
 
    init(data: [String:Any],headers: [String:String] = [:],service :services, method: HTTPMethod = .post, isJSONRequest: Bool = true){
        data.forEach{parameters.updateValue($0.value, forKey: $0.key)}
        headers.forEach({self.headers.add(name: $0.key, value: $0.value)})
        url = baseurl + service.rawValue
        if !isJSONRequest{
            encoding = URLEncoding.default
        }
        self.method = method
        print("Service: \(service.rawValue) \n data: \(parameters)")
    }
    
    func executeQuery<T>(completion: @escaping (Result<T, Error>) -> Void) where T: Codable {
        AF.request(url,method: method,parameters: parameters,encoding: encoding, headers: headers).responseData(completionHandler: {response in
            switch response.result{
            case .success(let res):
                if let code = response.response?.statusCode{
                    switch code {
                    case 200...299:
                        do {
                            completion(.success(try JSONDecoder().decode(T.self, from: res)))
                        } catch let error {
                            print(String(data: res, encoding: .utf8) ?? "nothing received")
                            completion(.failure(error))
                        }
                    default:
                     let error = NSError(domain: response.debugDescription, code: code, userInfo: response.response?.allHeaderFields as? [String: Any])
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}

/**
 *check connectivity
*/
class Connectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
