$(function() {

	$("#comp_name").keypress(function(event) {
		if (event.keyCode == 13) {
			let comp_name = $(this).val()
			$.ajax({
				url : rootPath + '/comp/list?c_name=' + comp_name,
				method : 'GET'
			}).done(function(result) {
				$("#comp_list").html(result)
			})
		}
	})

	$("#pro_name").keypress(function(event) {
		if (event.keyCode == 13) {
			let pro_name = $(this).val()
			$.ajax({
				url : rootPath + '/product/list?p_name=' + pro_name,
				method : 'GET'
			}).done(function(result) {
				$("#pro_list").html(result)
			})
		}
	})

	// 유효성검사 1 :값이 입력되지 않은 항목 거르기
	$("#btn_save").click(function name() {

		if ($("#io_date").val() == "") {
			alert("거래일자를 입력하세요.")
			$("#io_date").focus()
			return false;
		}

		if ($(":radio[name='io_inout']:checked").length < 1) {
			alert("매입매출을 선택하세요.")
			$("#io_inout").focus()
			return false;
		}

		if ($("#io_ccode").val() == "") {
			alert("거래처를 선택하세요.")
			$("#comp_name").focus()
			return false;
		}

		if ($("#io_pcode").val() == "") {
			alert("상품명을 선택하세요.")
			$("#pro_name").focus()
			return false;
		}

		if ($("#io_price").val() == "") {
			alert("단가를 선택하세요.")
			$("#io_price").focus()
			return false;
		}

		if (isNaN($("#io_price").val())) {
			alert("단가는 숫자로 입력하세요.")
			$("#io_price").focus()
			$("$io_price").select()
			return false;
		}

		if ($("#io_qty").val() == "") {
			alert("수량을 입력하세요.")
			$("#io_qty").focus()
			return false;
		}

		if (isNaN($("#io_qty").val())) {
			alert("수량은 숫자로 입력하세요.")
			$("#io_qty").focus()
			$("$io_qty").select()
			return false;
		}
		/*
		 * 합계
		 */

		if (!isNaN($("#io_price").val()) && !isNaN($("#io_qty").val())) {

			let io_price = Number($("#io_price").val())
			let io_qty = Number($("#io_qty").val())

			let io_total = io_price * io_qty

			$("#io_total").val(io_total)

		}

		/*
		 * 합계계산 부분 함수호출
		 */
		total()

		// 서버로 데이터 전송
		// $('form').submit()
		// "${rootPath}/iolist/input"

		$.ajax({

			url : rootPath + "/iolist/input",
			method : "POST",
			data : $('form').serialize()

		}).done(function(result) {
			$("#iolist_view").html(result)
		})

		// jg 3.0이상
		// $.post(rootPath + '/iolist/input', {'iolist': $('form').serialize()},
		// function (result) {
		// $("iolist").html(result)
		// }
		// )

	})
	
	function total() {

		if (!isNaN($("#io_price").val()) && !isNaN($("#io_qty").val())) {

			let io_price = Number($("#io_price").val())
			let io_qty = Number($("#io_qty").val())
			let io_total = io_price * io_qty

			$("#io_total").val(io_total)
		}
	}

	$("#io_price").blur(function(event) {
		total()

	})

	$("#io_qty").blur(function(event) {
		total()

	})

})