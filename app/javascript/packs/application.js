// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

require("packs/get_departments.js")
require("packs/get_university_groups.js")
require("packs/get_start_button.js")
require("packs/show_range_value.js")
import 'bootstrap'
import $ from 'jquery'; // this two            for making $()                 js.haml
global.$ = jQuery;      //           lines are                available in

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// $(function() {
//     console.log('111');
// });