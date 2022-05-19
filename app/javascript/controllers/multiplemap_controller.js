import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['map']
  static values = {
    lat: Number,
    lng: Number,
    locations: Array,
  }
  connect() {
    if (typeof google != 'undefined') {
      this.initAutocomplete()
    }
  }

  initAutocomplete() {
    this.map()
    this.marker()
  }

  map() {
    if (this._map == undefined) {
      console.log('loading map')
      this._map = new google.maps.Map(this.mapTarget, {
        center: new google.maps.LatLng(
          parseFloat(this.latValue),
          parseFloat(this.lngValue)
        ),
        zoom: 10,
      })
    }
    return this._map
  }

  marker() {
    if (this._marker == undefined) {
      this.locationsValue.map((location) => {
        this._marker = new google.maps.Marker({
          map: this.map(),
          anchorPoint: new google.maps.Point(0, 0),
          icon: 'https://res.cloudinary.com/dbegssigw/image/upload/c_scale,w_40/v1652359184/bhouse/bhousepin_ia9r0g.png',
        })
        let mapLocation = {
          lat: parseFloat(location[0]),
          lng: parseFloat(location[1]),
        }
        this._marker.setPosition(mapLocation)
        this._marker.setVisible(true)
      })
      return this._marker
    }
  }
}
