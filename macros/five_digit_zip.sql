{% test five_digit_zip(model, column_name) %}
    SELECT
        {{ column_name }} AS invalid_zip
    FROM {{ model }}
    WHERE {{ column_name }} !~ '^[0-9]{5}$'
{% endtest %}
