;
(function ($, config) {

     $(function () {

          var $message = $("<div class='autosave_dialog autosave_message'></div>").hide();
          var $error = $("<div class='autosave_dialog autosave_error'></div>").hide();
          var debouncedSave = debounce(save, 300, false);

          $("body").append($message);
          $("body").append($error);

          // $("#ajax_save, #ajax_save_copy").click(function (event) {
          // event.preventDefault();

          $(document).keyup(function (e) {
               if ($('.pg-settings-body').length == 0) {
                    return false;
               }
               debouncedSave($message, $error);
          });


     });

     function save($message, $error) {

          if (window.tinyMCE !== undefined) {
               tinyMCE.triggerSave();
          }

          //for all those ckeditor users
          $("form.InputfieldForm").find('.InputfieldCKEditor').each(function () {
               $(this).find("textarea").each(function () {
                    var $textarea = $(this);
                    $textarea.val(CKEDITOR.instances["Inputfield_" + $textarea.attr("name")].getData());
               });
          });

          //for all those inline ckeditor users
          $("form.InputfieldForm").find('.InputfieldCKEditorInline').each(function () {
               var $input = $(this).next('input');
               var value = $(this).html();
               $input.attr('value', value);
          });

          // serialize form and append page id
          var $data = $('form#ProcessPageEdit').serialize() + "&id=" + $('#PageIDIndicator').text();

          //            console.log($data);

          var ajaxPostUrl = '/admin/pagegrid/ajaxsave/';

          $.ajax({
               url: ajaxPostUrl,
               type: 'post',
               data: $data,
               dataType: "json",
               success: function (data) {
                    if (!data.error) {
                         $message.html(data.message).slideToggle().delay(3000).fadeOut();
                    } else if (data.error) {
                         var messages = '';
                         messages += data.message + "<br/>";
                         for (var i in data.errors) {
                              messages += data.errors[i] + "<br/>";
                         }
                         $error.html(messages).slideToggle().delay(5000).fadeOut();
                    }
                    var urlTest = ajaxPostUrl;
                    console.log(urlTest);
               }
          });

     };


     function debounce(func, wait, immediate) {
          var timeout;
          return function () {
               var context = this, args = arguments;
               var later = function () {
                    timeout = null;
                    if (!immediate) func.apply(context, args);
               };
               var callNow = immediate && !timeout;
               clearTimeout(timeout);
               timeout = setTimeout(later, wait);
               if (callNow) func.apply(context, args);
          };
     };


})(jQuery, config);
