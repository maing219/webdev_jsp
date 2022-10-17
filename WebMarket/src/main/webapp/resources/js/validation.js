/**
 * 
 */
 
 function checkAddProduct() {
	var productId = document.getElementById("productId");
	var name = document.getElementById("name");
	var unitPrice = document.getElementById("unitPrice");
	var unitsInStock = document.getElementById("unitsInStock");
	
	if(!/^P[0-9]{4,11}$/.test(productId.value)) {
		alert("[상품코드]\nP와 숫자를 조합하여 5~12자리까지 입력하세요.\n첫 글자는 반드시 P로 시작해야합니다.");
		productId.select();
		productId.focus();
		return;
	}
	
	if(name.value.length < 4 || name.value.length > 12) {
		alert("[상품명]\n최소 4 ~ 12글자까지 입력하세요.");
		name.select();
		name.focus();
		return;
	}
	
	if(unitPrice.value.length == 0 || isNaN(unitPrice.value)) {
		alert("[가격]\n숫자만 입력하세요.");
		unitPrice.select();
		unitPrice.focus();
		return;
	}
	
	if(unitPrice.value < 0) {
		alert("[가격]\n음수는 입력할 수 없습니다.");
		unitPrice.select();
		unitPrice.focus();
		return;
	}
	
	if(isNaN(unitsInStock.value)) {
		alert("[재고]\n숫자만 입력하세요.");
		unitsInStock.select();
		unitsInStock.focus();
		return;
	}
	
	document.newProduct.submit();
}