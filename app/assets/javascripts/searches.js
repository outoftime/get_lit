(function ($) {
  $(function () {
    $('form#search').submit(function (e) {
      var title = $(this).find('input[name="title"]').val();
      if (title !== '') {
        window.location.href = '/' + encodeURIComponent(title);
      }
      e.preventDefault();
    });
  });
}(window.jQuery));
