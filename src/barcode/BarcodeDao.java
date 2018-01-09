package barcode;

public interface BarcodeDao {
	public ProductBarcodeDataBean checkProductBarcode( String barcode );
	public int modifyUserBarcode(String calPrice);
}
