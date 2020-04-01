// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
document.querySelectorAll('.play-icon').forEach(function(item) {
    item.addEventListener('click', function(){
        var source = this.parentElement.getAttribute('data');
        var img_height = document.querySelector('.img-in-video-space').clientHeight
        this.parentElement.innerHTML = `<iframe width="100%" height="${img_height}" src="${source}?autoplay=1&rel=0" frameborder="0" autohide=true allow="accelerometer; autoplay=true; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>`;
    })
  })


 