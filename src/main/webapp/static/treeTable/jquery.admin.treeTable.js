;(function ($) {
    $.fn.initTreeTable = function (options) {
        var defaults = {
            beforeExpandCallBack: '',
            onSelectCallBack: '',
            expandNodeId:'0'
        };
        var settings = $.extend({}, defaults, options), that = this;
        var option = {
            expandable: true ,
            beforeExpand : function($treeTable, id) {
                if (typeof settings.beforeExpandCallBack == 'function') {
                    settings.beforeExpandCallBack($treeTable, id);
                }
            },
            onSelect : function($treeTable, id) {
                if (typeof settings.onSelectCallBack == 'function') {
                    settings.onSelectCallBack($treeTable, id);
                }
            }
        };
        that.treetable(option);
        var nodeIdArray = settings.expandNodeId.split(",");
        for (i in nodeIdArray) {
            var id = nodeIdArray[i];
            var node=this.data("treetable").tree[id];
            if(node){
                that.treetable("expandNode", id);
            }
        }
    };
})(jQuery);