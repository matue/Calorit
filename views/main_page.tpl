<!DOCTYPE html>
<html lang="ru">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Calori</title>
    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="Serebrennikovn Nikita" content="LayoutIt!">
    <link href="static/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="static/style.css" rel="stylesheet" type="text/css">
    <script src="static/jquery.min.js"></script>
    <script src="static/bootstrap.min.js"></script>
    <script src="static/scripts.js"></script>
  </head>
  <br>
  <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2">
                </div>
                <div class="col-md-8">
                    <div class="jumbotron well">
                        <h4>Привет!</h4>
                        <h4>Это сайт с информацией о еде.</h4>
                        <h4>Продуктов в базе: <b>{{len(rows)}}</b>.</h4>
                        <h4>Нажми на продукт чтобы узнать о нем подробнее.</h4>
                    </div>
                    <div class="row">
                        %rows.sort()
                        %a=(len(rows)//3)
                        %for i in range(3):
                            <div class="col-md-4">
                                %for row in rows[(i*a):((i+1)*a)]:
                                    <li>
                                        <a href="/{{row[0]}}"> {{row[0]}}</a>
                                    </li>
                                %end
                             </div>
                        %end

                    </div>
                </div>

                 <div class="col-md-2">
                </div>
            </div>
        </div>
  </body>
</html>




