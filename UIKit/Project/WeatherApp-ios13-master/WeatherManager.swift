
import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager : WeatherManager,weather : WeatherModel)
    func didFailWithError(error : Error)
}

struct WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=743484c766663007ac2953e93666e695&units=metric"

    var delegate : WeatherManagerDelegate?
    
    func fetchWeather(cityName : String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with : urlString)
    }
    
    func fetchWeather(latitude : CLLocationDegrees, longitude : CLLocationDegrees){
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        print(urlString)
        performRequest(with: urlString)
    }

    
    func performRequest(with urlString : String){
        
        if let url = URL(string : urlString){
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData : Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionalId: id, cityName: name, temprature: temp)
            return weather

        }catch{
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    func handle(data : Data?, response : URLResponse?, error : Error?){
        if error != nil{
            self.delegate?.didFailWithError(error: error!)
            return
        }
        
        if let safeData = data{
            if let weather = self.parseJSON(safeData){
                self.delegate?.didUpdateWeather(self, weather : weather)
            }
        }
    }

}
