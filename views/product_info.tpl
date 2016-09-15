%include('head.tpl',title=('Calori - '+product))
<div class="jumbotron well">
    <h4>Продукт "<b>{{product}}</b>".</h4>
    <h4>Содержание пищевых веществ (в граммах на 100 грамм съедобной части):</h4>
</div>
    <table class="table">
        <thead>
            <tr>
                <th>Белки</th>
                <th>Жиры</th>
                <th>Углеводы</th>
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
%include('foot.tpl')




