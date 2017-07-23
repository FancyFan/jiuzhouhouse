<script>

    function addHouse() {
        location.href  = "<%=basePath%>/href/0";
    }

    function examine(url, houseId) {
        $.ajax({
            type: 'GET',
            url: url + "/house/" + houseId + "/examine",
            data: {houseId: houseId},
            success: function (result) {
                 window.location = "<%=basePath%>/admin";
            },
            error: function (e) {
                alert("there is something wrong!");
            }
        });
    }

    function detail( houseId) {
         window.location = "<%=basePath%>/"+houseId+"/detail";
    }

    function showDeleteModal(houseId) {
        var modal = $('#modal-delete');
        $('#delete-houseId').val(houseId);
        modal.modal('show');
    }

    function deleteByHouseId(url) {
        var modal = $('#modal-delete');
        var houseId = $('#delete-houseId').val();
        $.ajax({
            type: "GET",
            url: url + "/house/" + houseId + "/delete",
            success: function (result) {
                var data = result.data;
                if (result.flag) {
                    modal.modal('hide');
                    location.reload();
                } else {
                    alert(data.message);
                }
            },
            error: function (e) {
                alert(e);
            }
        });
    }

    function update( houseId) {
        location.href = "<%=basePath%>/href/"+houseId;
    }

</script>
