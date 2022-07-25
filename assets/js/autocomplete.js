/*$(document).ready(function () {
    // Send Search Text to the server
    $("#mov_input").keyup(function () {
        alert('dfgd');
      let searchText = $(this).val();
      if (searchText != "") {
        $.ajax({
          url: "components/movie.cfc?method=allMovieNames",
          type: 'get',
          data: {
            search_text: searchText,
          },
          success: function (response) {
            console.log(response);
            $("#show-list").html(response);
          },
        });
      } else {
        $("#show-list").html("");
      }
    });
    // Set searched text in input field on click of search button
    $(document).on("click", "a", function () {
      $("#mov_input").val($(this).text());
      $("#show-list").html("");
    });
  });*/

  $(document).ready(function() {
                    $('.js-example-basic-single').select2();
                init_MoviePage();
                 init_MoviePageFull();
                     $('.js-example-basic-single').select2();
            });