%include('head.tpl',title='Calori')
%theadlist=('Наименование продукта','Белки','Жиры','Углеводы','Калорийность')


<div class="jumbotron well">
    <h4>Продуктов в категории "{{category}}" : <b>{{len(result_by_name)}}</b>.</h4>
    <h4>Нажми на продукт чтобы узнать о нем подробнее.</h4>
</div>
    <div class="tabbable" id="tabs">
        <ul class="nav nav-tabs">
            <li class="active">
                <a href="#result_by_name" data-toggle="tab">По алфавиту</a>
            </li>
            <li>
                <a href="#result_by_kcal" data-toggle="tab">По калорийности</a>
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
                                    </tr>
                                %end
                            </tbody>
                    </table>
                </p>
            </div>
                    </table>
                </p>
            </div>
        </div>
    </div>


%include('foot.tpl')




