//
//  CoursesViewController.swift
//  Network request
//
//  Created by Станислав on 27.11.2021.
//

import UIKit

class CoursesViewController: UITableViewController {
    
    // MARK: - Private Properties
    private var courses: [Course] = []

    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        courses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CourseCell
        let course = courses[indexPath.row]
        
        cell.configure(with: course)
        
        return cell
    }
}

// MARK: - Networking
extension CoursesViewController {
    func fetchCourses() {
        guard let url = URL(string: Link.exampleTwo.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                self.courses = try JSONDecoder().decode([Course].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
