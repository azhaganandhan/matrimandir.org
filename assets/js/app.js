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

document.querySelectorAll('.modal-pdf').forEach(function(item) {
    item.addEventListener('click', function(){
        var pdf = this.getAttribute('data-pdf-name')
        document.querySelector('.modal-content .container').innerHTML = `<h1>${pdf}</h1>
        <iframe src="/pdfs/${pdf}.pdf" width="100%" height="100%" frameBorder="0">This browser does not support PDFs. Please download the PDF to view it: <a href="/pdf/${pdf}.pdf">Download PDF</a></iframe>`
        $('#pdfModal').modal('toggle')
    })
})

document.querySelectorAll('.modal-poster').forEach(function(item) {
    item.addEventListener('click', function(){
        var img = this.getAttribute('data-poster-name')
        console.log(img)
        document.querySelector('#posterModal .modal-dialog .modal-content').innerHTML = `<img class="img-responsive" src="/images/design_posters/${img}.jpg" style="width: 100%;" alt="">`
        $('#posterModal').modal('toggle')
    })
})

 