from django.shortcuts import render
import json
import urllib.request

def index(request):
    if request.method == 'POST':
        city = request.POST['city']
        # Replace "19f2d27c092652deb723b7f3b3f81379" with your actual OpenWeatherMap API key,mine might have expired.
        api_key = "19f2d27c092652deb723b7f3b3f81379"
        url = f"http://api.openweathermap.org/data/2.5/weather?q={city}&appid={api_key}"

        try:
            # Make a request to the API
            source = urllib.request.urlopen(url).read()
            list_of_data = json.loads(source)

            # Extract relevant data
            data = {
                "country_code": str(list_of_data['sys']['country']),
                "coordinate": str(list_of_data['coord']['lon']) + ' ' + str(list_of_data['coord']['lat']),
                "temp": str(list_of_data['main']['temp']) + 'k',
                "pressure": str(list_of_data['main']['pressure']),
                "humidity": str(list_of_data['main']['humidity']),
            }
            print(data)
        except Exception as e:
            print(f"An error occurred: {e}")
            data = {}
    else:
        data = {}
    return render(request, "main/index.html", data)
