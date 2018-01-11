package barcode;

import java.util.ArrayList;

public interface BarcodeDao {
	public ProductBarcodeDataBean checkProductBarcode( String barcode );
	public int modifyUserBarcode(String calPrice,ArrayList<UseHistoryDataBean> product_barcodeInfo);
	public void insertUseHistory( ArrayList<UseHistoryDataBean> useHistoryDto );
	public void modifyProductAllcount(ArrayList<UseHistoryDataBean> product_barcodeInfo);
	public String getReceipt_barcode();
	public int refundModifyUserBarcode(String calPrice,ArrayList<UseHistoryDataBean> product_barcodeInfo);
	public void refundModifyProductAllcount(ArrayList<UseHistoryDataBean> product_barcodeInfo);
	public void deleteUseHistory( ArrayList<UseHistoryDataBean> product_barcodeInfo );
}
