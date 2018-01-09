/**
 * 
 */
function adminBarcodeAccountCheck(){
	if(!inputform.productsPrice.value || !inputform.userPrice.value || !inputform.calPrice.value){
		alert("값들을 입력하세요");
		return false;
	}else if(Number(inputform.userPrice.value) < Number(inputform.productsPrice.value) ){
		alert("고객의 돈이 부족합니다");
		return false;
	}
}

