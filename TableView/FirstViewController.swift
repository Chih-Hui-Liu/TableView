//
//  FirstViewController.swift
//  TableView
//
//  Created by Leo on 2021/1/3.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var secondImage2: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    var image : UIImage?
    var image2 : UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        secondImage.image = image
        secondImage2.image = image2
      
    }
    
    @IBAction func pageChange(_ sender: UIPageControl) {
        let point = CGPoint(x: scrollView.bounds.width * CGFloat(sender.currentPage), y: 0)
        scrollView.setContentOffset(point, animated: true)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension FirstViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        for pageView in scrollView.subviews {
                  if pageView.isKind(of: UIView.self){ //isKind
                     return pageView
                  }
               }
               return nil
   }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x/scrollView.bounds.width
        pageControl.currentPage = Int(page)
    }
}
