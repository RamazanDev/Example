//
//  MapViewController.swift
//  IGid
//
//  Created by Рамазан on 02.06.2020.
//  Copyright © 2020 Магомедов Рамазан. All rights reserved.
//

import UIKit
import MapKit

protocol MapViewInput: Loadable, AlertPresentable {
    func showLocation(location: Location, name: String)
}

final class MapViewController: UIViewController {
    
    // MARK: - Views
    
    private var mapView = MKMapView()
    
    
    // MARK: - Properties
    
    private let locationManager = CLLocationManager()
    
    
    // MARK: - TODO
    private var curLoc = CLLocationCoordinate2D(latitude: CLLocationDegrees(43.002165), longitude: CLLocationDegrees(47.461419))
    
    
    // MARK: - Public
    
    var presenter: MapViewOutput?
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        presenter?.viewIsReady()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationEnabled()
    }
    
    
    // MARK: - Setup funcs
    
    private func setupSubviews() {
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = UIColor.textBlack()
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.delegate = self
        mapView.mapType = .standard
        
        self.view.addSubview(mapView)
        
        mapView.edges(to: self.view)
    }
    
    private func checkLocationEnabled() {
        
        if CLLocationManager.locationServicesEnabled() {
            
            setupManager()
            checkAuthorization()
            
        } else {
            
            presenter?.locationServiceDisabled()
        }
        
    }
    
    private func setupManager() {
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
    }
    
    private func checkAuthorization() {
        
        switch CLLocationManager.authorizationStatus() {
            
        case .authorizedAlways:
            
            break
        case .authorizedWhenInUse:
            
            mapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
            mapView.showAnnotations(mapView.annotations, animated: true)
        case .denied:
            
            break
        case .restricted:
            
            break
        case .notDetermined:
            
            locationManager.requestWhenInUseAuthorization()
        default:
            
            break
        }
        
    }
    
    private func createRoute() {
//        guard let coordinate = locationManager.location?.coordinate else { return }
        let coordinate = curLoc
        
        guard let location = mapView.annotations.first as? AnnotationModel else { return }
        let startPoint = MKPlacemark(coordinate: coordinate)
        let endPoint = MKPlacemark(coordinate: location.coordinate)
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: startPoint)
        request.destination = MKMapItem(placemark: endPoint)
        request.transportType = .automobile
//        request.requestsAlternateRoutes = true
        
        let diraction = MKDirections(request: request)
        
        diraction.calculate { (response, error) in
            guard let response = response else { return }
            guard let route = response.routes.first else { return }
            
            self.mapView.addOverlay(route.polyline)
            self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
//            self.mapView.setRegion(MKCoordinateRegion(route.polyline.boundingMapRect), animated: true)
        }

    }
    
}

// MARK: - MapViewInput
extension MapViewController: MapViewInput {
    func showLocation(location: Location, name: String) {
        let annotation = AnnotationModel(myCoordinate: location, title: name)
        mapView.addAnnotation(annotation)
        createRoute()
    }
}

// MARK: - CLLocationManagerDelegate
extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.last?.coordinate else { return }
        let location = curLoc
        let latitudinalMeters: CLLocationDistance = 10000

        let region = MKCoordinateRegion(center: location, latitudinalMeters: latitudinalMeters, longitudinalMeters: latitudinalMeters)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkAuthorization()
    }
    
}

// MARK: - MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        guard let annotation = annotation as? AnnotationModel else { return nil }
        var viewMarker: MKMarkerAnnotationView
        let idView = "marker"

        if let view = mapView.dequeueReusableAnnotationView(withIdentifier: idView) as? MKMarkerAnnotationView {

            view.annotation = annotation
            viewMarker = view

        } else {

            viewMarker = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: idView)
            viewMarker.canShowCallout = true
            viewMarker.calloutOffset = CGPoint(x: 0, y: 0)
            viewMarker.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)

        }
        return viewMarker
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let render = MKPolylineRenderer(overlay: overlay)
        render.strokeColor = UIColor.blue
        render.lineWidth = 8
        render.lineCap = .round
        
        return render
    }
}
