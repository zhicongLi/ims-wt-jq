
var ColumnsMenu = function (grid) {

    this.menu = this.createMenu(grid);

    this.menu.on("beforeopen", this.onBeforeOpen);
    this.menu.currentColumn = null;
    grid.setHeaderContextMenu(this.menu);
}

ColumnsMenu.prototype = {

    createMenu: function (grid) {
        //创建菜单对象
        var menu = mini.create({ type: "menu", hideOnClick: false });

        //创建自定义菜单列
        var items = [
            { text: "配置列", id: "setcolumn" },
            { text: "锁定/解锁列", id: "frozencolumn" },
            '-'
        ];

        //创建隐藏菜单列
        var columns = grid.getBottomColumns();
        var columnMenuItems = { text: "隐藏列", id: "showcolumn" };
        columnMenuItems.children = [];
        for (var i = 0, l = columns.length; i < l; i++) {
            var column = columns[i];
            if (column.hideable) continue;
            var item = {};
            item.checked = column.visible;
            item.checkOnClick = true;
            item.text = column.header;
            if (item.text == "&nbsp;") {
                if (column.type == "indexcolumn") item.text = "序号";
                if (column.type == "checkcolumn") item.text = "选择";
            }
            item.enabled = column.enabled;
            item._column = column;
            columnMenuItems.children.push(item);
        }
        items.push(columnMenuItems);
        menu.setItems(items);

        menu.on("itemclick", this.onMenuItemClick, this);

        return menu;
    },
    onBeforeOpen: function (e) {
        var column = grid.getColumnByEvent(e.htmlEvent);
        this.currentColumn = column;
    },
    onMenuItemClick: function OnItemClick(e) {
       
        var menu = e.sender;
        var columns = grid.getBottomColumns();
        var items = menu.getItems();
        var item = e.item, column = item._column;
        var currentColumn = this.menu.currentColumn;

        //自定义菜单项的事件绑定
        if (item.id == "setcolumn") {

            alert("鼠标定位第" + (currentColumn._index+1) + "列")
            return
        }
        if (item.id == "frozencolumn") {
            var frozenEndColumn = grid.getFrozenEndColumn()
            if (frozenEndColumn != -1) {
                grid.unFrozenColumns();

            } else {
                grid.frozenColumns(0, (currentColumn._index - 1));
            }
            return

        }
        if (item.id == "showcolumn") return;

        var checkedCount = 0;
        //找到子菜单
        var childMenuItems = items[2].menu.getItems();
        for (var i = 0, l = childMenuItems.length; i < l; i++) {
            var it = childMenuItems[i];
            if (it.getChecked()) checkedCount++;
        }
        if (checkedCount < 1) {
            item.setChecked(true);
        }

        var checked = item.getChecked();
        if (checked) grid.showColumn(column);
        else grid.hideColumn(column);

    }

};



