(function() {
  $(function() {
    $(window).ready(function() {
      var backToTop, pulldown;
      if (!!Modernizr.input.placeholder) {
        $("input").each(function() {
          if ($(this).attr("placeholder") !== "") {
            return $(this).placeholder();
          }
        });
      }
      pulldown = new Pulldown(".pulldown");
      $('body').append('<a id="backToTop" href="#">Back to top</a>');
      backToTop = new BackToTop("#backToTop", $(window).height() / 2);
      return $(window).bind('resize', function() {
        return backToTop;
      });
    });
    return $.getHash = function(url) {
      if (url) {
        return url.substring(url.indexOf("#") + 1);
      } else {
        return window.location.hash;
      }
    };
  });

}).call(this);

//# sourceMappingURL=main.js.map
