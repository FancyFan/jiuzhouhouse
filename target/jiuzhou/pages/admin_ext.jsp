<script>

    function add(url) {
        var modal = $('#modal-add');

        var houseType = $('#add-houseType').val();
        var saleType = $('#add-saleType').val();
        var area = $('#add-area').val();
        var price = $('#add-price').val();
        var community = $('#add-community').val();
        var address = $('#add-address').val();
        var authorTel = $('#add-tel').val();
        var user = $('#add-user').val();
        var des = $('#add-des').val();

        var error = $("#submitError");

        if(authorTel==null || authorTel.trim()==""){
            error.text("telephone cannot be empty.");
            return false;
        }

        if(saleType==null || saleType.trim()==""){
            error.text("saleType cannot be empty.");
            return false;
        }

        if(price==null || price.trim()==""){
            error.text("price cannot be empty.");
            return false;
        }
        $.ajax({
            type: "POST",
            url: url + "/house/add",
            data: {
                saleType: saleType,
                houseType: houseType,
                area: area,
                price: price,
                communityName: community,
                address: address,
                authorTel: authorTel,
               authorName:user,
                des : des,
            },
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

    function uploadshow(url, houseId) {
        var modal = $('#modal-upload');
        $('#up-pid').val(houseId);
        modal.modal('show');
    }

    function detail(url, houseId) {
        var modal = $('#modal-detail');
        $.ajax({
            type: "GET",
            url: url + "/house/" + houseId + "/detail",
            success: function (result) {
                var data = result.data;
                if (result.flag) {
                    $('#detail-houseId').val(data.houseId);
                    $('#detail-saleType').val(data.saleType);
                    $('#detail-houseType').val(data.houseType);
                    $('#detail-area').val(data.area);
                    $('#detail-price').val(data.price);
                    $('#detail-comu').val(data.communityName);
                    $('#detail-address').val(data.address);
                    $('#detail-name').val(data.authorName);
                    $('#detail-tel').val(data.authorTel);
                    $('#detail-des').val(data.des);
                    $('#detail-pic').attr("src",data.imgSrc);
                    modal.modal('show');
                } else {
                    alert(data);
                }
            },
            error: function (e) {
                alert(e);
            }
        });
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

    function update(url) {
        var modal = $('#modal-detail');

        var userId = $('#detail-userId').val();
        var userName = $('#detail-userName').val();
        var pwd = $('#detail-pwd').val();
        var loginType = $('#detail-role').val();
        $.ajax({
            type: "POST",
            url: url + "/administrator/" + userId + "/update",
            data: {
                userId: userId,
                userName: userName,
                pwd: pwd,
                loginType: loginType,
            },
            success: function (result) {
                var data = result.data;
                if (result.flag) {
                    modal.modal('hide');
                    location.reload();
                } else {
                    alert(data);
                }
            },
            error: function (e) {
                alert(e);
            }
        });
    }
</script>
