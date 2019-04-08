/**
 * 获取表单序列数据
 * @param $form
 * @returns {{}}
 */
getFormData = function($form) {
    var unindexed_array = $form.serializeArray();
    var indexed_array = {};

    $.map(unindexed_array, function (n, i) {
        indexed_array[n['name']] = n['value'];
    });
    return indexed_array;
}

/**
 * 获取表单序列数据
 * @param $form
 * @returns {{}}
 */
getFormJsonData = function($form) {
    return JSON.stringify(getFormData($form));
}