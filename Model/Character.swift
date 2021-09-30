import Foundation
struct Character : Identifiable, Codable, Hashable {
    internal let id = UUID()
    var char_id: Int
    var name: String
    var birthday: String
    var occupation: [String]
    var img: String
    var status: String
    var nickname: String
    var appearance: [Int]
    var portrayed: String
    var category: String
    
}
