//
//  MapsViewController.swift
//  MiniProjetFCWBN
//
//  Created by MASTERAPP on 23/11/21.
//

import UIKit
import MapKit
import CoreLocation
class MapsViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate  {
    let locationManager = CLLocationManager()
    @IBOutlet weak var sos: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let africaSos = MKPointAnnotation()
        africaSos.title = "Africa assistance"
        africaSos.coordinate = CLLocationCoordinate2D(latitude: 36.8492352, longitude: 10.1979002)
        let esprit = MKPointAnnotation()
        esprit.title = "Esprit"
        esprit.coordinate = CLLocationCoordinate2D(latitude: 36.898943, longitude: 10.189758)
        sos.addAnnotation(africaSos)
        sos.addAnnotation(esprit)
                // Do any additional setup after loading the view.
        
        self.locationManager.requestAlwaysAuthorization()

            // For use in foreground
            self.locationManager.requestWhenInUseAuthorization()

            if CLLocationManager.locationServicesEnabled() {
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyBest
                locationManager.startUpdatingLocation()
            }

            sos.delegate = self
            sos.mapType = .standard
            sos.isZoomEnabled = true
            sos.isScrollEnabled = true

            if let coor = sos.userLocation.location?.coordinate{
                sos.setCenter(coor, animated: true)
            }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate

        sos.mapType = MKMapType.standard

        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: locValue, span: span)
        sos.setRegion(region, animated: true)

        let annotation = MKPointAnnotation()
        annotation.coordinate = locValue
        annotation.title = "Firas"
        annotation.subtitle = "current location"
        sos.addAnnotation(annotation)

        //centerMap(locValue)
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard annotation is MKPointAnnotation else {return nil}
        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        }else{
            annotationView!.annotation = annotation
        }
        return annotationView
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
