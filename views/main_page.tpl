%include('head.tpl',title='Calorit - Главная')
%theadlist=('Наименование продукта','Белки','Жиры','Углеводы','Калорийность','Категория')


<div class="jumbotron well">
    <h4>Привет!</h4>
    <h4>Это сайт с информацией о еде.</h4>
    <h4>Продуктов в базе: <b>{{len(result_by_name)}}</b>.</h4>
    <h4>Нажми на продукт чтобы узнать о нем подробнее.</h4>
</div>
    <div class="tabbable" id="tabs">
        <ul class="nav nav-pills">
            <li class="active">
                <a href="#result_by_name" data-toggle="tab">По алфавиту</a>
            </li>
            <li>
                <a href="#result_by_kcal" data-toggle="tab">По калорийности</a>
            </li>
            <li>
                <a href="#result_by_cat" data-toggle="tab">По категории</a>
            </li>
            <li>
                <a href="#add_new" data-toggle="tab">Добавить продукт</a>
            </li>
        </ul>
        <div class="tab-content">

            <div class="tab-pane active" id="result_by_name">
                <p>
                    <table class="table">
                        <thead>
                            <tr>
                                %for i in theadlist:
                                    <th>{{i}}</th>
                                %end
                            </tr>
                        </thead>
                            <tbody>
                                <tr>
                                %for row in result_by_name:
                                    <tr>
                                        <td><a href="/{{row[5]}}/{{row[0]}}">{{row[0]}}</a></td>
                                            %for i in range(1,5):
                                                <td>{{row[i]}}</td>
                                            %end
                                        <td><a href="/{{row[5]}}">{{row[5]}}</a></td>
                                    </tr>
                                %end
                            </tbody>
                    </table>
                </p>
            </div>

            <div class="tab-pane" id="result_by_kcal">
                <p>
                    <table class="table">
                        <thead>
                            <tr>
                                %for i in theadlist:
                                    <th>{{i}}</th>
                                %end
                            </tr>
                        </thead>
                            <tbody>
                                <tr>
                                %for row in result_by_kcal:
                                    <tr>
                                        <td><a href="/{{row[5]}}/{{row[0]}}">{{row[0]}}</a></td>
                                            %for i in range(1,5):
                                                <td>{{row[i]}}</td>
                                            %end
                                        <td><a href="/{{row[5]}}">{{row[5]}}</a></td>
                                    </tr>
                                %end
                            </tbody>
                    </table>
                </p>
            </div>

            <div class="tab-pane" id="result_by_cat">
                <p>
                    <table class="table">
                        <thead>
                            <tr>
                                %for i in theadlist:
                                    <th>{{i}}</th>
                                %end
                            </tr>
                        </thead>
                            <tbody>
                                <tr>
                                %for row in result_by_cat:
                                    <tr>
                                        <td><a href="/{{row[5]}}/{{row[0]}}">{{row[0]}}</a></td>
                                            %for i in range(1,5):
                                                <td>{{row[i]}}</td>
                                            %end
                                        <td><a href="/{{row[5]}}">{{row[5]}}</a></td>
                                    </tr>
                                %end
                            </tbody>
                    </table>
                </p>
            </div>

             <div class="tab-pane" id="add_new">
                <p>
                   <form role="form" action="/addnew" method="post">
                        <div class="form-group">
                            <label for="product_name">
                                Наименование продукта
                            </label>
                            <input class="form-control" id="product_name" name="product_name" />
                        </div>
                        <div class="form-group">
                            <label for="category">
                                Категория
                            </label>
                            <select class="form-control" id="category" name="category">
                            %for i in  cat_list[1:]:
                                <option value="{{i[0]}}">{{i[0]}}</option>
                            %end
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="kcal">
                                Калорийность
                            </label>
                            <input class="form-control" id="ccal" name="kcal" />
                        </div>
                        <div class="form-group">
                            <label for="proteins">
                                Белки
                            </label>
                            <input class="form-control" id="proteins" name="proteins" />
                        </div>
                        <div class="form-group">
                            <label for="fats">
                                Жиры
                            </label>
                            <input class="form-control" id="fats" name="fats" />
                        </div>
                        <div class="form-group">
                            <label for="carbs">
                                Углеводы
                            </label>
                            <input class="form-control" id="carbs" name="carbs"/>
                        </div>
                        <button type="submit" class="btn btn-default">
                            Добавить
                        </button>
                    </form>
                </p>
            </div>

        </div>
    </div>


%include('foot.tpl')




