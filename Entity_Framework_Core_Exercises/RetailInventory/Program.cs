using System;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using EFCore.BulkExtensions;
using System.Collections.Generic;

namespace RetailInventory
{
    class Program
    {
        static async Task Main(string[] args)
        {
            Console.WriteLine("Retail Inventory System - EF Core Labs");
            using var context = new AppDbContext();
            
            // Ensure Database gets created for this local run without explicit migrations
            await context.Database.EnsureCreatedAsync();

            // Lab 4: Inserting Initial Data
            var newCat = new Category { Name = "Toys" };
            await context.Categories.AddAsync(newCat);
            var newProd = new Product { Name = "Action Figure", Price = 500, Category = newCat, StockQuantity = 10 };
            await context.Products.AddAsync(newProd);
            await context.SaveChangesAsync();

            // Lab 5: Retrieving Data
            var products = await context.Products.ToListAsync();
            foreach (var p in products)
                Console.WriteLine($"{p.Name} - Rs{p.Price}");

            var expensive = await context.Products.FirstOrDefaultAsync(p => p.Price > 50000);
            if (expensive != null) Console.WriteLine($"Expensive: {expensive.Name}");

            // Lab 6: Updating and Deleting
            var laptop = await context.Products.FirstOrDefaultAsync(p => p.Name == "Smartphone");
            if (laptop != null)
            {
                laptop.Price = 24000;
                await context.SaveChangesAsync();
            }

            // Lab 7: LINQ Queries and DTO
            var productDTOs = await context.Products
                .Select(p => new ProductDTO { Name = p.Name, CategoryName = p.Category.Name })
                .ToListAsync();

            // Lab 10: Eager Loading
            var eagerProducts = await context.Products.Include(p => p.Category).ToListAsync();

            // Lab 13: Query Caching
            var noTrackingProducts = await context.Products.AsNoTracking().ToListAsync();

            // Compiled Query
            var expensiveCompiled = EF.CompileAsyncQuery((AppDbContext ctx, decimal price) =>
                ctx.Products.Where(p => p.Price > price));
            var result = await expensiveCompiled(context, 1000).ToListAsync();

            // Lab 14: Batch Processing (Bulk Update)
            var bulkProducts = await context.Products.ToListAsync();
            foreach (var bp in bulkProducts)
            {
                bp.StockQuantity += 10;
            }
            await context.BulkUpdateAsync(bulkProducts);

            // Lab 15: Handling Concurrency
            try
            {
                var p1 = await context.Products.FirstAsync();
                p1.Price += 100;
                await context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                Console.WriteLine("Concurrency conflict detected.");
            }

            Console.WriteLine("All Labs Executed Successfully.");
        }
    }
}
