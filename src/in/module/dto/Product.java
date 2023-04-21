package in.module.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int pId;
	private String pName;
	private String pPrice;
	private String pPhoto;
	private String pQuatity;
	private String pType;
	
	@ManyToOne
	private Category category;

	public Product() {
	}

	
	public Product(int pId, String pName, String pPrice, String pPhoto, String pQuatity, Category category,String pType) {
		super();
		this.pId = pId;
		this.pName = pName;
		this.pPrice = pPrice;
		this.pPhoto = pPhoto;
		this.pQuatity = pQuatity;
		this.pType=pType;
		this.category = category;
	}


	public Product(String pName, String pPrice, String pPhoto, String pQuatity,String pType) {
		super();
		this.pName = pName;
		this.pPrice = pPrice;
		this.pPhoto = pPhoto;
		this.pQuatity = pQuatity;
		this.pType=pType;

	}

	public String getpType() {
		return pType;
	}


	public void setpType(String pType) {
		this.pType = pType;
	}


	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpPrice() {
		return pPrice;
	}

	public void setpPrice(String pPrice) {
		this.pPrice = pPrice;
	}

	public String getpPhoto() {
		return pPhoto;
	}

	public void setpPhoto(String pPhoto) {
		this.pPhoto = pPhoto;
	}

	public String getpQuatity() {
		return pQuatity;
	}

	public void setpQuatity(String pQuatity) {
		this.pQuatity = pQuatity;
	}

	
	public Category getCategory() {
		return category;
	}
	
	
	public void setCategory(Category category) {
		this.category = category;
	}


	@Override
	public String toString() {
		return "Product [pId=" + pId + ", pName=" + pName + ", pPrice=" + pPrice + ", pPhoto=" + pPhoto + ", pQuatity="
				+ pQuatity + ", pType=" + pType + ", category=" + category + "]";
	}
	
	 

}
