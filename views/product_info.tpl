%include('head.tpl',title=('Calori - '+product))
<div class="jumbotron well">
    <h4>Продукт "<b>{{product}}</b>".</h4>
    <h4>Содержание пищевых веществ (в граммах на 100 грамм съедобной части):</h4>
</div>
    <table class="table">
        <thead>
            <tr>
                <th class="redback">Белки</th>
                <th class="yellow">Жиры</th>
                <th class="green">Углеводы</th>
                <th>Калорийность</th>
                <th>Категория</th>
            </tr>
        </thead>
        <tbody>
            <tr>
            %for row in rows:
                <tr>
                %for i in range(1,5):
                    <td>{{row[i]}}</td>
                %end
                <td><a href="/{{row[5]}}">{{row[5]}}</a></td>
                </tr>
            %end
        </tbody>
    </table>

    <b>Визуальное соотношение пищевых веществ к общей массе продукта:</b><br><br>
    %b,j,u = rows[0][1], rows[0][2] , rows[0][3]
    <div class="progress">
      <div class="progress-bar progress-bar-danger" style="width: {{b}}%">
      </div>
      <div class="progress-bar progress-bar-warning" style="width: {{j}}%">
      </div>
      <div class="progress-bar progress-bar-success" style="width: {{u}}%">
      </div>
    </div>

    <style>
        th.redback {
            color: #d9534f;
        }
        th.yellow {
            color: #f0ad4e;
        }
        th.green {
            color: #5cb85c;
        }
    </style>
%include('foot.tpl')




