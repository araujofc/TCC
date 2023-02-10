const GOOGLE_API_KEY = 'AIzaSyD-zUzLnfepNBgT_Sg1Y5Ox1QLLpJ8Lwj8';

class LocationUtil {
  static String generatePreviewLocateImage({
    double latitude,
    double longitute,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitute&zoom=13&size=600x300&maptype=satellite&markers=color:red%7Clabel:A%7C$latitude,$longitute&key=$GOOGLE_API_KEY';
  }
}
