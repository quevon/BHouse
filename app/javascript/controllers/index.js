// Load all the controllers within this directory and all subdirectories.
// Controller files must be named *_controller.js.

import { Application } from 'stimulus'
import { definitionsFromContext } from 'stimulus/webpack-helpers'
import places_controller from './places_controller'
import searchplace_controller from './searchplace_controller'
import map_controller from './map_controller'
import multiplemap_controller from './multiplemap_controller'

const application = Application.start()
const context = require.context('controllers', true, /_controller\.js$/)
application.load(definitionsFromContext(context))
application.register('places', places_controller)
application.register('searchplace_controller', searchplace_controller)
application.register('map_controller', map_controller)
application.register('multiplemap_controller', multiplemap_controller)
