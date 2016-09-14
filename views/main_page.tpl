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
                <nav class="navbar navbar-default" role="navigation">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="/">Calori</a>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li>
                                <a href="/about">О сайте</a>
                            </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <form class="navbar-form navbar-left" role="search">
                                <div class="form-group">
                                    <input type="text" class="form-control" />
                                </div>
                                <button type="submit" class="btn btn-default">
                                    Поиск
                                </button>
                            </form>
                        </ul>
                    </div>
			    </nav>
                    <div class="jumbotron well">
                        <h4>Привет!</h4>
                        <h4>Это сайт с информацией о еде.</h4>
                        <h4>Продуктов в базе: <b>{{len(result_by_name)}}</b>.</h4>
                        <h4>Нажми на продукт чтобы узнать о нем подробнее.</h4>
                    </div>
                        <div class="tabbable" id="tabs-628912">
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a href="#alphabet" data-toggle="tab">По алфавиту</a>
                                </li>
                                <li>
                                    <a href="#kcal" data-toggle="tab">По калорийности</a>
                                </li>
                                <li>
                                    <a href="#cat" data-toggle="tab">По категории</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="alphabet">
                                    <p>
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>Наименование продукта</th>
                                                    <th>Белки</th>
                                                    <th>Жиры</th>
                                                    <th>Углеводы</th>
                                                    <th>Калорийность</th>
                                                    <th>Категория</th>
                                                </tr>
                                            </thead>
                                                <tbody>
                                                    <tr>
                                                    %for row in result_by_name:
                                                      <tr>
                                                        <td><a href="/{{row[0]}}">{{row[0]}}</a></td>
                                                        <td>{{row[1]}}</td>
                                                        <td>{{row[2]}}</td>
                                                        <td>{{row[3]}}</td>
                                                        <td>{{row[4]}}</td>
                                                        <td>{{row[5]}}</td>
                                                      </tr>
                                                    %end
                                                </tbody>
                                        </table>
                                    </p>
                                </div>
                                <div class="tab-pane" id="kcal">
                                    <p>
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>Наименование продукта</th>
                                                    <th>Белки</th>
                                                    <th>Жиры</th>
                                                    <th>Углеводы</th>
                                                    <th>Калорийность</th>
                                                    <th>Категория</th>
                                                </tr>
                                            </thead>
                                                <tbody>
                                                    <tr>
                                                    %for row in result_by_kcal:
                                                      <tr>
                                                        <td><a href="/{{row[0]}}">{{row[0]}}</a></td>
                                                        <td>{{row[1]}}</td>
                                                        <td>{{row[2]}}</td>
                                                        <td>{{row[3]}}</td>
                                                        <td>{{row[4]}}</td>
                                                        <td>{{row[5]}}</td>
                                                      </tr>
                                                    %end
                                                </tbody>
                                        </table>
                                    </p>
                                </div>
                                <div class="tab-pane" id="cat">
                                    <p>
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>Наименование продукта</th>
                                                    <th>Белки</th>
                                                    <th>Жиры</th>
                                                    <th>Углеводы</th>
                                                    <th>Калорийность</th>
                                                    <th>Категория</th>
                                                </tr>
                                            </thead>
                                                <tbody>
                                                    <tr>
                                                    %for row in result_by_cat:
                                                      <tr>
                                                        <td><a href="/{{row[0]}}">{{row[0]}}</a></td>
                                                        <td>{{row[1]}}</td>
                                                        <td>{{row[2]}}</td>
                                                        <td>{{row[3]}}</td>
                                                        <td>{{row[4]}}</td>
                                                        <td>{{row[5]}}</td>
                                                      </tr>
                                                    %end
                                                </tbody>
                                        </table>
                                    </p>
                                </div>
                            </div>
                        </div>

                 <div class="col-md-2">
                </div>
            </div>
        </div>
  </body>
</html>




