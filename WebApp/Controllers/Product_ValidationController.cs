using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApp.Models;

namespace WebApp.Controllers
{
    public class Product_ValidationController : Controller
    {
        WebAppEntities db = new WebAppEntities();
        // GET: Product_Validation
        public ActionResult Index()
        {

            var list = db.tbl_Product.ToList();
            return View(list);
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(tbl_Product product)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.tbl_Product.Add(product);
                    db.SaveChanges();

                    TempData["msg"] = "Product Added Successfully";

                    return RedirectToAction("Create");
                }
                else
                {
                    return View();
                }
            }
            catch (Exception e)
            {
                TempData["msg"] = "Product Added Failed" + e.Message;
                return RedirectToAction("Create");
            }
          
        }
    }
}