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
                        <h4>Продукт "<b>{{product}}</b>".</h4>
                        <h4>Содержание пищевых веществ (в граммах на 100 грамм съедобной части):</h4>
                    </div>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Ккал</th>
                                    <th>Жиры</th>
                                    <th>Белки</th>
                                    <th>Углеводы</th>
                                </tr>
                            </thead>
                                <tbody>
                                    <tr>
                                    %for row in rows:
                                      <tr>
                                        <td>{{row[0]}}</td>
                                        <td>{{row[1]}}</td>
                                        <td>{{row[2]}}</td>
                                        <td>{{row[3]}}</td>
                                      </tr>
                                    %end
                                </tbody>
                        </table>
				</div>
				<div class="col-md-2">
				</div>
		</div>
	</div>
</div>
  </body>
</html>





