import { Controller } from 'stimulus'
import debounce from 'lodash'

export default class extends Controller {
  static targets = ['address', 'city', 'lat', 'lng', 'map']
  connect() {}

  initializeSearch() {
    this.initAutocomplete = debounce(this.initAutocomplete, 3000).bind(this)
  }

  initAutocomplete() {
    //   setup autocomplete
    console.log('Maps API loaded')
    this.autocomplete = new google.maps.places.Autocomplete(
      this.addressTarget,
      {
        componentRestrictions: { country: ['ph'] },
        fields: ['address_components', 'geometry'],
        types: ['address'],
      }
    )
    this.autocomplete.addListener(
      'place_changed',
      this.placeSelected.bind(this)
    )
    this.initMap()
  }

  placeSelected() {
    //   setup autocomplete
    const place = this.autocomplete.getPlace()
    place.address_components.forEach((component) => {
      if (component.types.includes('locality')) {
        this.cityTarget.value = component.long_name
      }
      this.latTarget.value = place.geometry.location.lat()
      this.lngTarget.value = place.geometry.location.lng()
    })
    this.map().fitBounds(place.geometry.viewport)
    this.map().setCenter(place.geometry.location)
    this.marker().setPosition(place.geometry.location)
    this.marker().setVisible(true)
  }

  initMap() {
    this.map()
    this.marker()
  }

  map() {
    if (this._map == undefined) {
      this._map = new google.maps.Map(this.mapTarget, {
        center: new google.maps.LatLng(
          this.latTarget.value,
          this.lngTarget.value
        ),
        zoom: 17,
      })
    }
    return this._map
  }

  marker() {
    console.log('called marker')
    if (this._marker == undefined) {
      this._marker = new google.maps.Marker({
        map: this.map(),
        anchorPoint: new google.maps.Point(0, 0),
        icon: 'https://res.cloudinary.com/dbegssigw/image/upload/c_scale,w_40/v1652359184/bhouse/bhousepin_ia9r0g.png',
      })
      let mapLocation = {
        lat: parseFloat(this.latTarget.value),
        lng: parseFloat(this.lngTarget.value),
      }
      this._marker.setPosition(mapLocation)
      this._marker.setVisible(true)
    }
    return this._marker
  }

  findMyLocation(event) {
    event.preventDefault()
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition((position) => {
        let latlng = {
          lat: parseFloat(position.coords.latitude),
          lng: parseFloat(position.coords.longitude),
        }
        const geocoder = new google.maps.Geocoder()
        geocoder.geocode({ location: latlng }).then((response) => {
          let place = response.results[0]
          place.address_components.forEach((component) => {
            if (component.types.includes('locality')) {
              this.cityTarget.value = component.long_name
            }
            this.latTarget.value = place.geometry.location.lat()
            this.lngTarget.value = place.geometry.location.lng()
            this.addressTarget.value = place.formatted_address
          })
          this.map().fitBounds(place.geometry.viewport)
          this.map().setCenter(place.geometry.location)
          this.marker().setPosition(place.geometry.location)
          this.marker().setVisible(true)
        })
      })
    }
  }
}
