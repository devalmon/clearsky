import PlaygroundSupport
import UIKit
/*

let config = URLSessionConfiguration.default
config.waitsForConnectivity = true
let session = URLSession.init(configuration: config)
let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
let dt = session.dataTask(with: url) { (data, response, error) in
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { return }
    guard let data = data else {
        print(error.debugDescription)
        return
    }
    if let result = String(data: data, encoding: .utf8) as String? {
        print(result)
        PlaygroundPage.current.finishExecution()
    }
}
dt.resume()

*/

//class PersonClass {
//    var name: String
//    var lastName: String
//    var fullName: String {
//        return "\(name) \(lastName)"
//    }
//
//    init(name: String, lastName: String) {
//        self.name = name
//        self.lastName = lastName
//        print("full init")
//    }
//    init(name: String) {
//        self.name = name
//        self.lastName = "default last name"
//        print("def lastname init")
//    }
//    init(lastName: String) {
//        self.name = "default name"
//        self.lastName = lastName
//        print("def name init")
//    }
//    deinit {
//        print("deinit")
//    }
//}
//
//var pers1 = PersonClass(name: "stive", lastName: "jobs")
//var pers2 = pers1
//pers2 = PersonClass(name: "max", lastName: "plank")
//pers2 = pers1
//pers2.lastName = "test"
/*
enum SFSymbols {
    static let play = UIImage(systemName: "playpause.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 26, weight: .black, scale: .large))?.withTintColor(UIColor.black)
    static let blackPlay = play?.withTintColor(.black, renderingMode: .alwaysOriginal)
}


enum SocialPlatform: String, CaseIterable {
    case twitter
    case facebook
    case vk
}

func shareImage(on platform: SocialPlatform) {
    switch platform {
    case .facebook:
        print("facebook")
    case .twitter:
        print("twitter")
    case .vk:
        print("vk")
    }
}

shareImage(on: .facebook)

class CustomCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cell")
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

class MainVC: UITableViewController {
    
    override init(style: UITableView.Style) {
        super.init(style: style)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "title"
        view.backgroundColor = UIColor.white
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCell
        cell.backgroundColor = UIColor.systemPink
        cell.textLabel?.text = String(indexPath.row + 1)
        
        let icon = SFSymbols.blackPlay
        
        cell.imageView?.image = icon
        return cell
    }
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
let vc = UINavigationController(rootViewController: MainVC(style: .plain))

let numbers = [1.1, 2.2, 3.3]

func checkNumber<T>(number: T, inArray: [T]) -> Bool where T: Comparable {
    for item in inArray {
        if item == number {
            return true
        }
    }
    return false
}

checkNumber(number: 2.20, inArray: numbers)

PlaygroundPage.current.liveView = vc
*/
/*
 If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

 Find the sum of all the multiples of 3 or 5 below 1000.
 */

let a = 3, b = 5, c = 1000
var sum = 0

var setResult = Set<Int>()

for i in 0..<c {
    let resa = a * i
    let resb = b * i
    
    if resa < c  {
        setResult.insert(resa)
    }
    if resb < c {
        setResult.insert(resb)
    }
}

sum = setResult.reduce(0, +)

print("result: \(sum)")
PlaygroundPage.current.finishExecution()
/*
42

1 2 4 8 16 32 64 128 256 512 1024 2048 4096

10101000

16 9 3 15 3 20 6 {20 8 5 14 21 13 2 5 18 19 13 1 19 15 14}
p  i  co  c t  f {t  h e  n  u m  b e r  s  m  a  s o  n
picoCTF{}
 picoCTF{no_clients_plz_1a3c89}
 
 if (checkpass.substring(0, split) == '') {
     if (checkpass.substring(split*6, split*7) == '') {
       if (checkpass.substring(split, split*2) == '') {
        if (checkpass.substring(split*4, split*5) == '') {
         if (checkpass.substring(split*3, split*4) == '') {
           if (checkpass.substring(split*5, split*6) == '') {
             if (checkpass.substring(split*2, split*3) == '') {
               if (checkpass.substring(split*7, split*8) == '') {
                 alert("Password Verified")
 
 
 
 d35cr4mbl3_tH3_cH4r4cT3r5_ff63b0
 
*/
