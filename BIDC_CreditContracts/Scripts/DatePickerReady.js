if (!Modernizr.inputtypes.date) {
    $(function () {
        $(".datefield").datetimepicker({
            format: 'MM/DD/YYYY',
            //defaultDate: '1990-01-01'
        });
    });
}