import UIKit

extension NSLayoutConstraint {
    static func visual(_ rows: [String: NSLayoutConstraint.FormatOptions ], _ views: [String: Any], _ metrics: [String: Any]? ) {
        activate({
            var constraints: [NSLayoutConstraint] = []
            
            for(format, options) in rows{
                constraints.append(contentsOf: NSLayoutConstraint.constraints(
                    withVisualFormat: format,
                    options: options,
                    metrics: metrics,
                    views: views
                ))
            }
            
            return constraints
        }())
    }
}
