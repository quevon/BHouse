import { Controller } from 'stimulus'
import debounce from 'lodash'

export default class extends Controller {
  static targets = ['address', 'lat', 'lng']
  connect() {}

  initializeSearch() {
    this.initAutocomplete = debounce(this.initAutocomplete, 3000).bind(this)
  }

  initAutocomplete() {
    //   setup autocomplete
    console.log('autocomplete loaded')
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
  }

  placeSelected() {
    //   setup autocomplete
    const place = this.autocomplete.getPlace()
    console.log(place)
    place.address_components.forEach((component) => {
      this.latTarget.value = place.geometry.location.lat()
      this.lngTarget.value = place.geometry.location.lng()
    })
  }

  findMyLocation(event) {
    event.preventDefault()
    if (!!navigator?.geolocation) {
      navigator.geolocation.getCurrentPosition((position) => {
        if (position?.coords?.latitude && position?.coords?.longitude) {
          this.latTarget.value = parseFloat(position.coords.latitude)
          this.lngTarget.value = parseFloat(position.coords.longitude)
        }
      })
    }
  }
}
