package barcode;

import java.util.ArrayList;

import db.SqlMapClient;

public class BarcodeDBBean implements BarcodeDao{
	
	public ProductBarcodeDataBean checkProductBarcode( String product_barcode ) {
		ProductBarcodeDataBean PbarcodeDto=null;
		PbarcodeDto = SqlMapClient.getSqlSession().selectOne("Barcode.checkProductBarcode",product_barcode);
		
		return PbarcodeDto;
	}
	//계산시 호출되는 계산함수
	public int modifyUserBarcode(String calPrice,ArrayList<UseHistoryDataBean> product_barcodeInfo) {
		
		//계산시 영수증생성
		insertUseHistory(product_barcodeInfo);
		
		//계산시 재고 업데이트
		modifyProductAllcount(product_barcodeInfo);
		
		//유저 바코드 수정해주기
		return SqlMapClient.getSqlSession().update("Barcode.modifyUserBarcode",calPrice);
	}
	
	//계산시 영수증생성
	public void insertUseHistory( ArrayList<UseHistoryDataBean> product_barcodeInfo ) {
		for(int i=0;i<product_barcodeInfo.size();i++) {
			SqlMapClient.getSqlSession().insert("Barcode.insertUseHistory",product_barcodeInfo.get(i)); 
		}		
	}
	//계산시 재고 업데이트
	public void modifyProductAllcount(ArrayList<UseHistoryDataBean> product_barcodeInfo) {
		for(int i=0;i<product_barcodeInfo.size();i++) {
			SqlMapClient.getSqlSession().update("Barcode.modifyProductAllcount",product_barcodeInfo.get(i));
		}
	}
	
	//환불시 호출되는 계산함수
	public int refundModifyUserBarcode(String calPrice,ArrayList<UseHistoryDataBean> product_barcodeInfo) {
		//환불 디비에서 환불한 상품 삭제
		deleteUseHistory(product_barcodeInfo);
		
		//재고 상품 추가해줌
		refundModifyProductAllcount(product_barcodeInfo);
		return SqlMapClient.getSqlSession().update("Barcode.modifyUserBarcode",calPrice);
	}
		
	//환불 재고상품 추가
	public void refundModifyProductAllcount(ArrayList<UseHistoryDataBean> product_barcodeInfo) {
		for(int i=0;i<product_barcodeInfo.size();i++) {
			SqlMapClient.getSqlSession().update("Barcode.refundModifyProductAllcount",product_barcodeInfo.get(i));
		}
	}
	
	//환불 상품 삭제
	public void deleteUseHistory( ArrayList<UseHistoryDataBean> product_barcodeInfo ) {
		for(int i=0;i<product_barcodeInfo.size();i++) {
			SqlMapClient.getSqlSession().delete("Barcode.deleteUseHistory",product_barcodeInfo.get(i)); 
		}		
	}
	
	//영수증 번호 생성하기위해 불러주는 함수
	public String getReceipt_barcode() {
		return SqlMapClient.getSqlSession().selectOne("Barcode.getReceipt_barcode");
	}
	
	
}
