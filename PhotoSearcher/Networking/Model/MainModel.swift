
import Foundation

struct MainModel : Decodable {
    let results: [MainModel]?
    let id : String?
	let urls : Urls?
	let links : Links?
	let user : User?
	let location : Location?
	let downloads : Int?

	enum CodingKeys: String, CodingKey {
        case results = "results"
		case id = "id"
		case urls = "urls"
		case links = "links"
		case user = "user"
		case location = "location"
		case downloads = "downloads"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        results = try? values.decodeIfPresent([MainModel].self, forKey: .results)
		id = try? values.decodeIfPresent(String.self, forKey: .id)
		urls = try? values.decodeIfPresent(Urls.self, forKey: .urls)
		links = try? values.decodeIfPresent(Links.self, forKey: .links)
		user = try? values.decodeIfPresent(User.self, forKey: .user)
		location = try? values.decodeIfPresent(Location.self, forKey: .location)
		downloads = try? values.decodeIfPresent(Int.self, forKey: .downloads)
	}

}
