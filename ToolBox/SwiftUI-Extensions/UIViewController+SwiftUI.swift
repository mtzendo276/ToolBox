
import SwiftUI
import UIKit
//import SnapKit

extension UIViewController {

    func addSubSwiftUIView<Content>(_ swiftUIView: Content, to view: UIView) where Content : View {
        let hostingController = UIHostingController(rootView: swiftUIView)
        addChild(hostingController)
        view.addSubview(hostingController.view)
//        hostingController.view.snp.makeConstraints { make in
//            make.top.equalToSuperview()
//            make.bottom.equalToSuperview()
//            make.left.equalToSuperview()
//            make.right.equalToSuperview()
//        }
        hostingController.didMove(toParent: self)
    }

}
