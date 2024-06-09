const initializeDataTable = (tableId) => {
    let table = $(`#${tableId}`).DataTable({
        ordering: false,
        language: {
            search: '',
            searchPlaceholder: "   Search...",
            debug: true,

            // paginate: {
            //     first: '<i class="fas fa-angle-double-left"></i>', // Custom first page icon
            //     previous: '<i class="fas fa-angle-left"></i>', // Custom previous page icon
            //     next: '<i class="fas fa-angle-right"></i>', // Custom next page icon
            //     last: '<i class="fas fa-angle-double-right"></i>' // Custom last page icon
            // }

        },
    });
    return table;
}