using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace RetailInventory
{
    public class Category
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public virtual List<Product> Products { get; set; }
    }

    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public int StockQuantity { get; set; }
        
        [Timestamp]
        public byte[] RowVersion { get; set; }

        public int CategoryId { get; set; }
        public virtual Category Category { get; set; }
        
        public virtual ProductDetail ProductDetail { get; set; }
        public virtual List<Tag> Tags { get; set; }
    }

    public class ProductDetail
    {
        public int ProductDetailId { get; set; }
        public string WarrantyInfo { get; set; }
        public int ProductId { get; set; }
        [JsonIgnore]
        public virtual Product Product { get; set; }
    }

    public class Tag
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public virtual List<Product> Products { get; set; }
    }
    
    public class ProductDTO
    {
        public string Name { get; set; }
        public string CategoryName { get; set; }
    }
}
