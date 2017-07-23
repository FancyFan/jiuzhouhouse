<script>
    function addHouse() {
        location.href  = "<%=basePath%>/href/0";
    }

    function uploadshow(url, houseId) {
        var modal = $('#modal-upload');
        $('#up-pid').val(houseId);
        modal.modal('show');
    }

    function detail( houseId) {
         window.location = "<%=basePath%>/"+houseId+"/detail";
    }

    function update(houseId) {
        location.href = "<%=basePath%>/href/"+houseId;
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
</script>
