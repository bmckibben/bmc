(() => {
  // app/javascript/older_timer_code.txt
  var older_timer_code_default = `\r
  $(document).ready(function () {\r
    var i = 0;\r
    var btn_state = 0;\r
    var ctl_btn = getElementById("btn_start")\r
    \r
    ctl_btn.onclick = function() {\r
      var currentTime = new Date();\r
      $('log_start_at').val(currentTime);\r
      $(this).toggle();\r
      $('#btn_end').toggle();\r
      $('#timer').submit();\r
      elapsed_time = setInterval(function () {\r
          $("#elapsed_time").html(secondsToHms(i));\r
          $(document).prop('title', secondsToHms(i));\r
          i++;\r
      }, 1000);      \r
    })\r
    \r
    $('#btn_end').on('click', function() {\r
    var currentTime = new Date();\r
    $('#task_time_end_at').val(currentTime);\r
      $(this).toggle();\r
      $('#btn_start').toggle();\r
      $('#timer').submit();\r
      clearInterval(elapsed_time);\r
    })  \r
    \r
    function secondsToHms(d) {\r
        d = Number(d);\r
        var h = Math.floor(d / 3600);\r
        var m = Math.floor(d % 3600 / 60);\r
        var s = Math.floor(d % 3600 % 60);\r
\r
        return pad(h, 2) +':'+ pad(m,2) + ':'+ pad(s,2); \r
    }    \r
    \r
    function pad (str, max) {\r
      str = str.toString();\r
      return str.length < max ? pad("0" + str, max) : str;\r
    }    \r
    \r
  })   \r
`;
})();
//# sourceMappingURL=assets/older_timer_code.js.map
