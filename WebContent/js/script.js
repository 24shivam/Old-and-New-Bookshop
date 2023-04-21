function add_to_cart(pname,price){
	
	let cart= localStorage.getItem("cart");
	if(cart==null){
		 let products=[];
	let product={productName:pname, productPrice:price, productQuantity:1}
	products.push(product);
	
	localStorage.setItem("cart",JSON.stringify(products));
	console.log("Product is added for the first time")
	
	
	}else{
		let pcart= JSON.parse(cart);
		
		let oldProduct=pcart.find((item)=>item.productName==pname)
		
		if(oldProduct){
			//we have increse the quantity
			oldProduct.productQuantity= oldProduct.productQuantity+1
			pcart.map((item)=>{
				
			if(item.productName==oldProduct.productName){
				
				
				item.productQuantity=oldProduct.productQuantity;
			}
				
			})
			
			localStorage.setItem("cart",JSON.stringify(pcart));
			console.log("Product qauntity is increased")
		}else
			
		{
			let product={productName:pname, productPrice:price, productQuantity:1}
			pcart.push(product);
			localStorage.setItem("cart",JSON.stringify(pcart));
			
			console.log("Product  is added ")
		}
		
	}
	updateCart()
}

//update cart

function  updateCart(){
	
	let cartString= localStorage.getItem("cart");
	
	let cart= JSON.parse(cartString);
	if(cart==null || cart.length == 0)
	{
		
		console.log("cart is empty")
		
		$(".cart-items").html("(0)");
		$(".cart-body").html("<h2>Cart does not contain any book</h2>");
		$(".checkout-btn").addClass('disabled');
		
		
	}else{
		
		console.log(cart)
		
		
		$(".cart-item").html(`(${cart.length})`);
		
		let table=`
		
		
		<table class='table'>
		<thead class='thread-light'>
		<tr>
		<th> Book Name</th>
		<th> Book Price</th>
		<th> Quantity</th>
		<th> Total Price</th>
		<th> Action</th>
		
		</tr>
		
		</thead>
		 
		`;
		let totalPrice=0;
		
		cart.map((item)=>{
			
		table+=`
		<tr>
		<td>${item.productName}</td>
		<td>${item.productPrice}</td>
		<td>${item.productQuantity}</td>
		<td>${item.productQuantity*item.productPrice} </td>
		<td><button onclick ='deleteItemFromCart(${item.productPrice})' class='btn btn-danger btn-sm'>Remove</button></td>
		
		</tr>
		
		`
		
		totalPrice+=item.productPrice*item.productQuantity;
		
		
		})
		
		table=table + `
		<tr><td colspan='5' class='text-right font-weight-bold m-5'><h2>Total Price : Rs. ${totalPrice}</h2></td></tr>
		
		</table>`
		
		 $(".cart-body").html(table);
		 $(".checkout-btn").removeClass('disabled');
		
	}
	 
	
}

//delete item
function deleteItemFromCart(price)
{
	let cart= JSON.parse(localStorage.getItem('cart'));
	
	let newcart= cart.filter((item) =>item.productPrice!=price)
	
	localStorage.setItem('cart',JSON.stringify(newcart))
	
	
		updateCart();
	
}



$(document).ready(function(){
	

		updateCart();
})







