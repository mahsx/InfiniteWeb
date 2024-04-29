using System.Linq;
using System.Web.Mvc;
using Assessment1.Models; 

public class CodeController : Controller
{
    private NorthWindEntities1 db = new NorthWindEntities1(); 

    public ActionResult GermanyCustomers()
    {
        var germanyCustomers = db.Customers.Where(c => c.Country == "Germany").ToList();
        return View(germanyCustomers);
    }

    // Action method to return customer details with orderId == 10248
    public ActionResult CustomerDetailsWithOrder()
    {
        var customerWithOrder = db.Customers
            .Where(c => c.Orders.Any(o => o.OrderID == 10248))
            .FirstOrDefault();
        return View(customerWithOrder);
    }
}
