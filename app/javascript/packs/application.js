// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("custom")

import {} from "custom"
import "bootstrap";
import "./src/application.scss";
import "./src/custom.scss";
import "@fortawesome/fontawesome-free/js/all";
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import $ from "jquery";
import "select2/dist/css/select2.css";
import "select2";
import I18n from 'i18n-js'
window.I18n = I18n
