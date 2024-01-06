
import SwiftUI

extension CGPoint {

    static func pointOnCircle(center: CGPoint, radius: CGFloat, angle: CGFloat) -> CGPoint {
        let x = center.x + radius * cos(angle)
        let y = center.y + radius * sin(angle)
        return CGPoint(x: x, y: y)
    }

    func distance(to: CGPoint) -> CGFloat {
        return sqrt(CGPointDistanceSquared(from: self, to: to))
    }

    private func CGPointDistanceSquared(from: CGPoint, to: CGPoint) -> CGFloat {
        return (from.x - to.x) * (from.x - to.x) + (from.y - to.y) * (from.y - to.y)
    }

    static func angleBetweenThreePoints(center: CGPoint, firstPoint: CGPoint, secondPoint: CGPoint) -> CGFloat {
        let firstAngle = atan2(firstPoint.y - center.y, firstPoint.x - center.x)
        let secondAnlge = atan2(secondPoint.y - center.y, secondPoint.x - center.x)
        var angleDiff = firstAngle - secondAnlge

        if angleDiff < 0 {
            angleDiff *= -1
        }

        return angleDiff
    }

    func midBetween(_ other: CGPoint) -> CGPoint {
        return CGPoint(x: (self.x + other.x) / 2.0,
                       y: (self.y + other.y) / 2.0)
    }

    func angleBetweenPoints(firstPoint: CGPoint, secondPoint: CGPoint) -> CGFloat {
        return CGPoint.angleBetweenThreePoints(center: self, firstPoint: firstPoint, secondPoint: secondPoint)
    }

    func pointOfCicle(center: CGPoint, radius: Double) -> CGPoint {
        let earthX = Double(self.x)
        let earthY = Double(self.y)
        let midViewXDouble = Double(center.x)
        let midViewYDouble = Double(center.y)
        let angleX = (earthX - midViewXDouble)
        let angleY = (earthY - midViewYDouble)
        let radian = atan2(angleY, angleX)
        let earthX2 = midViewXDouble + cos(radian)*radius
        let earthY2 = midViewYDouble + sin(radian)*radius
        return CGPoint(x: earthX2, y: earthY2)
    }

}
