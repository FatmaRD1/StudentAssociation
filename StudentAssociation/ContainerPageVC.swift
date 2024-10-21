//
//  ContainerPageVC.swift
//  StudentAssociation
//
//  Created by Fatma AlDarwish on 07/11/2023.
//

import UIKit

class ContainerPageVC: UIPageViewController ,   UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    var pageControl = UIPageControl()
    var arrContainers = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0.97, green: 0.92, blue: 0.94, alpha: 1.0)

        //first page
        let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "page1")
        
        //second page
        let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "page2")
        
        //thired page
        let vc3 = self.storyboard?.instantiateViewController(withIdentifier: "page3")
        
        arrContainers.append(vc1!)
        arrContainers.append(vc2!)
        arrContainers.append(vc3!)
        
        delegate=self
        dataSource=self
        
        if let firstVC = arrContainers.first{
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        addPageControl()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = arrContainers.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = currentIndex -  1
        
        guard previousIndex >= 0 else{
            return nil
            //return arrContainers.last
        }
        return arrContainers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = arrContainers.firstIndex(of: viewController) else{
          return nil
        }
        let afterIndex = currentIndex + 1
        
        guard afterIndex < arrContainers.count else {
            return nil
            //return arrContainers.first
        }
        return arrContainers[afterIndex]
    }
    
    func addPageControl(){
        pageControl = UIPageControl (frame: CGRect (x: 0, y: UIScreen.main.bounds.maxY -
        75, width: UIScreen.main.bounds.width, height: 50))
        self.pageControl.numberOfPages = arrContainers.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.gray
        self.pageControl.pageIndicatorTintColor = UIColor.black
        self.pageControl.currentPageIndicatorTintColor = UIColor.gray
        self.view.addSubview (pageControl)
        self.view.addSubview(pageControl)
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool,
                             previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = arrContainers.firstIndex (of: pageContentViewController)!
    }
    
    /*
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return arrContainers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

