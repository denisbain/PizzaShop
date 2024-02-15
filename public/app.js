function something() {
    alert('Hello');
}

function add_to_cart(id)
{
    var key = 'product_' + id;

    var x = window.localStorage.getItem(key);
    x = x * 1 + 1;
    window.localStorage.setItem(key, x);

    //Вывод количества item'ов в корзине
    alert('Items in your cart: ' + get_number_of_items());
}

function get_number_of_items()
{
    var cnt = 0;

    for(var i= 0 ; i < window.localStorage.length; i++)
    {
        var key = window.localStorage.key(i); //получаем ключ
        var value = window.localStorage.getItem(key); // пполучаем значение, аналог в руби hh[key] = x

        if (key.indexOf('product_') == 0)
        {
            cnt = cnt + value*1;
        }
    }
    return cnt;
}