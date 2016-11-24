import UIKit

struct Blog {
    var author: String?
    var name: String?
    var url: NSURL?
}

var myBlog = Blog(author: "Jon Hoffman", name: "Mastering Swift", url: NSURL(string: "http://masteringswift.blogspot.com"))


func blogInfo(blog: Blog?) {
    if let blog = blog {
        if let author = blog.author, let name = blog.name{
            print("BLOG:")
            print("  Author: \(author)")
            print("  name:  \(name)")
        } else {
            print("Author or name is nil")
        }
    } else {
        print("Blog is nil")
    }
}

func blogInfo2(blog: Blog?) {
    guard let blog = blog else {
        print("Blog is nil")
        return
    }
    
    guard let author = blog.author, let name = blog.name else {
        print("Author or name is nil")
        return
    }
    
    print("BLOG:")
    print("  Author: \(author)")
    print("  name:  \(name)")
}
