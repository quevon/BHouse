import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['map']
  static values = {
    lat: Number,
    lng: Number,
  }
  connect() {
    if (typeof google != 'undefined') {
      this.initAutocomplete()
    }
  }

  initAutocomplete() {
    console.log('autocomplete')
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
        zoom: 17,
      })
    }
    return this._map
  }

  marker() {
    if (this._marker == undefined) {
      this._marker = new google.maps.Marker({
        map: this.map(),
        anchorPoint: new google.maps.Point(0, 0),
        icon: 'https://res.cloudinary.com/dbegssigw/image/upload/c_scale,w_40/v1652359184/bhouse/bhousepin_ia9r0g.png',
      })
      let mapLocation = {
        lat: parseFloat(this.latValue),
        lng: parseFloat(this.lngValue),
      }
      this._marker.setPosition(mapLocation)
      this._marker.setVisible(true)
    }
    return this._marker
  }
}
