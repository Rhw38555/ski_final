package barcode;

import db.SqlMapClient;

public class BarcodeDBBean implements BarcodeDao{
	
	public ProductBarcodeDataBean checkProductBarcode( String product_barcode ) {
		ProductBarcodeDataBean PbarcodeDto=null;
		PbarcodeDto = SqlMapClient.getSqlSession().selectOne("Barcode.checkProductBarcode",product_barcode);
		
		return PbarcodeDto;
	}
	public int modifyUserBarcode(String calPrice) {
		return SqlMapClient.getSqlSession().update("Barcode.modifyUserBarcode",calPrice);
	}
}
